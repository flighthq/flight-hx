package flight.esm.types.velocity;

#if (js && flight_esm)
typedef SourceId = Dynamic;

typedef Velocity2D = { x:Float, y:Float };

typedef VelocityExplanation = { currentFrameId:Float, explicit:Bool, lastFrameId:Float, reason:flight.esm.types.velocity.Types.VelocityReason, x:Float, y:Float };

typedef VelocityField = { frameId:Float, samples:Dynamic };

typedef VelocityReason = String;

typedef VelocitySample = { previousWorldTransform:Null<flight.esm.types.geometry.Types.Matrix>, velocity:flight.esm.types.velocity.Types.Velocity2D, lastFrameId:Float, explicitFrameId:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
