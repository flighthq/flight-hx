final contextAttributes:flight._internal.dom.WebGLContextAttributes = cast flight._internal._Runtime.mergeObjects([
  { alpha: true },
  { antialias: flight._internal._Runtime.coalesce(flight._internal._Runtime.field(options, 'antialias'), function():Dynamic return true) },
  { powerPreference: flight._internal._Runtime.coalesce(flight._internal._Runtime.field(options, 'powerPreference'), function():Dynamic return 'default') },
  { stencil: true },
  flight._internal._Runtime.field(options, 'contextAttributes'),
]);
final context:Dynamic = flight._internal.backend.CanvasElementBackend.call(
  canvas,
  'getContext',
  cast (['webgl2', contextAttributes] : Array<Dynamic>)
);
if (context == null) {
  flight._internal._Runtime.throwValue(flight._internal._Runtime.error('Failed to get WebGL2 context.'));
}
flight._internal.backend.WebGl2Backend.bindDrawingBufferSurface(cast context, canvas);
return cast context;
