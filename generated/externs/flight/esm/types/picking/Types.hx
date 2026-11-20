package flight.esm.types.picking;

#if (js && flight_esm)
typedef Scene3DHit = { node:Null<flight.esm.types.meshgeometry.Types.Mesh>, distance:Float, triangleIndex:Float, u:Float, v:Float, w:Float, pointX:Float, pointY:Float, pointZ:Float, normalX:Float, normalY:Float, normalZ:Float };

typedef Scene3DPickOptions = { ?cullBackfaces:Null<Bool>, ?maxDistance:Null<Float>, ?predicate:Null<((mesh:flight.esm.types.meshgeometry.Types.Mesh) -> Bool)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
