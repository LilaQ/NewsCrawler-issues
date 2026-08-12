# NewsBar Privacy Notice — Release Draft

Status: **NOT FINAL / OWNER APPROVAL AND LEGAL IDENTITY REQUIRED**
Last technical review: 2026-08-12

NewsBar is designed without an owner-operated account system, analytics SDK, advertising SDK, tracking SDK, or content-proxy backend.

## Data stored on the Mac

NewsBar stores preferences, enabled and custom feed sources, topic follow/mute rules, notification deduplication identifiers, local recommendation counters, read state, and bookmarks in local app storage. It does not transmit this reading profile to an owner-operated service.

## Direct publisher requests

The app contacts configured publishers directly to retrieve RSS/Atom feeds, Hacker News API data, and article pages. Those providers receive ordinary technical connection data such as the device IP address and may apply their own privacy policies. Article pages load in a non-persistent WebKit session but can still run publisher scripts and analytics during that session.

## Notifications

Optional macOS local notifications can show a user-requested topic match or Morning Brief reminder. NewsBar does not register for remote push notifications, upload a device token, or operate a notification server.

## On-device text processing

The default-enabled German presentation setting locally rewrites common gender markers, paired forms, and nominalized participles in feed text, notifications, and visible text inside embedded article pages. NewsBar does not persist a rewritten copy of the publisher content. The reader labels the adjusted presentation and keeps a link to the unchanged original page.

On macOS 26, a Premium user may explicitly request a perspective comparison for a story cluster. NewsBar supplies up to eight visible headlines and feed summaries to Apple's Foundation Model running on the device. NewsBar does not upload that evidence or generated response to an owner-operated server and does not train a model. Apple Intelligence availability and processing remain subject to Apple's platform behavior and terms.

## Purchases

Apple processes App Store purchase and transaction information. NewsBar reads verified StoreKit entitlements to unlock Premium; the current implementation does not send purchase data to an owner backend.

## User choices

People can disable sources, remove custom sources and topic rules, clear local recommendations, revoke notification permission in macOS System Settings, and remove the app's local data by deleting the application data container.

## Required before release

The final notice must add the owner/controller identity, postal address, approved privacy contact, effective date, applicable rights and complaint channels, retention details, territories, and owner-approved public URL. The final wording must be reviewed against the signed binary and App Store privacy disclosures.
