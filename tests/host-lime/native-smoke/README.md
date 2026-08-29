# HostLime native window smoke

This fixture builds and runs a real Lime Linux/hxcpp application under Xvfb. It complements the interpreter and HTML5 compile checks: those prove Haxe binding compatibility, while this proves that native Lime creates a window and GL context that Flight can actually control.

The smoke verifies:

- host-owned attachment and Flight-owned open/close semantics;
- native title, size, bounds, move, and resize integration;
- physical-pixel dimensions through `GlSurface` and the associated GL context;
- a Flight background clear read back from the real native framebuffer.

`npm run test:haxe:lime:native` builds with the repository-pinned Lime and hxcpp revisions, runs under software Mesa, and exits nonzero on any failed assertion or timeout. The Linux host needs Neko, Xvfb, and the runtime libraries required by Lime's prebuilt native binary.
