package flight.esm.types.sdk_particleemitter;

#if (js && flight_esm)
typedef ParticleEmitter2D = flight.esm.types.particleemitter.Types.ParticleEmitter2D;

typedef ParticleEmitter2DRuntime = flight.esm.types.particleemitter.Types.ParticleEmitter2DRuntime;

typedef ParticleEmitter3D = flight.esm.types.particleemitter.Types.ParticleEmitter3D;

typedef ParticleEmitter3DRuntime = flight.esm.types.particleemitter.Types.ParticleEmitter3DRuntime;

typedef ParticleEmitterCallbacks = flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks;

typedef ParticleEmitterData = flight.esm.types.particleemitter.Types.ParticleEmitterData;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
