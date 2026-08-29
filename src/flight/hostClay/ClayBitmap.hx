// Maintained host adapters: Flight BitmapReadbackBackend + BitmapEncodeBackend
// for Clay. WRITE-AHEAD against develop 2cf1c5cef (flight.types.Bitmap* and
// flight._Bitmap.install* absent on 0.4.0). Readback uses the GL surface
// (GL.readPixels via ClayGlContext); encode uses linc_stb ImageWrite. Reconcile
// Bitmap / HostImageSource / ImageFormat shapes on rebase. See
// agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
import clay.opengl.GL;

class ClayBitmap {
  /** Install via `flight._Bitmap.installBitmapReadbackHostBackend`. */
  public static function createClayBitmapReadbackBackend():Dynamic {
    return {
      readBitmap: function(source:Dynamic, width:Int, height:Int, mode:Dynamic):Dynamic {
        // TODO(develop): bind `source` (a GL framebuffer/texture HostImageSource)
        // and read RGBA8. GL.readPixels(x,y,w,h,RGBA,UNSIGNED_BYTE,pixels).
        // Note: MRT readBuffer selection is a GLES3 gap (see GlSurface).
        final pixels = new clay.buffers.Uint8Array(width * height * 4);
        GL.readPixels(0, 0, width, height, GL.RGBA, GL.UNSIGNED_BYTE, pixels);
        final bitmap = { width: width, height: height, pixels: pixels };
        return { bitmap: cast bitmap, reason: cast 'ok' };
      },
    };
  }

  /** Install via `flight._Bitmap.installBitmapEncodeHostBackend`. */
  public static function createClayBitmapEncodeBackend():Dynamic {
    return {
      supportedFormats: (cast ['png', 'jpeg'] : Array<Dynamic>),
      encodeBitmap: function(source:Dynamic, format:Dynamic, quality:Float):Dynamic {
        // TODO(develop): encode source.pixels (RGBA8, width×height) via linc_stb
        // ImageWrite — write_png_to_mem / write_jpg_to_mem — and return the bytes
        // as the generated UInt8Array. Confirm the linc ImageWrite to-memory fn.
        final w:Int = flight._internal._Runtime.field(source, 'width');
        final h:Int = flight._internal._Runtime.field(source, 'height');
        final pixels = flight._internal._Runtime.field(source, 'pixels');
        final fmt = Std.string(format).toLowerCase();
        return encodeStb(pixels, w, h, fmt, Std.int(quality * 100));
      },
    };
  }

  static function encodeStb(pixels:Dynamic, w:Int, h:Int, fmt:String, quality:Int):Dynamic {
    // TODO(develop): call the linc_stb ImageWrite memory encoder for png/jpg and
    // wrap the result bytes in the generated UInt8Array type.
    return null;
  }
}
#end
