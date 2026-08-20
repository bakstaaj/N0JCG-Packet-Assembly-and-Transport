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

The standard Packet RMS client handshake is implemented in the upstream
source. The N0JCG project packages that client for the WES appliance and
connects it to the appliance's runtime identity and mailbox/session boundary.
No callsign, mailbox, gateway, or password is compiled into the client.

The earlier binary-only package described this behavior as a downstream build
change. The source-inclusive release corrects that wording and makes the
upstream implementation available for independent review.
