if (width <= 0 || height <= 0) return null;
final canvas:flight._internal.dom.HTMLCanvasElement = cast flight._internal.backend.DomDocumentBackend.call(
  flight._internal.backend.DomDocumentBackend.value(),
  'createElement',
  cast (['canvas'] : Array<Dynamic>)
);
if (canvas == null) return null;
flight._internal.backend.CanvasElementBackend.setField(canvas, 'width', width);
flight._internal.backend.CanvasElementBackend.setField(canvas, 'height', height);
final ctx:flight._internal.dom.CanvasRenderingContext2D = cast flight._internal.backend.CanvasElementBackend.call(
  canvas,
  'getContext',
  cast (['2d'] : Array<Dynamic>)
);
if (ctx == null) return null;
var raw:flight._internal.dom.ImageData;
try {
  flight._internal.backend.Canvas2dBackend.call(ctx, 'drawImage', cast ([source, 0.0, 0.0] : Array<Dynamic>));
  raw = cast flight._internal.backend.Canvas2dBackend.call(
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
