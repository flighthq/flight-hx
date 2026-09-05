// Maintained host adapter: Flight net backend for the Clay host.
// js delegates to Flight's web backend; native is a real haxe.Http transport
// porting LimeNet's contract — expected failures resolve to the sentinel
// response (status 0, ok false) rather than rejecting; a non-2xx status is a
// normal response with ok false. WRITE-AHEAD against develop (net now has a host
// install slot, flight._Net.installNetHostBackend). See host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.NetBackend;
import flight._internal._Promise;
import flight._internal._Runtime;

class ClayNet {
  /** Composed into the host `net.http` slot by HostClay. */
  public static function createClayNetBackend():NetBackend {
    #if js
    return flight._HostWeb.createWebNetBackend();
    #else
    return cast {
      sendNetRequest: function(request:Dynamic, ?options:Dynamic):_Promise<Dynamic> {
        return new _Promise(function(resolve:Dynamic->Void, _reject) {
          final url:String = request.url;
          var settled = false;
          final settle = function(r:Dynamic):Void { if (!settled) { settled = true; resolve(r); } };
          final fail = function(reason:String):Void
            settle({status: 0.0, statusText: reason, ok: false, headers: {}, body: null, url: url});

          final http = new haxe.Http(url);
          final headers:Dynamic = _Runtime.field(request, 'headers');
          if (headers != null) for (name in Reflect.fields(headers)) http.setHeader(name, Std.string(Reflect.field(headers, name)));
          final body:Dynamic = _Runtime.field(request, 'body');
          if (body != null) http.setPostData(Std.isOfType(body, String) ? cast body : Std.string(body));

          var status = 0;
          http.onStatus = function(s:Int) status = s;
          http.onData = function(data:String) {
            settle({
              status: (status : Float), statusText: '', ok: status >= 200 && status < 300,
              headers: {}, body: decode(data, stringField(request, 'responseType', 'text')), url: url,
            });
          };
          http.onError = function(_e:String) fail('network error');

          final method = stringField(request, 'method', 'GET');
          try http.request(method == 'POST' || body != null) catch (_:Dynamic) fail('network error');
        });
      },
    };
    #end
  }

  #if !js
  static function decode(data:String, responseType:String):Dynamic {
    return switch (responseType) {
      case 'json': try haxe.Json.parse(data) catch (_:Dynamic) null;
      case 'arraybuffer', 'blob': haxe.io.Bytes.ofString(data);
      default: data;
    };
  }
  static function stringField(o:Dynamic, name:String, fallback:String):String {
    final v:Dynamic = _Runtime.field(o, name);
    return v == null ? fallback : Std.string(v);
  }
  #end
}
#end
