package flight;

// Platform extension backed by Flight::HostSdlGl. This is intentionally separate from Flight's
// generated cross-platform Host contract: it proves the real native window/context/present seam
// without claiming the remaining generated renderer surface is available through Haxe.
inline function runHostSdlGlSmoke(width:Int = 96, height:Int = 64):Bool {
  return flight._cpp._fn.HostSdlGl.smoke(width, height);
}
