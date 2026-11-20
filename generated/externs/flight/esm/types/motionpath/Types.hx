package flight.esm.types.motionpath;

#if (js && flight_esm)
typedef MotionPathDirection = Float;

typedef MotionPathLoopMode = String;

typedef MotionPathRaw = { direction:flight.esm.types.motionpath.Types.MotionPathDirection, distance:Float, length:Float, loopMode:flight.esm.types.motionpath.Types.MotionPathLoopMode, path:flight.esm.types.path_contract.Types.PathRaw, speed:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
