# N0JCG client-side PAT build notes

Release: `v0.1.0`

## Inputs

- Official Pat: `v0.17.0`
- `wl2k-go`: `v0.12.1`
- Target: `linux/arm64`
- Appliance use: Packet RMS client sessions from the N0JCG Winlink Email
  Server

## Client-side behavior

The outgoing Packet RMS exchange remains in the normal FBB client-turn mode:

```text
exchange(conn, url.Target, false)
```

The published upstream source consumes the RMS SID/challenge and prompt, then
sends the complete standard client handshake after the prompt:

```text
;FW: <active Winlink identity>
[Pat-0.17.0-...]
;PR: <protocol revision when challenged>
```

The client then continues with the normal mailbox sequence, including `FF`,
`FS`, and `FQ`. This is standard Winlink/PAT behavior; it is not a custom RMS
protocol.

## Identity and security boundary

The executable has no N0JCG callsign or mailbox identity embedded in it. The
calling WES session supplies the authenticated user identity and password at
runtime. The binary does not create or share a common mailbox between users.

The secure-login password must be supplied by the authenticated WES session;
it is never stored in this repository or release notes.

## Artifact provenance

The released executable is the ARM64 binary already validated in the N0JCG
Winlink Email Server appliance package. Its SHA-256 digest is recorded in
`SHA256SUMS` inside the release archive and in the GitHub release assets.

The source-inclusive v0.1.1 release adds the exact upstream source snapshots,
their licenses, and a build script. No unverified N0JCG protocol diff is
claimed: the client-side handshake behavior is present in the upstream source
versions listed above. N0JCG-specific work is the appliance integration,
runtime identity handling, packaging, and deployment boundary.
