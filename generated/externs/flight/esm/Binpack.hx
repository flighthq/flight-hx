package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/binpack")
extern class Binpack {
  public static function explainUnpackedRectangles(out:Array<flight.esm.types.binpack.Types.UnpackedRectangleExplanation>, rectangles:Array<flight.esm.types.binpack.Types.PackableRectangle>, ?options:Null<flight.esm.types.binpack.Types.BinPackOptions>):Void;
  public static function getPackResultOccupancy(result:flight.esm.types.binpack.Types.PackResult):Float;
  public static function packRectangles(rects:Array<flight.esm.types.binpack.Types.PackableRectangle>, ?options:Null<flight.esm.types.binpack.Types.BinPackOptions>):flight.esm.types.binpack.Types.PackResult;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
