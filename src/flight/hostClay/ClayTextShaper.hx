// Maintained host adapter: Flight TextShaperBackend for Clay.
// WRITE-AHEAD against develop 2cf1c5cef. Installed via `flight._TextLayout
// .setTextShaperBackend` (a set* seam, not a host slot). Measurement uses
// linc_stb TrueType advances; full script shaping (bidi/fallback) is not
// provided — HarfBuzz would be a later, separate integration (mirrors the
// hostLime TextShaper gap). See agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayTextShaper {
  /** Install via `flight._TextLayout.setTextShaperBackend`. */
  public static function createClayTextShaperBackend():Dynamic {
    return {
      // Required. TODO(develop): measure `text` in `format` via stb TrueType
      // scaled advance widths; return the generated TextMetrics shape.
      measureText: function(text:String, format:Dynamic):Dynamic {
        return measureViaStb(text, format);
      },
      getFontMetrics: function(format:Dynamic):Dynamic return null, // stb_truetype GetFontVMetrics
      getGlyphIndexForCodePoint: function(codePoint:Int):Int return 0, // stb_truetype FindGlyphIndex
      getGlyphExtents: function(glyphId:Int):Dynamic return null,
    };
  }

  // Cache StbPackedChar advance tables per (fontPath, pixelSize). ASCII range.
  static final packCache = new Map<String, Array<Dynamic>>();

  static function measureViaStb(text:String, format:Dynamic):Dynamic {
    final size:Float = numField(format, 'fontSize', 16);
    final path = fontPathFor(format);
    if (path == null || text == null) return cast {width: 0.0, height: size, ascent: size * 0.8, descent: size * 0.2};
    final packed = packedFor(path, size);
    var width = 0.0;
    for (i in 0...text.length) {
      final c = text.charCodeAt(i) - 32; // range starts at space (32)
      if (packed != null && c >= 0 && c < packed.length) width += numField(packed[c], 'xadvance', 0);
    }
    return cast {width: width, height: size, ascent: size * 0.8, descent: size * 0.2};
  }

  static function packedFor(path:String, size:Float):Array<Dynamic> {
    final key = path + '@' + size;
    if (packCache.exists(key)) return packCache.get(key);
    // stb: pack the printable ASCII range once; StbPackedChar carries xadvance.
    final packed:Array<Dynamic> = try cast stb.TrueType.pack_font_range(path, 0, size, 32, 95) catch (_:Dynamic) null;
    packCache.set(key, packed);
    return packed;
  }

  static function fontPathFor(format:Dynamic):Null<String> {
    // TODO(develop): resolve the ClayFont-registered face for `format` to its
    // on-disk font path (pack_font_range is filename-based).
    return null;
  }

  static inline function numField(o:Dynamic, name:String, fallback:Float):Float {
    final v:Dynamic = flight._internal._Runtime.field(o, name);
    return v == null ? fallback : (v : Float);
  }
}
#end
