package;

import flight._internal.backend.WebGl2Backend;

/** Runtime proof for the native WebGL drawing-buffer dimension seam. */
class GlDrawingBufferSmoke {
  public static function run():Void {
    #if !js
    final directContext:Dynamic = {
      drawingBufferWidth: 320,
      drawingBufferHeight: 180,
    };
    assertDimensions(directContext, 320, 180, 'context-owned dimensions');

    final surface = new GlDrawingBufferSurface(640, 360);
    final associatedContext = flight.RenderGl.createGlContextFromCanvasElement(cast surface);
    if (cast associatedContext != surface.context) throw 'GL context acquisition changed the host context identity';
    assertDimensions(associatedContext, 640, 360, 'associated surface dimensions');

    surface.width = 800;
    surface.height = 450;
    assertDimensions(associatedContext, 800, 450, 'live associated surface dimensions');

    var missingAssociationFailed = false;
    try {
      WebGl2Backend.drawingBufferWidth(cast {});
    } catch (error:Dynamic) {
      missingAssociationFailed = Std.string(error).indexOf('bindDrawingBufferSurface') >= 0;
    }
    if (!missingAssociationFailed) throw 'unassociated native GL context did not fail with binding guidance';
    #end
  }

  #if !js
  static function assertDimensions(context:Dynamic, width:Float, height:Float, label:String):Void {
    final actualWidth = WebGl2Backend.drawingBufferWidth(cast context);
    final actualHeight = WebGl2Backend.drawingBufferHeight(cast context);
    if (actualWidth != width || actualHeight != height) {
      throw '$label: expected ${width}x${height}, received ${actualWidth}x${actualHeight}';
    }
  }
  #end
}

#if !js
private class GlDrawingBufferSurface {
  public var width:Int;
  public var height:Int;
  public final context:Dynamic = {};

  public function new(width:Int, height:Int) {
    this.width = width;
    this.height = height;
  }

  public function getContext(contextId:String, ?options:Dynamic):Dynamic {
    if (contextId != 'webgl2') throw 'unexpected GL context id: $contextId';
    return context;
  }
}
#end
