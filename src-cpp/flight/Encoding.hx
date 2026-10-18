// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function decodeUTF8(bytes:flight._internal._UInt8Array, ?offset:Float, ?length:Float):String {
  return flight._cpp._attempt.Attempt_Encoding_decodeUTF8.decodeUTF8(bytes, offset, length);
}

extern inline function encodeUTF8(text:String):flight._internal._UInt8Array {
  return flight._cpp._attempt.Attempt_Encoding_encodeUTF8.encodeUTF8(text);
}
