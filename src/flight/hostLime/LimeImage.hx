package flight.hostLime;

#if lime
import flight._internal._Promise;
import flight._internal.dom.AbortSignal;
import flight.types.ImageBackend;

/** Flight image loading backed by Lime's native image codecs and HTTP stack. */
class LimeImage {
  public static function createLimeImageBackend():ImageBackend {
    #if js
    return flight._Image.createWebImageBackend();
    #else
    return cast {
      loadImageFromUrl: function(url:String, _crossOrigin:Null<String>, signal:Null<AbortSignal>):_Promise<flight.types.ImageResource> {
        return loadNativeImage(url, signal);
      },
    };
    #end
  }

  #if !js
  static function loadNativeImage(url:String, signal:Null<AbortSignal>):_Promise<flight.types.ImageResource> {
    return new _Promise(function(resolve, reject) {
      var settled = false;
      var onAbort:Null<Void->Void> = null;
      final cleanup = function():Void {
        if (signal != null && onAbort != null) signal.removeEventListener('abort', onAbort);
      };
      final fail = function(error:Dynamic):Void {
        if (settled) return;
        settled = true;
        cleanup();
        reject(error);
      };
      final complete = function(image:lime.graphics.Image):Void {
        if (settled) return;
        if (image == null || image.buffer == null || image.width <= 0 || image.height <= 0) {
          fail('Lime could not decode image: ' + url);
          return;
        }
        // Both native Canvas2D and GL upload paths consume an RGBA, straight-
        // alpha source and perform premultiplication at their own boundary.
        image.format = lime.graphics.PixelFormat.RGBA32;
        image.premultiplied = false;
        settled = true;
        cleanup();
        resolve(flight.Image.createImageResource(cast image));
      };

      if (signal != null && signal.aborted) {
        fail(signal.reason);
        return;
      }
      if (signal != null) {
        onAbort = function():Void fail(signal.reason);
        signal.addEventListener('abort', onAbort, {once: true});
      }

      // Local files can be decoded immediately on native targets. Remote URLs
      // use Lime's Future/HTTPRequest path; abort rejects promptly even though
      // Lime's image Future itself has no cancellation hook.
      final objectBlob = flight._internal._URL.resolveObjectURL(url);
      if (objectBlob != null) {
        try {
          complete(lime.graphics.Image.fromBytes(objectBlob.bytes));
        } catch (error:Dynamic) {
          fail(error);
        }
        return;
      }
      if (url != null && StringTools.startsWith(url.toLowerCase(), 'data:')) {
        try {
          complete(lime.graphics.Image.fromBytes(decodeDataUrl(url)));
        } catch (error:Dynamic) {
          fail(error);
        }
        return;
      }
      if (!isRemoteUrl(url)) {
        try {
          final local = lime.graphics.Image.fromFile(url);
          if (local != null) {
            complete(local);
            return;
          }
        } catch (_:Dynamic) {}
      }
      final future = lime.graphics.Image.loadFromFile(url);
      future.onComplete(complete);
      future.onError(fail);
    });
  }

  static function isRemoteUrl(url:String):Bool {
    if (url == null) return false;
    final lower = url.toLowerCase();
    return StringTools.startsWith(lower, 'http://') || StringTools.startsWith(lower, 'https://');
  }

  static function decodeDataUrl(url:String):haxe.io.Bytes {
    final comma = url.indexOf(',');
    if (comma < 5) throw 'Invalid image data URL';
    final metadata = url.substring(5, comma).toLowerCase();
    final payload = url.substring(comma + 1);
    return metadata.split(';').indexOf('base64') >= 0
      ? haxe.crypto.Base64.decode(payload)
      : haxe.io.Bytes.ofString(StringTools.urlDecode(payload));
  }
  #end
}
#end
