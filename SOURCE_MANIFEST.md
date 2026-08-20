# Source manifest

The v0.1.1 source-inclusive release is based on these immutable upstream
commits:

| Component | Upstream repository | Tag | Commit |
| --- | --- | --- | --- |
| Pat | `https://github.com/la5nta/pat` | `v0.17.0` | `c1e1e1f9f2997bef86da5cba9bea5928b827982d` |
| wl2k-go | `https://github.com/la5nta/wl2k-go` | `v0.12.1` | `4beed4194d6b4c3ab4bbd35ddf3381e0faeaf637` |

The corresponding source snapshots are included in:

- `third_party/pat-v0.17.0/`
- `third_party/wl2k-go-v0.12.1/`

The actual N0JCG source change is the reproducible patch:

- `patches/0001-n0jcg-client-side-packet-rms.patch`

It is generated from the WES build source and applies to the two upstream
snapshots. It changes the client-side RMS handshake, dynamic secure-login
identity handling, and RF mailbox-index diagnostics. The build script applies
it automatically before compiling.

The N0JCG project packages the patched client for the WES appliance and
connects it to the appliance's runtime identity and mailbox/session boundary.
No callsign, mailbox, gateway, or password is compiled into the client.
