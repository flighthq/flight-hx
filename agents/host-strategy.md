# Host Strategy: Which Backends flight-hx Adopts, and Why

Status: design direction, 2026-08-28. Complements [`host-seams.md`](host-seams.md), which defines the
seam surface a host implements (`create*` backends plugged into upstream registration points:
app/loop, `GlSurface`, audio context, net, storage, fs, fonts/text-measure, image decode, cursor,
clipboard, dialog, scratch canvas). This document records *which* frameworks become host packages and
the reasoning, so the choice is not re-litigated.

## The governing rule

Under the constraint "do not add a fifth Flight render backend" (Flight already ships GL, WebGPU,
Canvas2D, and DOM, plus Cairo), **a host is viable iff it can hand an existing backend the primitive it
consumes** — a raw WebGL-shaped `GL`, a WebGPU `device`, a Canvas2D context, or a DOM. A framework that
owns its own render pipeline and exposes none of those cannot be a host without a new `render-*`
package, and is therefore out.

A second principle governs cross-port reuse: **the host is the deliberately target-native seam.** Share
the seam *contract* (the portable `create*` ABI), implement it natively per port. Do not share host
*implementations* across languages.

## Decisions

### hostClay — greenlit, the next Haxe host

Clay (snowkit lineage, the platform layer beneath Ceramic) exposes a raw WebGL-shaped `GL`, so
`render-gl` drops in with no new render package. It is delivered *as a Haxe library* — its native side
is a pinnable tree of linc bindings (`linc_sdl`, `linc_opengl`, `linc_openal`, `linc_stb`, …) that Clay
orchestrates — so from flight-hx's side it is a dependency to pin in `haxe_libraries/`, not a native
toolchain to author. flight-hx stays source-only; native binaries are produced at the consumer's build.

- Toolchain reality: Clay is toolchain-*encapsulated*, not toolchain-*free*, for native. The hxcpp C++
  compiler already exists (portability smoke); the new surface is the platform libraries the linc tree
  pulls in. Plan: author `hostClay`, **compile-check it in CI**, and gate the native window/GL
  *run*-smoke behind the step that brings the linc libs in.
- Divergences from `hostLime` to expect: no Cairo, so 2D rides `scene2d-gl` rather than a raster canvas;
  text-measure via `linc_stb` truetype rather than Lime's canvas `measureText`; image-decode via
  `linc_stb` rather than Lime's decoders.
- Due diligence: confirm Clay currently builds against the pinned Haxe 4.3.7 / hxcpp (it has had quiet
  stretches).
- Value: a second independent raw-GL host is the cleanest discharge of the portability non-negotiable
  ("compile and smoke-run on more than one target"). If the seam abstraction survives Clay, it is
  proven not Lime-specific.

### hostSdl — flight-rs's own Rust-native host, not re-bound into Haxe

For SDL-class capability, Clay and Lime already *are* the "SDL wrapped with Haxe bindings," through the
hxcpp/linc toolchain flight-hx already uses. Binding a Rust SDL crate into Haxe would add a second
toolchain (Rust + cbindgen + a cross-compile matrix) and an FFI boundary to obtain platform access
flight-hx already has, and would serve only native Haxe targets (web uses the browser regardless). So
`hostSdl` is authored in **flight-rs**, against the shared seam contract, using Rust-native crates
(`sdl2`/`winit`/`wgpu`). It is not imported back into Haxe. This keeps the two ports' toolchains and
release cycles decoupled.

### wgpu — sequenced after Clay; the one shared native component

`render-wgpu` already exists and speaks WebGPU, so native modern-GPU needs no new render package — only
a host that provisions a `GPUDevice`. This is the single native component worth sharing across ports,
because Haxe-land has no existing WebGPU provider (nothing to duplicate, unlike SDL):

- flight-rs uses the `wgpu` crate natively;
- flight-hx-native binds a WebGPU C ABI to feed the existing `render-wgpu`.
- Open sub-decision: **`wgpu-native` (Rust)** — the artifact shareable with flight-rs — **vs Dawn (C++)**
  — binds more naturally into hxcpp with no Rust build in the loop, but does not share upward. Both give
  Vulkan-backed WebGPU on Linux and both ship prebuilt libs (consuming either needs only the lib +
  header, not a source toolchain). Settle when wgpu work begins.
- Scope: the FFI path serves cpp/hl native only; web `render-wgpu` uses `navigator.gpu`.

### Vulkan — not a Lime/Clay concern

Lime and Clay are OpenGL/GLES/WebGL platforms with no Vulkan backend; they exist to feed `render-gl` a
GL context, and Vulkan buys `render-gl` nothing. Vulkan-class capability is structurally a `render-wgpu`
concern, delivered **transitively** as wgpu/Dawn's backend selection (Vulkan on Linux/Android/Windows,
Metal on macOS, D3D12 on Windows) — never as an API called directly. The only Haxe-native "direct
Vulkan" route is Kha's G5 via Kinc, which is the parked, abstraction-owning, needs-a-`render-*` option.
Conclusion: do not seek Vulkan through Lime or Clay; it arrives behind WebGPU.

### Kha, Heaps, Ceramic — parked

Each owns its render pipeline and exposes no raw context an existing backend consumes, so each requires
a `render-*` package (Kha maps to G4/G5, not raw GL; Heaps owns h2d/h3d; Ceramic owns its visual
system — its useful layer is Clay underneath). Kha's only unique draw is its target matrix, which does
not offset the cost of a render adapter while Clay/Lime cover the GL lane and wgpu covers the modern
lane. Their realistic role is *interop* (e.g. OpenFL display-list content alongside Flight), not hosting.

### The fifth render backend — deferred unless generic

A new `render-*` is justified only if it is a generic multiplexer, not a single framework's renderer:

- GPU side — `sokol_gfx` or `bgfx` multiplex GL/GLES/D3D/Metal/Vulkan/WebGPU behind one API and could
  *collapse* `render-gl` + `render-wgpu` + native APIs into one backend (sokol is a single header, far
  cheaper to bind than the alternatives). This is the "suitably generic like Skia" bar on the 3D side.
- 2D side — Skia generalizes the Cairo lane (GPU-capable, many backends) but is 2D-only and a heavy C++
  build/bind.
- `render-openfl` / `render-heaps` / `render-kha` are framework-specific and fail the bar; their value
  is interop, not a backend.

## Sequencing

1. **hostClay** now — author, compile-check in CI, native run-smoke gated on the linc libs.
2. **wgpu** next — provision a `GPUDevice` for `render-wgpu`; decide `wgpu-native` vs Dawn.
3. **hostSdl** lives in flight-rs (Rust-native), sharing the seam contract and (via wgpu-native) the
   WebGPU boundary — not re-bound into Haxe.
4. Kha parked; no fifth render backend unless a multiplexer (sokol/bgfx) or Skia earns it.

## Open items

- Confirm Clay builds against pinned Haxe 4.3.7 / hxcpp; enumerate the exact linc dependency set to pin.
- `wgpu-native` vs Dawn for the native WebGPU host.
- Whether the seam contract is expressed formally enough in the portable ABI for flight-rs to implement
  `hostSdl` against it directly.
