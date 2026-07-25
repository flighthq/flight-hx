// Maintained runtime support for generated Flight Haxe.
package flighthq._internal.backend;

/**
 * Native stand-in for the scratch DOM canvases Flight's renderers create with
 * `document.createElement('canvas')`. Backed by a cairo image surface through
 * `NativeCanvas2dContext`, so the raster fallback paths (strokes, gradients,
 * text) work on native targets; sizing follows canvas semantics (assigning
 * `width`/`height` reallocates and clears the surface).
 */
// Reached reflectively from generated code, so full DCE must not strip it.
// `width`/`height` stay plain physical fields: generated code assigns them
// through a structural canvas type, which bypasses property setters on some
// targets, so the 2D context re-checks them lazily before every operation.
@:keep
class NativeScratchCanvas {
  public var width:Int = 0;
  public var height:Int = 0;

  #if (lime && !js && lime_cairo)
  final context:NativeCanvas2dContext = new NativeCanvas2dContext();

  public function new() {
    context.canvas = this;
    context.scratchOwner = this;
  }

  public function getContext(contextId:String, ?options:Dynamic):Dynamic {
    return context;
  }

  /** Typed access for maintained code (GL texture handoff). */
  public function nativeContext():NativeCanvas2dContext {
    return context;
  }

  #else
  public function new() {}

  public function getContext(contextId:String, ?options:Dynamic):Dynamic {
    return null;
  }
  #end
}
