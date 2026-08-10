// Maintained host adapter: Flight net backend over Lime's HTTP transport.
// Upstream's `createWebNetBackend` wraps fetch; this backend implements the
// same `NetBackend` seam over `lime.net.HTTPRequest` (libcurl on native), so
// `sendNetRequest` — and everything upstream routes through the net seam —
// works without a browser. Install with
// `setNetBackend(LimeNet.createLimeNetBackend())`. On js it simply returns
// upstream's own web backend.
//
// Contract notes carried over from upstream: expected transport failures
// (network error, DNS, timeout, caller abort) resolve to the sentinel
// response (status 0, ok false) rather than rejecting; a non-2xx HTTP status
// is a normal response with ok false. Deviations on native, documented
// rather than emulated: 'blob' decodes to the raw buffer (no native Blob),
// redirect 'error' reports a 3xx as a transport failure after receiving it
// (libcurl cannot fail mid-flight), and the final URL after redirects is not
// observable through Lime, so `url` echoes the request URL.
package flighthq.hostLime;

#if lime
import flighthq._internal._Promise;
import flighthq._internal._Runtime;
import flighthq.types.Net.NetBackend;
import flighthq.types.Net.NetResponse;

class LimeNet {
  /** Allocation entry point, Flight-style: `createLimeNetBackend()`. */
  public static function createLimeNetBackend():NetBackend {
    #if js
    return flighthq.net.Net.createWebNetBackend();
    #else
    return cast {
      sendNetRequest: function(request:Dynamic, ?options:Dynamic):_Promise<NetResponse> {
        return sendThroughLime(request, options);
      },
    };
    #end
  }

  #if !js
  static function sendThroughLime(request:Dynamic, options:Dynamic):_Promise<NetResponse> {
    return new _Promise(function(resolve:NetResponse->Void, _reject) {
      final url:String = request.url;
      final redirect:String = stringField(request, 'redirect', 'follow');
      final responseType:String = stringField(request, 'responseType', 'text');
      var settled = false;
      final settle = function(response:NetResponse):Void {
        if (settled) return;
        settled = true;
        resolve(response);
      };

      final http = new lime.net.HTTPRequest<haxe.io.Bytes>(url);
      http.method = stringField(request, 'method', 'GET');
      http.followRedirects = redirect == 'follow';
      http.enableResponseHeaders = true;

      final timeoutMs:Null<Float> = _Runtime.field(request, 'timeoutMs');
      if (timeoutMs != null) http.timeout = Std.int(timeoutMs);

      final headers:Dynamic = _Runtime.field(request, 'headers');
      if (headers != null) {
        for (name in Reflect.fields(headers)) {
          final value = Std.string(Reflect.field(headers, name));
          // Lime carries the content type in a dedicated field and would
          // otherwise append its form-urlencoded default alongside ours.
          if (name.toLowerCase() == 'content-type') http.contentType = value;
          else http.headers.push(new lime.net.HTTPRequestHeader(name, value));
        }
      }

      final body:Dynamic = _Runtime.field(request, 'body');
      if (body != null) http.data = bodyToBytes(body);

      // Caller abort: the toolkit AbortSignal is structural — read `aborted`
      // now and register tolerantly for a later abort.
      final signal:Dynamic = options == null ? null : _Runtime.field(options, 'signal');
      if (signal != null && _Runtime.field(signal, 'aborted') == true) {
        settle(transportFailure(url, 'aborted'));
        return;
      }
      if (signal != null) {
        final onAbort:Dynamic = function():Void {
          http.cancel();
          settle(transportFailure(url, 'aborted'));
        };
        _Runtime.callOptionalValue(_Runtime.field(signal, 'addEventListener'), (['abort', onAbort] : Array<Dynamic>));
      }

      final progressSignal:Dynamic = options == null ? null : _Runtime.field(options, 'progress');

      final future = http.load(url);
      if (progressSignal != null) {
        future.onProgress(function(loaded:Int, total:Int):Void {
          flighthq.signals.Signals.emitSignal(cast progressSignal, cast {
            phase: 'download',
            loaded: (loaded : Float),
            total: (total : Float),
          });
        });
      }
      future.onComplete(function(bytes:haxe.io.Bytes):Void {
        final status = http.responseStatus;
        if (redirect == 'error' && status >= 300 && status < 400) {
          settle(transportFailure(url, 'redirected'));
          return;
        }
        final responseHeaders:Dynamic = {};
        if (http.responseHeaders != null) {
          for (header in http.responseHeaders) Reflect.setField(responseHeaders, header.name.toLowerCase(), header.value);
        }
        settle(cast {
          status: (status : Float),
          statusText: '',
          ok: status >= 200 && status < 300,
          headers: responseHeaders,
          body: decodeBody(bytes, responseType),
          url: url,
        });
      });
      future.onError(function(_error:Dynamic):Void {
        settle(transportFailure(url, 'network error'));
      });
    });
  }

  static function transportFailure(url:String, statusText:String):NetResponse {
    return cast {
      status: 0.0,
      statusText: statusText,
      ok: false,
      headers: {},
      body: null,
      url: url,
    };
  }

  static function decodeBody(bytes:Null<haxe.io.Bytes>, responseType:String):Dynamic {
    if (bytes == null) return null;
    return switch (responseType) {
      case 'json':
        try haxe.Json.parse(bytes.toString()) catch (_:Dynamic) null;
      // Native ArrayBuffer IS haxe.io.Bytes; no native Blob exists, so 'blob'
      // deliberately returns the same raw buffer.
      case 'arraybuffer', 'blob': bytes;
      default: bytes.toString();
    };
  }

  static function bodyToBytes(body:Dynamic):haxe.io.Bytes {
    if (Std.isOfType(body, String)) return haxe.io.Bytes.ofString(cast body);
    if (Std.isOfType(body, haxe.io.Bytes)) return cast body;
    final inner:Dynamic = _Runtime.field(body, 'buffer');
    if (inner != null && Std.isOfType(inner, haxe.io.Bytes)) return cast inner;
    return haxe.io.Bytes.ofString(Std.string(body));
  }

  static function stringField(owner:Dynamic, name:String, fallback:String):String {
    final value:Dynamic = _Runtime.field(owner, name);
    return value == null ? fallback : Std.string(value);
  }
  #end
}
#end
