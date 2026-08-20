# N0JCG Packet Assembly and Transport v0.1.0

Initial client-side Packet RMS release for the N0JCG Winlink Email Server.

Highlights:

- Linux ARM64 executable for Raspberry Pi 4 and compatible systems.
- Standard Packet RMS client handshake after the CMS prompt.
- Normal `FF`, `FS`, and `FQ` mailbox flow.
- Runtime identity support for any authenticated Winlink user.
- No hard-coded N0JCG mailbox, gateway, or password.
- Build and protocol notes for operators and maintainers.

This release is intended for controlled RF field testing with a DigiRig and a
properly configured 1200-baud AFSK packet radio path.
