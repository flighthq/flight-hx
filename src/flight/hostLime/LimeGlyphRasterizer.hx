package flight.hostLime;

#if lime
import Math as HxMath;
import flight._internal._Runtime;
import flight._internal._UInt8ClampedArray;
import flight.types.GlyphMetrics;
import flight.types.GlyphRasterizedBitmap;
import flight.types.GlyphRasterizerBackend;
import flight.types.GlyphRasterizeOptions;

/** Canvas-compatible glyph rasterization over Lime's native Cairo surface. */
class LimeGlyphRasterizer {
  public static function createLimeGlyphRasterizerBackend():Null<GlyphRasterizerBackend> {
    #if js
    return flight._HostWeb.createWebGlyphRasterizerBackend();
    #elseif lime_cairo
    return new LimeNativeGlyphRasterizer().backend();
    #else
    return null;
    #end
  }
}

#if (!js && lime_cairo)
private class LimeNativeGlyphRasterizer {
  final canvas = new flight._internal.backend.NativeScratchCanvas();
  final context:flight._internal.backend.NativeCanvas2dContext;

  public function new() {
    context = canvas.nativeContext();
  }

  public function backend():GlyphRasterizerBackend return cast {
    measureMetrics: measureMetrics,
    rasterize: rasterize,
  };

  function measureMetrics(options:GlyphRasterizeOptions):Null<GlyphMetrics> {
    applyFont(options);
    final metrics:Dynamic = context.measureText('Hg');
    final ascent:Float = _Runtime.field(metrics, 'fontBoundingBoxAscent');
    final descent:Float = _Runtime.field(metrics, 'fontBoundingBoxDescent');
    final available = ascent > 0 && descent >= 0;
    flight._GlyphAtlas.observeGlyphRasterizerHostResult('measureMetrics', available);
    return available ? {ascent: ascent, descent: descent, lineGap: 0} : null;
  }

  function rasterize(codepoint:Float, options:GlyphRasterizeOptions):Null<GlyphRasterizedBitmap> {
    final text = _Runtime.fromCodePoint(codepoint);
    applyFont(options);
    context.textBaseline = 'alphabetic';
    context.textAlign = 'left';
    final metrics:Dynamic = context.measureText(text);
    final advance:Float = _Runtime.field(metrics, 'width');
    final left = numericField(metrics, 'actualBoundingBoxLeft', 0);
    final right = numericField(metrics, 'actualBoundingBoxRight', advance);
    final ascent = numericField(metrics, 'actualBoundingBoxAscent', options.fontSize);
    final descent = numericField(metrics, 'actualBoundingBoxDescent', 0);
    final guard = 1;
    final width = Std.int(HxMath.max(0, HxMath.ceil(left + right))) + guard * 2;
    final height = Std.int(HxMath.max(0, HxMath.ceil(ascent + descent))) + guard * 2;
    if (width <= guard * 2 || height <= guard * 2) {
      flight._GlyphAtlas.observeGlyphRasterizerHostResult('rasterize', true);
      return null;
    }

    canvas.width = width;
    canvas.height = height;
    applyFont(options);
    context.textBaseline = 'alphabetic';
    context.textAlign = 'left';
    context.clearRect(0, 0, width, height);
    context.fillStyle = '#ffffff';
    context.fillText(text, guard + left, guard + ascent);
    final image:Dynamic = context.getImageData(0, 0, width, height);
    final pixels = new _UInt8ClampedArray(_Runtime.field(image, 'data'));
    flight._GlyphAtlas.observeGlyphRasterizerHostResult('rasterize', true);
    return {
      advance: advance,
      bearingX: -left,
      bearingY: ascent,
      height: (height : Float),
      pixels: pixels,
      width: (width : Float),
    };
  }

  function applyFont(options:GlyphRasterizeOptions):Void {
    final style:Dynamic = options.fontStyle;
    final weight:Dynamic = options.fontWeight;
    context.font = (style == null ? 'normal' : Std.string(style)) + ' '
      + (weight == null ? 'normal' : Std.string(weight)) + ' ' + options.fontSize + 'px ' + options.fontFamily;
  }

  static function numericField(owner:Dynamic, name:String, fallback:Float):Float {
    final value:Dynamic = _Runtime.field(owner, name);
    return value == null ? fallback : value;
  }
}
#end
#end
