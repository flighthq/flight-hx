if (width <= 0 || height <= 0) return null;
final canvas:flighthq._internal.dom.HTMLCanvasElement = cast flighthq._internal.backend.DomDocumentBackend.call(
  flighthq._internal.backend.DomDocumentBackend.value(),
  'createElement',
  cast (['canvas'] : Array<Dynamic>)
);
if (canvas == null) return null;
flighthq._internal.backend.CanvasElementBackend.setField(canvas, 'width', width);
flighthq._internal.backend.CanvasElementBackend.setField(canvas, 'height', height);
final ctx:flighthq._internal.dom.CanvasRenderingContext2D = cast flighthq._internal.backend.CanvasElementBackend.call(
  canvas,
  'getContext',
  cast (['2d'] : Array<Dynamic>)
);
if (ctx == null) return null;
var raw:flighthq._internal.dom.ImageData;
try {
  flighthq._internal.backend.Canvas2dBackend.call(ctx, 'drawImage', cast ([source, 0.0, 0.0] : Array<Dynamic>));
  raw = cast flighthq._internal.backend.Canvas2dBackend.call(
    ctx,
    'getImageData',
    cast ([0.0, 0.0, width, height] : Array<Dynamic>)
  );
} catch (_:Dynamic) {
  return null;
}
final bitmap:Bitmap = cast createEntity(cast {
  alphaType: 'straight',
  gamut: cast _Runtime.field(raw, 'colorSpace'),
  data: _Runtime.field(raw, 'data'),
  format: 'rgba8unorm',
  height: height,
  kind: BitmapTextureSourceKind,
  version: 0.0,
  width: width,
});
return bitmap;
