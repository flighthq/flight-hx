# HostLime maturity

HostLime is a usable native host profile, not yet a complete implementation of every Flight platform service. The whole package is verified against Haxe 4.3.7 and pinned Lime 8.3.2 on Eval and HTML5 by `npm run test:haxe:lime` and `npm run test:haxe:lime:html5`; the clean 28-example HTML5 fleet plus Neko and Linux/hxcpp audio builds provide cross-target compile coverage for the rendering integration surface. Hardware-dependent playback, dialogs, clipboard, vibration, and live window behavior still require interactive platform validation.

## Installation and ownership

`HostLime.enableHostLime(application)` is the supported registration door. It installs capability backends through Flight's protected host slots, is idempotent for the same `Application`, and leaves custom overrides in front. Call it after the first Lime window exists so the dialog backend can be installed too. Individual `enableHostLime*` functions support deliberately smaller profiles.

Construction is passive where the contract permits it. The loop listens to `Application.onUpdate` only while frames are pending; clipboard observation starts on first use; lifecycle and screen listeners are attached only by their corresponding Flight subscriptions. Per-window GL/Cairo surfaces and cursor adapters, and per-context audio, remain caller-owned.

## Capability matrix

| Area | Level | Implemented | Deliberate limits |
| --- | --- | --- | --- |
| App | supported subset | name/version metadata, app paths, argv/executable, locale, focus, show/hide, quit, activation/ready/quit subscriptions | no dock, badge, login-item, relaunch, recents, attention, or single-instance integration |
| Lifecycle | supported | active/inactive/background transitions from Lime window events; cold launch kind | no memory-pressure signal; Lime cannot distinguish every OS suspension state |
| Frame loop | supported | request/cancel frame and monotonic time over Lime updates | callbacks follow Lime's frame cadence |
| Graphics | supported GL/Cairo path | presentable Lime GL surface, native GL dispatch, Cairo surface path, font registration | no native WebGPU device; surface disposal is still caller-owned |
| Input | integration pattern | examples forward Lime mouse, keyboard, wheel, and text events into Flight | no umbrella input/window backend; gamepad, touch, IME composition, and multi-window routing need a defined ownership model |
| Audio | beta | buffer creation/decoding, buffer sources, gain, stereo pan, pitch, looping, suspend/resume/close | buffered playback only; immediate parameter ramps; future scheduling is not preserved; single-output node graph; no streaming/worklets/media-element path |
| HTTP | beta implementation, blocked integration | native `lime.net.HTTPRequest`, headers/body, progress, timeout, abort, redirects, text/JSON/binary responses | Flight Net has no host install slot, so `enableHostLime()` cannot register it without violating backend precedence; final redirect URL is unavailable |
| Sockets | absent | — | Flight's ambient socket seam has no HostLime implementation |
| Filesystem | supported core | text/binary/range/atomic writes, files/directories, walk/stat/copy/rename, access probes, canonical paths, Lime native watching | streams, symlinks, POSIX permissions, executable probe, and disk-usage metrics are unavailable through portable Haxe/Lime APIs |
| Storage | supported single process | atomic JSON persistence, namespaces through Flight, byte sizing | no cross-process locking or external-change subscription |
| Clipboard | supported text subset | read/write/clear, `text/plain` formats/items, change count/subscription | Lime exposes no HTML, RTF, image, bookmark, or file clipboard flavors |
| Dialog | mixed | native open/save/directory pickers and single-button message alert | Lime has no confirm or text-prompt API; these return Flight's false/null sentinels rather than fabricating user input |
| Platform | supported | OS name/kind/version, locale, runtime, endianness, compile-time architecture where available | engine/build/detailed distro fields remain sentinel values when Lime cannot report them |
| Screen | supported subset | display enumeration, geometry/work area, DPI/modes/orientation, resize/orientation events, last observed cursor position | add/remove display events and reliable built-in/HDR/touch metadata are not exposed by Lime |
| Haptics | conservative subset | duration vibration plus short selection/impact/notification mappings on mobile | no arbitrary patterns, amplitude, waveform, or reliable desktop capability probe |
| Shell and OS services | absent | — | connectivity, device inventory, permissions, power, share, notifications, protocol handlers, updater, tray/status bar, accessibility, webcam, and shell operations remain sentinels |

## Flight issues and design forks

1. **Net needs host-layer installation.** `NetBackend` has `setNetBackend` but no `installNetHostBackend`. HostLime therefore cannot provide native HTTP through the normal enabler while preserving the library-wide precedence rule. Adding the host slot is the recommended upstream fix.
2. **Broad backend interfaces obscure partial support.** App, Dialog, and FileSystem require one monolithic backend even when a host owns only some operations. HostLime composes App with Flight's capability-owned sentinel and uses documented sentinels elsewhere, but `explain*Backend()` can only report at backend granularity. Operation-level capability/viability or composable partial backends would make support claims precise.
3. **Window ownership needs an owner call.** Flight's `ApplicationWindow` model can either create/own Lime windows or attach to windows the Lime application already owns. The current profile chooses attachment and leaves `WindowBackend` uninstalled. Owning creation would enable the full Flight window API but risks fighting OpenFL/Lime application lifecycle and requires a durable two-way identity map. Recommended default: attachment-first, with an explicit opt-in owned-window adapter later.
4. **Input routing has the same ownership seam.** Examples currently forward Lime callbacks explicitly. A generic adapter needs decisions for capture order, coordinate scaling, IME/text composition, touch-to-pointer policy, gamepad identity, and multiple windows. Recommended default: small per-window adapters rather than hidden global listeners.
5. **Audio is protocol injection, not a host backend.** Flight accepts an `AudioContext` per mixer/resource operation. Keeping `LimeAudio.createLimeAudioContext()` explicit matches that contract, but a future native audio backend would be the better home for streaming and scheduling guarantees.
6. **Native WebGPU is not a Lime facility.** HostLime should not manufacture a WGPU-shaped no-op. If Flight wants native WebGPU, that belongs behind a generic graphics-device seam with a concrete native implementation, while HostLime supplies only window/surface integration.

## Verification boundary

The smoke test executes backend installation and precedence, app/platform/lifecycle factories, passive listener behavior, honest headless dialog results, pinned Lime audio offset/duration mapping, atomic text replacement, Flight `UInt8Array` binary round trips, and persistent storage. It compiles the entire `flight.hostLime` namespace through the real Lime library. Hardware behaviors—window creation, GL presentation, audio device output, haptics, native dialogs, watcher notifications, and HTTP transport—still require target/device smoke coverage and must not be inferred solely from the interpreter test.
