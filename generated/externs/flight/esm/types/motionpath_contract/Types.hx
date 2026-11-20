package flight.esm.types.motionpath_contract;

#if (js && flight_esm)
typedef MotionPath = { direction:flight.esm.types.motionpath.Types.MotionPathDirection, distance:Float, length:Float, loopMode:flight.esm.types.motionpath.Types.MotionPathLoopMode, path:flight.esm.types.path_contract.Types.PathRaw, speed:Float };

typedef MotionPathDirection = flight.esm.types.motionpath.Types.MotionPathDirection;

typedef MotionPathLoopMode = flight.esm.types.motionpath.Types.MotionPathLoopMode;

typedef MotionPathRaw = flight.esm.types.motionpath.Types.MotionPathRaw;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
