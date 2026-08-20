# Client-side Packet RMS behavior

The N0JCG build is a Packet RMS client. The remote station is the RMS server;
the local station is the client. The implementation must therefore continue
the client turn after the AX.25 link and CMS handoff.

Expected exchange, abbreviated:

1. AX.25 SABM/UA establishes the packet link.
2. RMS sends its Winlink banner, PQ challenge, and `CMS via ... >` prompt.
3. The client sends `;FW`, the PAT identification, and `;PR` as required.
4. The client sends `FF` to request the mailbox proposal/index.
5. The client accepts eligible proposals with `FS` and receives message data.
6. The client closes cleanly with `FQ`.

The build must not wait for a gateway-specific or invented text prompt. The
`CMS via ... >` line is the normal handoff point for the standard client
protocol. This behavior is compatible with RMS gateways that implement the
Winlink Packet RMS protocol; it is not tied to one gateway callsign.
