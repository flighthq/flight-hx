# hostClay / hostLime → canonical `Host` migration blueprint

Prep for reworking both host adapters to the develop host-seam refactor (upstream `2cf1c5cef` → `31c77cd6f`, 271 commits). The pin bump + regenerate + typed-struct registry re-audit is builder's; this file is the adapter-side plan so the rework can start the moment the regenerated base lands. **Design only** — no adapter code changes until `createHost` and the `Host` contract are visible in `generated/`.

## What changed upstream

- **Canonical `Host` constructor** — `packages/entity/src/host.ts`: `createHost({ capabilities })` builds one `Host` **entity** by composing per- capability namespaces, defaulting every namespace to `{}`.
- **`Host` is a 26-namespace entity** (`packages/types/src/Host.ts`): `accessibility, app, clipboard, connectivity, dialog, graphics, input, ipc, media, menu, midi, net, notification, power, protocol, screen, share, shell, shortcut, storage, system, text, tray, ui, updater, window`. Each is a `Host<X>Capabilities` group of **optional** backend fields (e.g. `HostAppCapabilities = { activate?, activationPolicy?, allWindowsClosed?, … }`); `window` is a `WindowBackend` directly.
- **Explicit-Host DI** — services take the host as a structural-subset first param: `sendNetRequest(host: HasNetHttp, …)`, net/socket migrated off global setters (upstream `6b83a3f50` net R3, `dbebb2241` socket, `f774ec4bc` canonical Host).
- **Host packages compose + enable** — `host-web/webHost.ts` builds the `Host` via `createHost({ … })` from per-capability providers (`webNetBackend`, `webWindowBackend`, `webClipboardHost`, …); `enableHostWeb*` installers coexist.

## Current adapter inventory (per-backend install model, to be replaced)

- **hostClay** installs 19: App, AudioDevice, Audio, BitmapEncode, BitmapReadback, Clipboard, Dialog, FileSystem, FontLoading, Haptics, InputIngress, Lifecycle, Loop, Net, Platform, Screen, Storage, VideoCapability, + TextLayout measure.
- **hostLime** installs 13: App, Clipboard, Dialog, FileSystem, GlyphRasterizer, Haptics, Image, Lifecycle, Loop, Platform, Screen, Storage, Window.

## Migration mapping (current backend → new `Host` namespace)

| Current install…                                          | New namespace / field                         |
| --------------------------------------------------------- | --------------------------------------------- |
| App, Lifecycle, Loop                                      | `app.*` (activate, allWindowsClosed, loop, …) |
| Clipboard                                                 | `clipboard`                                   |
| Dialog                                                    | `dialog`                                      |
| Net                                                       | `net` (http/socket)                           |
| Window (Lime) / GL surface (Clay)                         | `window` (`WindowBackend`) + `graphics`       |
| AudioDevice, Audio, VideoCapability                       | `media`                                       |
| InputIngress (Clay) / Input                               | `input`                                       |
| Bitmap\*, FontLoading, GlyphRasterizer, Image, TextLayout | `graphics` / `text`                           |
| Screen                                                    | `screen`                                      |
| Storage                                                   | `storage`                                     |
| FileSystem, Platform                                      | `system` (confirm placement)                  |
| Haptics                                                   | device-level — confirm it has a Host home     |

Target shape (illustrative Haxe, exact surface TBD from `generated/`): `ClayHost.createClayHost() : Host` returning `createHost({ app: …, clipboard: …, net: …, window: …, media: …, … })`; `enableHostClay()` composes it and wires it into the app/loop injection point.

## Open questions — resolve against the regenerated base, do not guess

1. Haxe surface of `createHost` and `Host` — module path (`flight.Entity.createHost`? `flight.types.Host`?), and how the 26 `Host<X>Capabilities` groups are named/typed.
2. **Injection point**: with explicit-Host DI, how does the app/loop obtain the composed `Host`? Is there a global host slot (`enable*`/`setHost` equivalent) in the generated Haxe, or is `Host` threaded as a param? This decides whether `enableHostClay`/`enableHostLime` stays a global installer or returns a `Host`.
3. Which current backends have **no** `Host` namespace (e.g. Haptics, hxcpp bitmap readback) — keep as separate services vs. drop.
4. `window` is a bare `WindowBackend`: reconcile with Clay's window-scoped GL surface wiring (`GlSurface`) and Lime's `LimeWindow` (builder's `WindowBackend`, landed).
5. Whether the develop regen renames/moves any backend the adapters already target.

## Sequence

1. **builder**: bump submodule to `31c77cd6f`, full regenerate, registry re-audit/ relock, resolve collisions; land the regenerated base.
2. **review (me)**: answer the open questions from `generated/`, then rework `src/flight/hostClay/**` and `src/flight/hostLime/**` to `createHost` composition; verify via the `host-backends` CI (clay-native, lime-host incl. native window, web).
