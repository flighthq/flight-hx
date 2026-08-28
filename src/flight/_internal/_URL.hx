package flight._internal;

#if !js
/** Native URL subset plus process-local object URLs for resource loaders. */
@:keep
class _URL {
  static final blobs = new Map<String, _Blob>();
  static var nextId = 1;
  public final href:String;
  public final origin:String;
  public final protocol:String;

  public function new(url:String, ?base:String) {
    href = resolve(url, base);
    final schemeEnd = href.indexOf(':');
    if (schemeEnd <= 0 || !isScheme(href.substring(0, schemeEnd))) throw 'Invalid URL: ' + url;
    protocol = href.substring(0, schemeEnd).toLowerCase() + ':';
    final authorityStart = schemeEnd + 3;
    if (href.substr(schemeEnd + 1, 2) != '//') {
      origin = 'null';
      return;
    }
    var authorityEnd = href.length;
    for (separator in ['/', '?', '#']) {
      final at = href.indexOf(separator, authorityStart);
      if (at >= 0 && at < authorityEnd) authorityEnd = at;
    }
    final authority = href.substring(authorityStart, authorityEnd).toLowerCase();
    origin = protocol == 'file:' || authority.length == 0 ? 'null' : protocol + '//' + authority;
  }

  public static function createObjectURL(blob:_Blob):String {
    if (blob == null) throw 'URL.createObjectURL requires a Blob';
    final url = 'blob:flight-native/' + nextId++;
    blobs.set(url, blob);
    return url;
  }

  public static function revokeObjectURL(url:String):Void blobs.remove(url);

  public static function resolveObjectURL(url:String):Null<_Blob> return blobs.get(url);

  static function resolve(url:String, base:Null<String>):String {
    if (url == null) throw 'Invalid URL';
    final schemeEnd = url.indexOf(':');
    if (schemeEnd > 0 && isScheme(url.substring(0, schemeEnd))) return url;
    if (base == null) throw 'Relative URL requires a base';
    final parsedBase = new _URL(base);
    if (StringTools.startsWith(url, '//')) return parsedBase.protocol + url;
    if (StringTools.startsWith(url, '/')) {
      if (parsedBase.origin == 'null') throw 'Relative URL requires an origin base';
      return parsedBase.origin + url;
    }
    final slash = parsedBase.href.lastIndexOf('/');
    if (slash < parsedBase.href.indexOf(':') + 2) throw 'Relative URL requires a hierarchical base';
    return parsedBase.href.substring(0, slash + 1) + url;
  }

  static function isScheme(value:String):Bool {
    if (value.length == 0 || !isAlpha(value.charCodeAt(0))) return false;
    for (index in 1...value.length) {
      final code = value.charCodeAt(index);
      if (!isAlpha(code) && (code < '0'.code || code > '9'.code) && code != '+'.code && code != '-'.code
        && code != '.'.code) {
        return false;
      }
    }
    return true;
  }

  static inline function isAlpha(code:Int):Bool return (code >= 'A'.code && code <= 'Z'.code)
    || (code >= 'a'.code && code <= 'z'.code);
}
#end
