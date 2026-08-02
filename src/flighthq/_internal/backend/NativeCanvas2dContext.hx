// Maintained runtime support for generated Flight Haxe.
package flighthq._internal.backend;

#if (lime && !js && lime_cairo)
import flighthq._internal._Runtime;
import lime.graphics.cairo.Cairo;
import lime.graphics.cairo.CairoFillRule;
import lime.graphics.cairo.CairoImageSurface;
import lime.graphics.cairo.CairoLineCap;
import lime.graphics.cairo.CairoLineJoin;
import lime.graphics.cairo.CairoOperator;
import lime.graphics.cairo.CairoPattern;
import lime.math.Matrix3;
import lime.utils.UInt8Array;

/**
 * Native Canvas2D implementation over Lime's bundled cairo, backing
 * `Canvas2dBackend` where the browser context does not exist. Offscreen
 * contexts own their pixel storage (an ARGB32 cairo image surface created over
 * a caller-owned byte view, so pixels are directly readable for GL texture
 * uploads and `getImageData`); a context can also wrap an externally owned
 * `Cairo` (a Lime cairo window context) for direct-to-window presentation.
 *
 * Text uses cairo's toy font API with the default face: sizes and colors are
 * honored, `measureText` is a width heuristic until a FreeType face loader
 * exists. `textAlign`/`textBaseline` are stored but only 'left'/alphabetic
 * rendering is applied.
 */
// Gradient handles and `measureText` results are reached reflectively from
// generated code, so full DCE must not strip these classes.
@:keep
class NativeCanvas2dContext {
  public var width(default, null):Int = 0;
  public var height(default, null):Int = 0;
  public var pixels(default, null):UInt8Array;
  public var surface(default, null):CairoImageSurface;
  public var cairo(default, null):Cairo;

  /** The owning canvas stand-in, mirrored back through the `canvas` field. */
  public var canvas:Dynamic;

  /** When owned by a scratch canvas, its size fields are re-checked before
   * every operation: generated code assigns them through a structural type,
   * which cannot be observed through property setters on every target. */
  public var scratchOwner:NativeScratchCanvas;

  public var fillStyle:Dynamic = '#000000';
  public var strokeStyle:Dynamic = '#000000';
  public var globalAlpha:Float = 1.0;
  public var globalCompositeOperation:String = 'source-over';
  public var font:String = '10px sans-serif';
  public var textAlign:String = 'left';
  public var textBaseline:String = 'alphabetic';
  public var imageSmoothingEnabled:Bool = true;
  public var imageSmoothingQuality:String = 'low';
  public var filter:String = 'none';
  public var lineCap(default, set):String = 'butt';
  public var lineJoin(default, set):String = 'miter';
  public var lineWidth(default, set):Float = 1.0;
  public var miterLimit(default, set):Float = 10.0;

  final ownsSurface:Bool;
  final stateStack:Array<{fillStyle:Dynamic, strokeStyle:Dynamic, globalAlpha:Float, globalCompositeOperation:String,
    font:String, textAlign:String, textBaseline:String, lineCap:String, lineJoin:String, lineWidth:Float,
    miterLimit:Float}> = [];

  /** Live source for a window-owned `Cairo`: Lime creates it at first render
   * lock (not window creation) and may recreate it when the surface changes,
   * so window-mode contexts re-fetch it instead of caching one instance. */
  public var windowContextProvider:Void->Cairo;

  public function new(?windowContext:Cairo, ?provider:Void->Cairo) {
    ownsSurface = windowContext == null && provider == null;
    windowContextProvider = provider;
    if (windowContext != null) {
      cairo = windowContext;
      set_lineCap(lineCap);
      set_lineJoin(lineJoin);
      set_lineWidth(lineWidth);
      set_miterLimit(miterLimit);
    }
  }

  function set_lineWidth(value:Float):Float {
    lineWidth = value;
    if (cairo != null) cairo.lineWidth = value;
    return value;
  }

  function set_lineCap(value:String):String {
    lineCap = value;
    if (cairo != null) {
      cairo.lineCap = switch (value) {
        case 'round': CairoLineCap.ROUND;
        case 'square': CairoLineCap.SQUARE;
        default: CairoLineCap.BUTT;
      };
    }
    return value;
  }

  function set_lineJoin(value:String):String {
    lineJoin = value;
    if (cairo != null) {
      cairo.lineJoin = switch (value) {
        case 'round': CairoLineJoin.ROUND;
        case 'bevel': CairoLineJoin.BEVEL;
        default: CairoLineJoin.MITER;
      };
    }
    return value;
  }

  function set_miterLimit(value:Float):Float {
    miterLimit = value;
    if (cairo != null) cairo.miterLimit = value;
    return value;
  }

  /** (Re)allocates the owned ARGB32 surface; canvas semantics clear content. */
  public function resize(newWidth:Int, newHeight:Int):Void {
    if (!ownsSurface) {
      width = newWidth;
      height = newHeight;
      return;
    }
    width = newWidth < 1 ? 1 : newWidth;
    height = newHeight < 1 ? 1 : newHeight;
    final stride = width * 4;
    pixels = new UInt8Array(stride * height);
    surface = cast CairoImageSurface.create(pixels, lime.graphics.cairo.CairoFormat.ARGB32, width, height, stride);
    cairo = new Cairo(surface);
    set_lineCap(lineCap);
    set_lineJoin(lineJoin);
    cairo.lineWidth = lineWidth;
    cairo.miterLimit = miterLimit;
  }

  function context():Cairo {
    syncWithOwner();
    if (!ownsSurface && windowContextProvider != null) {
      final live = windowContextProvider();
      if (live != null && live != cairo) {
        cairo = live;
        cairo.lineWidth = lineWidth;
        set_lineCap(lineCap);
        set_lineJoin(lineJoin);
        set_miterLimit(miterLimit);
      }
    }
    if (cairo == null) {
      if (!ownsSurface) throw 'Window cairo context is not available yet (created at first render lock).';
      resize(width, height);
    }
    return cairo;
  }

  /** Reallocates the surface if the owning canvas was resized structurally. */
  public function syncWithOwner():Void {
    if (scratchOwner != null && (scratchOwner.width != width || scratchOwner.height != height)) {
      resize(scratchOwner.width, scratchOwner.height);
    }
  }

  // ---- paths ----

  public function beginPath():Void context().newPath();

  public function moveTo(x:Float, y:Float):Void context().moveTo(x, y);

  public function lineTo(x:Float, y:Float):Void context().lineTo(x, y);

  public function rect(x:Float, y:Float, w:Float, h:Float):Void context().rectangle(x, y, w, h);

  public function closePath():Void context().closePath();

  public function bezierCurveTo(c1x:Float, c1y:Float, c2x:Float, c2y:Float, x:Float, y:Float):Void {
    context().curveTo(c1x, c1y, c2x, c2y, x, y);
  }

  public function quadraticCurveTo(cx:Float, cy:Float, x:Float, y:Float):Void {
    // cairo paths are cubic; elevate the quadratic control point.
    final ctx = context();
    final current = ctx.hasCurrentPoint ? ctx.currentPoint : new lime.math.Vector2(0, 0);
    ctx.curveTo(current.x + 2 / 3 * (cx - current.x), current.y + 2 / 3 * (cy - current.y), x + 2 / 3 * (cx - x),
      y + 2 / 3 * (cy - y), x, y);
  }

  public function arc(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, ?anticlockwise:Bool):Void {
    // Browsers draw the whole circle whenever the sweep spans 2pi or more in
    // either direction; cairo's own normalization instead collapses a
    // full-turn arcNegative(0, 2pi) to an empty path, so normalize here.
    final tau = Math.PI * 2;
    var sweep = endAngle - startAngle;
    if (anticlockwise == true) {
      if (sweep <= -tau || sweep >= tau) sweep = -tau;
      else {
        sweep = _Runtime.fmod(sweep, tau);
        if (sweep > 0) sweep -= tau;
      }
      context().arcNegative(x, y, radius, startAngle, startAngle + sweep);
    } else {
      if (sweep >= tau || sweep <= -tau) sweep = tau;
      else {
        sweep = _Runtime.fmod(sweep, tau);
        if (sweep < 0) sweep += tau;
      }
      context().arc(x, y, radius, startAngle, startAngle + sweep);
    }
  }

  public function ellipse(x:Float, y:Float, radiusX:Float, radiusY:Float, rotation:Float, startAngle:Float,
      endAngle:Float, ?anticlockwise:Bool):Void {
    final ctx = context();
    ctx.save();
    ctx.translate(x, y);
    ctx.rotate(rotation);
    ctx.scale(radiusX, radiusY);
    if (anticlockwise == true) ctx.arcNegative(0, 0, 1, startAngle, endAngle);
    else ctx.arc(0, 0, 1, startAngle, endAngle);
    ctx.restore();
  }

  public function roundRect(x:Float, y:Float, width:Float, height:Float, radius:Dynamic):Void {
    final left = Math.min(x, x + width);
    final right = Math.max(x, x + width);
    final top = Math.min(y, y + height);
    final bottom = Math.max(y, y + height);
    final r = Math.min(Math.abs((radius : Float)), Math.min((right - left) / 2, (bottom - top) / 2));
    final ctx = context();
    if (r <= 0) {
      ctx.rectangle(left, top, right - left, bottom - top);
      return;
    }
    ctx.moveTo(left + r, top);
    ctx.lineTo(right - r, top);
    ctx.arc(right - r, top + r, r, -Math.PI / 2, 0);
    ctx.lineTo(right, bottom - r);
    ctx.arc(right - r, bottom - r, r, 0, Math.PI / 2);
    ctx.lineTo(left + r, bottom);
    ctx.arc(left + r, bottom - r, r, Math.PI / 2, Math.PI);
    ctx.lineTo(left, top + r);
    ctx.arc(left + r, top + r, r, Math.PI, Math.PI * 3 / 2);
    ctx.closePath();
  }

  public function scale(x:Float, y:Float):Void context().scale(x, y);

  public function rotate(angle:Float):Void context().rotate(angle);

  public function fill(?fillRule:Dynamic):Void {
    final ctx = context();
    ctx.fillRule = Std.string(fillRule) == 'evenodd' ? CairoFillRule.EVEN_ODD : CairoFillRule.WINDING;
    applyStyle(fillStyle);
    ctx.fillPreserve();
  }

  public function stroke():Void {
    applyStyle(strokeStyle);
    context().strokePreserve();
  }

  public function clip():Void context().clipPreserve();

  // ---- rectangles ----

  public function fillRect(x:Float, y:Float, w:Float, h:Float):Void {
    final ctx = context();
    ctx.newPath();
    ctx.rectangle(x, y, w, h);
    applyStyle(fillStyle);
    ctx.fill();
  }

  public function strokeRect(x:Float, y:Float, w:Float, h:Float):Void {
    final ctx = context();
    ctx.newPath();
    ctx.rectangle(x, y, w, h);
    applyStyle(strokeStyle);
    ctx.stroke();
  }

  public function clearRect(x:Float, y:Float, w:Float, h:Float):Void {
    final ctx = context();
    final previous = ctx.getOperator();
    ctx.setOperator(CairoOperator.CLEAR);
    ctx.newPath();
    ctx.rectangle(x, y, w, h);
    ctx.fill();
    ctx.setOperator(previous);
  }

  // ---- state ----

  public function save():Void {
    stateStack.push({
      fillStyle: fillStyle, strokeStyle: strokeStyle, globalAlpha: globalAlpha,
      globalCompositeOperation: globalCompositeOperation, font: font, textAlign: textAlign,
      textBaseline: textBaseline, lineCap: lineCap, lineJoin: lineJoin, lineWidth: lineWidth,
      miterLimit: miterLimit,
    });
    context().save();
  }

  public function restore():Void {
    final saved = stateStack.pop();
    if (saved != null) {
      fillStyle = saved.fillStyle;
      strokeStyle = saved.strokeStyle;
      globalAlpha = saved.globalAlpha;
      globalCompositeOperation = saved.globalCompositeOperation;
      font = saved.font;
      textAlign = saved.textAlign;
      textBaseline = saved.textBaseline;
      lineCap = saved.lineCap;
      lineJoin = saved.lineJoin;
      lineWidth = saved.lineWidth;
      miterLimit = saved.miterLimit;
    }
    context().restore();
  }

  // ---- transforms ----

  public function translate(x:Float, y:Float):Void context().translate(x, y);

  public function transform(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float):Void {
    context().transform(new Matrix3(a, b, c, d, e, f));
  }

  public function setTransform(a:Float, b:Float, c:Float, d:Float, e:Float, f:Float):Void {
    context().matrix = new Matrix3(a, b, c, d, e, f);
  }

  // ---- styles ----

  public function createLinearGradient(x0:Float, y0:Float, x1:Float, y1:Float):NativeCanvasGradient {
    return new NativeCanvasGradient(CairoPattern.createLinear(x0, y0, x1, y1));
  }

  public function createRadialGradient(x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):NativeCanvasGradient {
    return new NativeCanvasGradient(CairoPattern.createRadial(x0, y0, r0, x1, y1, r1));
  }

  public function createPattern(source:Dynamic, repetition:Dynamic):Dynamic {
    final patternSurface = sourceSurface(source);
    if (patternSurface == null) return null;
    final pattern = CairoPattern.createForSurface(patternSurface);
    pattern.extend = Std.string(repetition) == 'no-repeat' ? lime.graphics.cairo.CairoExtend.NONE
      : lime.graphics.cairo.CairoExtend.REPEAT;
    return new NativeCanvasGradient(pattern);
  }

  function applyStyle(style:Dynamic):Void {
    final ctx = context();
    if (Std.isOfType(style, NativeCanvasGradient)) {
      ctx.source = (cast style : NativeCanvasGradient).pattern;
      return;
    }
    final rgba = parseCssColor(Std.string(style));
    ctx.setSourceRGBA(rgba.r, rgba.g, rgba.b, rgba.a * globalAlpha);
  }

  /** Parses the CSS color forms Flight emits: #rgb[a], #rrggbb[aa], rgb()/rgba(). */
  public static function parseCssColor(value:String):{r:Float, g:Float, b:Float, a:Float} {
    var text = StringTools.trim(value);
    if (text == 'transparent' || text == '') return {r: 0, g: 0, b: 0, a: 0};
    if (StringTools.startsWith(text, '#')) {
      final hex = text.substr(1);
      inline function channel(pair:String):Float return Std.parseInt('0x' + pair) / 255.0;
      return switch (hex.length) {
        case 3: {r: channel(hex.charAt(0) + hex.charAt(0)), g: channel(hex.charAt(1) + hex.charAt(1)),
          b: channel(hex.charAt(2) + hex.charAt(2)), a: 1.0};
        case 4: {r: channel(hex.charAt(0) + hex.charAt(0)), g: channel(hex.charAt(1) + hex.charAt(1)),
          b: channel(hex.charAt(2) + hex.charAt(2)), a: channel(hex.charAt(3) + hex.charAt(3))};
        case 6: {r: channel(hex.substr(0, 2)), g: channel(hex.substr(2, 2)), b: channel(hex.substr(4, 2)), a: 1.0};
        case 8: {r: channel(hex.substr(0, 2)), g: channel(hex.substr(2, 2)), b: channel(hex.substr(4, 2)),
          a: channel(hex.substr(6, 2))};
        default: {r: 0, g: 0, b: 0, a: 1.0};
      };
    }
    final open = text.indexOf('(');
    final close = text.lastIndexOf(')');
    if (open >= 0 && close > open) {
      final parts = text.substring(open + 1, close).split(',').map(StringTools.trim);
      if (parts.length >= 3) {
        inline function component(part:String):Float {
          return StringTools.endsWith(part, '%') ? Std.parseFloat(part) / 100.0 : Std.parseFloat(part) / 255.0;
        }
        final alpha = parts.length >= 4 ? Std.parseFloat(parts[3]) : 1.0;
        return {r: component(parts[0]), g: component(parts[1]), b: component(parts[2]), a: alpha};
      }
    }
    return switch (text) {
      case 'black': {r: 0, g: 0, b: 0, a: 1.0};
      case 'white': {r: 1, g: 1, b: 1, a: 1.0};
      case 'red': {r: 1, g: 0, b: 0, a: 1.0};
      case 'green': {r: 0, g: 0.5, b: 0, a: 1.0};
      case 'blue': {r: 0, g: 0, b: 1, a: 1.0};
      default: {r: 0, g: 0, b: 0, a: 1.0};
    };
  }

  // ---- text ----

  /** Registered real font faces keyed by family plus optional style suffixes
   * (`family`, `family|b`, `family|i`, `family|b|i`); `fillText` and
   * `measureText` use them when the CSS font string names a registered family,
   * preferring an exact style match and falling back to the plain family, then
   * to cairo's toy face. */
  static final registeredFonts:Map<String, {font:lime.text.Font, face:lime.graphics.cairo.CairoFontFace}> = [];

  public static function registerFont(family:String, font:lime.text.Font, bold:Bool = false, italic:Bool = false):Void {
    final face = lime.graphics.cairo.CairoFTFontFace.create(font, lime.graphics.cairo.CairoFTFontFace.FT_LOAD_FORCE_AUTOHINT);
    registeredFonts.set(styleKey(family.toLowerCase(), bold, italic), {font: font, face: face});
  }

  static function styleKey(family:String, bold:Bool, italic:Bool):String {
    return family + (bold ? '|b' : '') + (italic ? '|i' : '');
  }

  static function resolveRegisteredFont(fontValue:String):Null<{font:lime.text.Font, face:lime.graphics.cairo.CairoFontFace}> {
    // CSS font shorthand: style/weight tokens precede the size token, and the
    // comma-separated family list is the tail after it.
    final sizeIndex = fontValue.indexOf('px');
    final head = sizeIndex >= 0 ? fontValue.substr(0, sizeIndex).toLowerCase() : '';
    final bold = head.indexOf('bold') >= 0;
    final italic = head.indexOf('italic') >= 0 || head.indexOf('oblique') >= 0;
    final families = (sizeIndex >= 0 ? fontValue.substr(sizeIndex + 2) : fontValue).split(',');
    for (family in families) {
      final key = StringTools.trim(StringTools.replace(StringTools.replace(family, '"', ''), "'", '')).toLowerCase();
      if (key == '') continue;
      final styled = styleKey(key, bold, italic);
      if (registeredFonts.exists(styled)) return registeredFonts.get(styled);
      if (registeredFonts.exists(key)) return registeredFonts.get(key);
    }
    return null;
  }

  /** Canvas `fillText`/`measureText` replace ASCII whitespace with spaces, so
   * control characters never reach cairo as missing-glyph boxes. */
  static function normalizeDrawnText(text:String):String {
    if (text.indexOf('\n') < 0 && text.indexOf('\r') < 0 && text.indexOf('\t') < 0) return text;
    text = StringTools.replace(text, '\r\n', ' ');
    text = StringTools.replace(text, '\n', ' ');
    text = StringTools.replace(text, '\r', ' ');
    return StringTools.replace(text, '\t', ' ');
  }

  /** Dedicated 1x1 measurement context: `textPath` advances the current point
   * exactly like `showText` (kerning and space advances included) without
   * painting, and using a scratch context keeps the canvas path untouched. */
  static var measureContext:Null<lime.graphics.cairo.Cairo> = null;

  static function measurementContext():lime.graphics.cairo.Cairo {
    if (measureContext == null) {
      final pixels = new lime.utils.UInt8Array(4);
      final surface = lime.graphics.cairo.CairoImageSurface.create(pixels, lime.graphics.cairo.CairoFormat.ARGB32, 1, 1, 4);
      measureContext = new lime.graphics.cairo.Cairo(surface);
    }
    return measureContext;
  }

  public function fillText(text:String, x:Float, y:Float):Void {
    final ctx = context();
    ctx.save();
    final registered = resolveRegisteredFont(font);
    if (registered != null) ctx.fontFace = registered.face;
    ctx.setFontSize(parseFontSize(font));
    applyStyle(fillStyle);
    ctx.moveTo(x, y);
    ctx.showText(normalizeDrawnText(text));
    ctx.restore();
  }

  public function measureText(text:String):Dynamic {
    final ctx = measurementContext();
    ctx.save();
    final registered = resolveRegisteredFont(font);
    if (registered != null) ctx.fontFace = registered.face;
    ctx.setFontSize(parseFontSize(font));
    ctx.newPath();
    ctx.moveTo(0, 0);
    ctx.textPath(normalizeDrawnText(text));
    final width = ctx.hasCurrentPoint ? ctx.currentPoint.x : 0.0;
    ctx.newPath();
    ctx.restore();
    return {width: width};
  }

  static function parseFontSize(fontValue:String):Float {
    for (token in fontValue.split(' ')) {
      if (StringTools.endsWith(token, 'px')) {
        final size = Std.parseFloat(token);
        if (!Math.isNaN(size)) return size;
      }
    }
    return 10.0;
  }

  // ---- images and pixels ----

  public function drawImage(source:Dynamic, a:Float, b:Float, ?c:Float, ?d:Float, ?e:Float, ?f:Float, ?g:Float,
      ?h:Float):Void {
    final imageSurface = sourceSurface(source);
    if (imageSurface == null) return;
    final ctx = context();
    ctx.save();
    if (c == null) {
      // drawImage(source, dx, dy)
      ctx.setSourceSurface(imageSurface, a, b);
      ctx.newPath();
      ctx.rectangle(a, b, imageSurface.width, imageSurface.height);
      ctx.fill();
    } else if (e == null) {
      // drawImage(source, dx, dy, dw, dh)
      ctx.translate(a, b);
      ctx.scale(c / imageSurface.width, d / imageSurface.height);
      ctx.setSourceSurface(imageSurface, 0, 0);
      ctx.newPath();
      ctx.rectangle(0, 0, imageSurface.width, imageSurface.height);
      ctx.fill();
    } else {
      // drawImage(source, sx, sy, sw, sh, dx, dy, dw, dh)
      ctx.translate(e, f);
      ctx.scale(g / c, h / d);
      ctx.setSourceSurface(imageSurface, -a, -b);
      ctx.newPath();
      ctx.rectangle(0, 0, c, d);
      ctx.fill();
    }
    ctx.restore();
  }

  public function getImageData(x:Float, y:Float, w:Float, h:Float):Dynamic {
    final startX = Std.int(x);
    final startY = Std.int(y);
    final outWidth = Std.int(w);
    final outHeight = Std.int(h);
    final data = new flighthq._internal._UInt8ClampedArray(outWidth * outHeight * 4);
    if (surface != null) {
      surface.flush();
      for (row in 0...outHeight) {
        final sourceY = startY + row;
        if (sourceY < 0 || sourceY >= height) continue;
        for (column in 0...outWidth) {
          final sourceX = startX + column;
          if (sourceX < 0 || sourceX >= width) continue;
          final src = (sourceY * width + sourceX) * 4;
          final dst = (row * outWidth + column) * 4;
          // ARGB32 little-endian bytes are B,G,R,A and premultiplied.
          final alpha = pixels[src + 3];
          final scale = alpha == 0 ? 0.0 : 255.0 / alpha;
          data[dst] = Math.round(pixels[src + 2] * scale);
          data[dst + 1] = Math.round(pixels[src + 1] * scale);
          data[dst + 2] = Math.round(pixels[src] * scale);
          data[dst + 3] = alpha;
        }
      }
    }
    return {width: outWidth, height: outHeight, data: data};
  }

  public function putImageData(imageData:Dynamic, x:Float, y:Float):Void {
    // The scratch-canvas surface is created lazily; `putImageData` can be the
    // very first operation after sizing (createImageResourceFromBitmap does
    // exactly that), so sync here instead of silently skipping the write.
    syncWithOwner();
    if (surface == null) return;
    surface.flush();
    final sourceWidth = Std.int(_Runtime.field(imageData, 'width'));
    final sourceHeight = Std.int(_Runtime.field(imageData, 'height'));
    final data:Dynamic = _Runtime.field(imageData, 'data');
    final startX = Std.int(x);
    final startY = Std.int(y);
    for (row in 0...sourceHeight) {
      final targetY = startY + row;
      if (targetY < 0 || targetY >= height) continue;
      for (column in 0...sourceWidth) {
        final targetX = startX + column;
        if (targetX < 0 || targetX >= width) continue;
        final src = (row * sourceWidth + column) * 4;
        final dst = (targetY * width + targetX) * 4;
        final red:Int = _Runtime.getIndex(data, src);
        final green:Int = _Runtime.getIndex(data, src + 1);
        final blue:Int = _Runtime.getIndex(data, src + 2);
        final alpha:Int = _Runtime.getIndex(data, src + 3);
        pixels[dst] = Std.int(blue * alpha / 255);
        pixels[dst + 1] = Std.int(green * alpha / 255);
        pixels[dst + 2] = Std.int(red * alpha / 255);
        pixels[dst + 3] = alpha;
      }
    }
    // Lime exposes no cairo_surface_mark_dirty; direct writes to the caller-owned
    // buffer are visible because image surfaces read it on each operation.
  }

  public function getContextAttributes():Dynamic {
    return {alpha: true, desynchronized: false, willReadFrequently: false};
  }

  /** Resolves a drawable source to a cairo surface: another native canvas, or
   * an object carrying RGBA pixel `data` with `width`/`height`. */
  static function sourceSurface(source:Dynamic):CairoImageSurface {
    if (source == null) return null;
    if (Std.isOfType(source, NativeScratchCanvas)) {
      final ctx = (cast source : NativeScratchCanvas).nativeContext();
      if (ctx.surface != null) ctx.surface.flush();
      return ctx.surface;
    }
    if (Std.isOfType(source, NativeCanvas2dContext)) {
      final ctx:NativeCanvas2dContext = cast source;
      if (ctx.surface != null) ctx.surface.flush();
      return ctx.surface;
    }
    final data:Dynamic = _Runtime.field(source, 'data');
    final sourceWidth = Std.int(_Runtime.field(source, 'width'));
    final sourceHeight = Std.int(_Runtime.field(source, 'height'));
    if (data == null || sourceWidth <= 0 || sourceHeight <= 0) return null;
    final stride = sourceWidth * 4;
    final premultiplied = new UInt8Array(stride * sourceHeight);
    for (index in 0...sourceWidth * sourceHeight) {
      final src = index * 4;
      final red:Int = _Runtime.getIndex(data, src);
      final green:Int = _Runtime.getIndex(data, src + 1);
      final blue:Int = _Runtime.getIndex(data, src + 2);
      final alpha:Int = _Runtime.getIndex(data, src + 3);
      premultiplied[src] = Std.int(blue * alpha / 255);
      premultiplied[src + 1] = Std.int(green * alpha / 255);
      premultiplied[src + 2] = Std.int(red * alpha / 255);
      premultiplied[src + 3] = alpha;
    }
    return cast CairoImageSurface.create(premultiplied, lime.graphics.cairo.CairoFormat.ARGB32, sourceWidth,
      sourceHeight, stride);
  }
}

/** Canvas gradient/pattern handle; `addColorStop` is reached reflectively. */
@:keep
class NativeCanvasGradient {
  public final pattern:CairoPattern;

  public function new(pattern:CairoPattern) {
    this.pattern = pattern;
  }

  public function addColorStop(offset:Float, color:String):Void {
    final rgba = NativeCanvas2dContext.parseCssColor(color);
    pattern.addColorStopRGBA(offset, rgba.r, rgba.g, rgba.b, rgba.a);
  }
}
#end
