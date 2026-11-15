// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

inline function decodeUTF8(bytes:flight._internal._UInt8Array, ?offset:Float, ?length:Float):String {
  return flight._cpp._fn.Encoding.decodeUTF8(bytes, offset != null, offset == null ? 0.0 : offset, length != null, length == null ? 0.0 : length);
}

inline function encodeUTF8(text:String):flight._internal._UInt8Array {
  return flight._cpp._fn.Encoding.encodeUTF8(text);
}
