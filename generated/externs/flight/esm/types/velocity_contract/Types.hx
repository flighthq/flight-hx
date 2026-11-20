package flight.esm.types.velocity_contract;

#if (js && flight_esm)
typedef SourceId = flight.esm.types.velocity.Types.SourceId;

typedef Velocity2D = flight.esm.types.velocity.Types.Velocity2D;

typedef VelocityExplanation = flight.esm.types.velocity.Types.VelocityExplanation;

typedef VelocityField = flight.esm.types.velocity.Types.VelocityField;

typedef VelocityReason = flight.esm.types.velocity.Types.VelocityReason;

typedef VelocitySample = flight.esm.types.velocity.Types.VelocitySample;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
