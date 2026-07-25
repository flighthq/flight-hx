// Maintained runtime support for generated Flight Haxe.
package flighthq._internal.backend;

/**
 * Native stand-in for the scratch DOM canvases Flight's GL renderers create
 * eagerly (`document.createElement('canvas')`) for their raster fallback
 * paths. Creation and sizing must succeed so the GPU mesh path can run; the 2D
 * context object it hands out is only a marker — every actual drawing call on
 * it dispatches through `Canvas2dBackend`, whose Lime branch fails loudly until
 * a native raster backend exists.
 */
// Reached reflectively from generated code, so full DCE must not strip it.
@:keep
class NativeScratchCanvas {
  public var width:Int = 0;
  public var height:Int = 0;

  final context = new NativeScratch2dContext();

  public function new() {}

  public function getContext(contextId:String, ?options:Dynamic):Dynamic {
    return context;
  }
}

/** Marker 2D context for `NativeScratchCanvas`; carries no drawing surface. */
@:keep
class NativeScratch2dContext {
  public function new() {}
}
