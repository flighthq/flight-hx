// Maintained host adapter: Flight FontLoadingBackend for Clay.
// WRITE-AHEAD against develop 2cf1c5cef (flight.types.FontLoadingBackend /
// flight._Font.installFontLoadingHostBackend absent on 0.4.0). Font faces are
// registered here and validated/rasterized via linc_stb TrueType. See
// agents/host-develop-adaptation.md. Reconcile FontFace shape on rebase.
package flight.hostClay;

#if clay
class ClayFont {
  static final faces = new Map<String, Dynamic>(); // shorthand -> FontFace

  /** Composed into the host `text.fontLoading` slot by HostClay. */
  public static function createClayFontLoadingBackend():Dynamic {
    return {
      addFontFace: function(face:Dynamic):Void {
        final key = shorthandOf(face);
        if (key != null) faces.set(key, face);
      },
      checkFontFace: function(shorthand:String):Bool return faces.exists(normalize(shorthand)),
      loadFontFaces: function(shorthand:String):Dynamic {
        // Faces registered from bytes are ready synchronously; return the match.
        final f = faces.get(normalize(shorthand));
        return flight._internal._Promise.resolve(f == null ? ([] : Array<Dynamic>) : [f]);
      },
      whenReady: function():Dynamic return flight._internal._Promise.resolve(null),
    };
  }

  static function shorthandOf(face:Dynamic):Null<String> {
    // TODO(develop): derive the CSS-shorthand key from the generated FontFace
    // fields (family/style/weight) once its shape is known.
    final family = flight._internal._Runtime.field(face, 'family');
    return family == null ? null : normalize(Std.string(family));
  }

  static inline function normalize(s:String):String return s == null ? '' : StringTools.trim(s.toLowerCase());
}
#end
