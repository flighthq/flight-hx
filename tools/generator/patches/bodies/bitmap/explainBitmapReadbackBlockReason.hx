if (width <= 0 || height <= 0) return cast 'empty-size';
final canvas:flight._internal.dom.HTMLCanvasElement = cast flight._internal.backend.DomDocumentBackend.call(
  flight._internal.backend.DomDocumentBackend.value(),
  'createElement',
  cast (['canvas'] : Array<Dynamic>)
);
if (canvas == null) return cast 'no-canvas';
flight._internal.backend.CanvasElementBackend.setField(canvas, 'width', 1.0);
flight._internal.backend.CanvasElementBackend.setField(canvas, 'height', 1.0);
final ctx:flight._internal.dom.CanvasRenderingContext2D = cast flight._internal.backend.CanvasElementBackend.call(
  canvas,
  'getContext',
  cast (['2d'] : Array<Dynamic>)
);
if (ctx == null) return cast 'no-canvas';
try {
  flight._internal.backend.Canvas2dBackend.call(ctx, 'drawImage', cast ([source, 0.0, 0.0] : Array<Dynamic>));
  flight._internal.backend.Canvas2dBackend.call(ctx, 'getImageData', cast ([0.0, 0.0, 1.0, 1.0] : Array<Dynamic>));
} catch (_:Dynamic) {
  return cast 'tainted-source';
}
return cast 'ok';
