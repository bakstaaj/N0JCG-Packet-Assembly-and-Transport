# N0JCG Packet Assembly and Transport

Client-side Packet RMS transport for the N0JCG Winlink Email Server appliance.

PAT means **Packet Assembly and Transport**. The original PAT project is a
Winlink client/transport implementation. This repository publishes the N0JCG
client-side ARM64 build used by the appliance when connecting to a Packet RMS
gateway.

## Scope

This is a downstream client build, not an RMS gateway and not a replacement
for the Winlink CMS or LinBPQ. It is designed to:

- establish a normal AX.25 Packet RMS client session;
- process the RMS banner, challenge, and `CMS via ... >` handoff;
- send the standard PAT/Winlink client handshake (`;FW`, PAT SID, `;PR`);
- request the mailbox index with `FF` and mailbox data with `FS`;
- preserve the logged-in Winlink identity supplied by the calling appliance.

No callsign, mailbox, gateway, or user password is compiled into this build.
The active WES session supplies those values at runtime, so the same client
can serve any valid `winlink.org` user.

## Release artifact

The first release is for Raspberry Pi 4 and other Linux ARM64 systems:

```text
N0JCG-Packet-Assembly-and-Transport-v0.1.0-linux-arm64.tar.gz
```

The archive contains the `pat` executable, build notes, notices, and a SHA-256
checksum. Verify the checksum before installing it on an appliance.

## Install on a Raspberry Pi

The N0JCG Winlink Email Server deployment script installs this artifact as
`/usr/local/bin/pat` when it is bundled in the WES release package. For a manual
installation:

```sh
tar -xzf N0JCG-Packet-Assembly-and-Transport-v0.1.0-linux-arm64.tar.gz
sudo install -m 0755 pat /usr/local/bin/pat
pat version
```

The binary must be run on Linux ARM64; it is not a Windows executable.

## Protocol behavior

The client-side change is intentionally limited to the outgoing Packet RMS
path. After AX.25 establishes the link, the client continues through the
standard RMS/CMS handoff and emits the normal Winlink client sequence. Telnet
and unrelated server-led transports retain the upstream behavior. See
[`docs/client-side-rms.md`](docs/client-side-rms.md) and
[`BUILD_NOTES.md`](BUILD_NOTES.md).

## Relationship to upstream

This package is based on official Pat v0.17.0 and wl2k-go v0.12.1. It is a
N0JCG downstream build intended to solve the client-side Packet RMS handoff
needed by the WES appliance. Upstream attribution and licensing remain
applicable; see [`NOTICE.md`](NOTICE.md).

## Status

Version 0.1.0 is a release candidate for field testing. RF operation still
requires a correctly wired radio, DigiRig, packet modem/audio path, and an
appropriate RMS gateway. A successful binary installation alone does not
prove RF or PTT operation.
