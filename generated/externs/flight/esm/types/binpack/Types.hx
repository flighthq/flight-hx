package flight.esm.types.binpack;

#if (js && flight_esm)
typedef BinPackHeuristic = String;

typedef BinPackOptions = { ?padding:Null<Float>, ?border:Null<Float>, ?allowRotation:Null<Bool>, ?heuristic:Null<String>, ?growable:Null<Bool>, ?powerOfTwo:Null<Bool>, ?square:Null<Bool>, ?maxWidth:Null<Float>, ?maxHeight:Null<Float> };

typedef PackResult = { placements:Array<flight.esm.types.binpack.Types.PackedRectangle>, width:Float, height:Float, unpacked:Array<flight.esm.types.binpack.Types.RectangleId> };

typedef PackableRectangle = { id:flight.esm.types.binpack.Types.RectangleId, width:Float, height:Float };

typedef PackedRectangle = { id:flight.esm.types.binpack.Types.RectangleId, x:Float, y:Float, width:Float, height:Float, rotated:Bool };

typedef RectangleId = Dynamic;

typedef UnpackedRectangleExplanation = { id:flight.esm.types.binpack.Types.RectangleId, reason:flight.esm.types.binpack.Types.UnpackedRectangleReason, usableWidth:Float, usableHeight:Float };

typedef UnpackedRectangleReason = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
