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

  static function measureViaStb(text:String, format:Dynamic):Dynamic {
    // TODO(develop): resolve the registered face (ClayFont), sum stb advance
    // widths at the format's pixel size; return {width, height, ascent, descent}
    // in the generated TextMetrics shape.
    return cast {width: 0.0, height: 0.0};
  }
}
#end
