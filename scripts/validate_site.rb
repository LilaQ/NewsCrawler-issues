#!/usr/bin/env ruby

require 'pathname'

root = Pathname.new(File.expand_path('..', __dir__))
docs = root.join('docs')
expected = ['index.html'] + %w[en de fr es].flat_map do |locale|
  %w[support privacy terms accessibility].map { |page| "#{locale}/#{page}.html" }
end

missing = expected.reject { |path| docs.join(path).file? }
abort "Missing public pages: #{missing.join(', ')}" unless missing.empty?

errors = []
expected.each do |relative|
  path = docs.join(relative)
  html = path.read
  errors << "#{relative}: missing doctype" unless html.match?(/\A<!doctype html>/i)
  errors << "#{relative}: missing UTF-8 charset" unless html.include?('charset="utf-8"')
  errors << "#{relative}: missing responsive viewport" unless html.include?('name="viewport"')
  errors << "#{relative}: missing title" unless html.match?(/<title>.+<\/title>/i)
  errors << "#{relative}: missing main landmark" unless html.include?('<main')

  html.scan(/(?:href|src)="([^"]+)"/).flatten.each do |target|
    next if target.start_with?('https://', 'mailto:', '#')
    resolved = path.dirname.join(target.split('#').first).cleanpath
    errors << "#{relative}: broken local link #{target}" unless resolved.file?
  end
end

unless errors.empty?
  warn errors.join("\n")
  exit 1
end

puts "OK: #{expected.length} localized public pages and their local links"
