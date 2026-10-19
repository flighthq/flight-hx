// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function explainUnpackedRectangles(rectangles:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):Array<flight.UnpackedRectangleExplanation> {
  return flight._cpp._fn.Binpack.explainUnpackedRectangles(rectangles, options);
}

extern inline function getPackResultOccupancy(result:flight.PackResult):Float {
  return flight._cpp._fn.Binpack.getPackResultOccupancy(result);
}

extern inline function packRectangles(rects:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):flight.PackResult {
  return flight._cpp._fn.Binpack.packRectangles(rects, options);
}

var BIN_PACK_DEFAULT_MAX_EXTENT(get, never):Float;

private inline function get_BIN_PACK_DEFAULT_MAX_EXTENT():Float return flight._cpp._fn.Binpack.get_BIN_PACK_DEFAULT_MAX_EXTENT();
