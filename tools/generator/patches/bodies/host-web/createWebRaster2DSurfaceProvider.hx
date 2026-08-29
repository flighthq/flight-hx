return cast {
  createRaster2DSurface: function(width:Float, height:Float):Dynamic {
    final canvas:flight._internal.dom.HTMLCanvasElement = cast flight._internal.backend.DomDocumentBackend.call(
      flight._internal.backend.DomDocumentBackend.value(),
      'createElement',
      cast (['canvas'] : Array<Dynamic>)
    );
    if (canvas == null) return null;
    flight._internal.backend.CanvasElementBackend.setField(canvas, 'width', width);
    flight._internal.backend.CanvasElementBackend.setField(canvas, 'height', height);
    final context:flight._internal.dom.CanvasRenderingContext2D = cast flight._internal.backend.CanvasElementBackend.call(
      canvas,
      'getContext',
      cast (['2d'] : Array<Dynamic>)
    );
    if (context == null) return null;
    final surface:Dynamic = {
      width: width,
      height: height,
      context: context,
      image: flight.Image.createImageResource(canvas),
    };
    return flight._internal.DynamicObject.defineProperties(surface, {
      width: {
        configurable: true,
        enumerable: true,
        get: function():Dynamic return flight._internal.backend.CanvasElementBackend.field(canvas, 'width'),
        set: function(value:Dynamic):Dynamic return flight._internal.backend.CanvasElementBackend.setField(canvas, 'width', value),
      },
      height: {
        configurable: true,
        enumerable: true,
        get: function():Dynamic return flight._internal.backend.CanvasElementBackend.field(canvas, 'height'),
        set: function(value:Dynamic):Dynamic return flight._internal.backend.CanvasElementBackend.setField(canvas, 'height', value),
      },
    });
  },
  destroyRaster2DSurface: function(surface:Dynamic):Void {
    flight._internal._Runtime.setField(surface, 'width', 0.0);
    flight._internal._Runtime.setField(surface, 'height', 0.0);
  },
};
