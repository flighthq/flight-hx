package flight.esm.binpack;

#if (js && flight_esm)
@:jsRequire("@flighthq/binpack/contract")
extern class Contract {
  public static final BIN_PACK_DEFAULT_MAX_EXTENT:Float;
  public static function explainUnpackedRectangles(out:Array<flight.esm.types.binpack.Types.UnpackedRectangleExplanation>, rectangles:Array<flight.esm.types.binpack.Types.PackableRectangle>, ?options:Null<flight.esm.types.binpack.Types.BinPackOptions>):Void;
  public static function getBinPackHeuristicString(value:flight.esm.types.binpack.Types.BinPackHeuristic):String;
  public static function getPackResultOccupancy(result:flight.esm.types.binpack.Types.PackResult):Float;
  public static function getUnpackedRectangleReasonString(value:flight.esm.types.binpack.Types.UnpackedRectangleReason):String;
  public static function packRectangles(rects:Array<flight.esm.types.binpack.Types.PackableRectangle>, ?options:Null<flight.esm.types.binpack.Types.BinPackOptions>):flight.esm.types.binpack.Types.PackResult;
  public static function parseBinPackHeuristic(value:String):Null<String>;
  public static function parseUnpackedRectangleReason(value:String):Null<String>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
