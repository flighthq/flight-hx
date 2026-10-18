// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

var BIN_PACK_DEFAULT_MAX_EXTENT(get, set):Float;

private extern inline function get_BIN_PACK_DEFAULT_MAX_EXTENT():Float return flight._cpp._attempt.Attempt_Binpack_BIN_PACK_DEFAULT_MAX_EXTENT.BIN_PACK_DEFAULT_MAX_EXTENT;

private extern inline function set_BIN_PACK_DEFAULT_MAX_EXTENT(value:Float):Float return flight._cpp._attempt.Attempt_Binpack_BIN_PACK_DEFAULT_MAX_EXTENT.BIN_PACK_DEFAULT_MAX_EXTENT = value;

extern inline function explainUnpackedRectangles(rectangles:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):Array<flight.UnpackedRectangleExplanation> {
  return flight._cpp._attempt.Attempt_Binpack_explainUnpackedRectangles.explainUnpackedRectangles(rectangles, options);
}

extern inline function getPackResultOccupancy(result:flight.PackResult):Float {
  return flight._cpp._attempt.Attempt_Binpack_getPackResultOccupancy.getPackResultOccupancy(result);
}

extern inline function packRectangles(rects:Array<flight.PackableRectangle>, ?options:flight.BinPackOptions):flight.PackResult {
  return flight._cpp._attempt.Attempt_Binpack_packRectangles.packRectangles(rects, options);
}
