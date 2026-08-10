if (width <= 0 || height <= 0) return cast 'empty-size';
final canvas:flighthq._internal.dom.HTMLCanvasElement = cast flighthq._internal.backend.DomDocumentBackend.call(
  flighthq._internal.backend.DomDocumentBackend.value(),
  'createElement',
  cast (['canvas'] : Array<Dynamic>)
);
if (canvas == null) return cast 'no-canvas';
flighthq._internal.backend.CanvasElementBackend.setField(canvas, 'width', 1.0);
flighthq._internal.backend.CanvasElementBackend.setField(canvas, 'height', 1.0);
final ctx:flighthq._internal.dom.CanvasRenderingContext2D = cast flighthq._internal.backend.CanvasElementBackend.call(
  canvas,
  'getContext',
  cast (['2d'] : Array<Dynamic>)
);
if (ctx == null) return cast 'no-canvas';
try {
  flighthq._internal.backend.Canvas2dBackend.call(ctx, 'drawImage', cast ([source, 0.0, 0.0] : Array<Dynamic>));
  flighthq._internal.backend.Canvas2dBackend.call(ctx, 'getImageData', cast ([0.0, 0.0, 1.0, 1.0] : Array<Dynamic>));
} catch (_:Dynamic) {
  return cast 'tainted-source';
}
return cast 'ok';
