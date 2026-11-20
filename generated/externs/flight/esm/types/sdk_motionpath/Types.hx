package flight.esm.types.sdk_motionpath;

#if (js && flight_esm)
typedef MotionPathDirection = flight.esm.types.motionpath.Types.MotionPathDirection;

typedef MotionPathLoopMode = flight.esm.types.motionpath.Types.MotionPathLoopMode;

typedef MotionPathRaw = flight.esm.types.motionpath.Types.MotionPathRaw;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
