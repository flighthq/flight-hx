# host-lime

A [Lime](https://lime.openfl.org/) host for the generated Flight Haxe SDK: it runs a Flight scene inside a Lime application and renders it through Flight's WebGL renderer, on any Lime target (HTML5, Windows, macOS, Linux, …).

`flighthq.lime.LimeHost` opens Lime's window, binds Flight's GL renderer to the window's render context, and pumps Flight's per-frame update and render from Lime's loop. `flighthq.lime.LimeGlCanvas` is the small adapter that makes Lime's GL context look like the `canvas` object `flighthq.RenderGl.createGlRenderState` expects — Flight only ever calls `getContext('webgl2', …)` on it, so no change to the generated SDK is needed.

> **Status: unverified.** This package was written against Lime's API without a Lime toolchain available to compile against (haxelib is network-blocked in the authoring sandbox). The Flight-side calls are checked against the generated `flighthq.Sdk`; the Lime-side calls are not yet compiled. Build it with `lime` to confirm. The one spot most likely to need a tweak per Lime version is how the WebGL2 context is reached from `window.context` — see `LimeGlCanvas.resolveContext`.

## Usage

Subclass `LimeHost`, build the scene in `flightReady`, advance it in `flightUpdate`, and assign the scene root to `root`. Input is ordinary Lime — override `onKeyDown`, `onMouseDown`, etc.

```haxe
import flighthq.Sdk;
import flighthq.ClockApi;

class Main extends flighthq.lime.LimeHost {
  var rootClock:Dynamic;

  override function flightReady():Void {
    root = Sdk.createDisplayObject();
    rootClock = ClockApi.createClock();
    // ... build shapes/text, add children to root ...
  }

  override function flightUpdate(deltaSeconds:Float):Void {
    ClockApi.advanceClock(rootClock, deltaSeconds);
    // ... update transforms, Sdk.invalidateNodeLocalTransform(...), ...
  }
}
```

## Building

Lime apps build from a `project.xml`. Point it at both the generated SDK classpath (`src`) and this host (`hosts/lime`), depend on `lime`, and request a hardware (GL) window:

```xml
<?xml version="1.0" encoding="utf-8"?>
<project>
  <meta title="Flight Clock" package="hq.flight.clock" version="0.0.1" />
  <app main="Main" file="FlightClock" />

  <window width="800" height="500" fps="60" hardware="true" vsync="true" />

  <!-- generated Flight SDK + this Lime host -->
  <classpath name="../../src" />
  <classpath name="../../hosts/lime" />
  <classpath name="src" />

  <haxelib name="lime" />
  <haxelib name="jsasync" /> <!-- Flight's async runtime, per haxe_libraries -->
</project>
```

Then, from the example directory:

```
lime test html5      # or: windows | mac | linux
```

Paths above are relative to an example directory two levels below the repo root (e.g. `examples-lime/clock/`); adjust `classpath` for your layout.
