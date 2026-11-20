package flight.esm.types.sdk_particles;

#if (js && flight_esm)
typedef AttractorForce = flight.esm.types.particles.Types.AttractorForce;

typedef CircleCollider = flight.esm.types.particles.Types.CircleCollider;

typedef CollisionResponse = flight.esm.types.particles.Types.CollisionResponse;

typedef ColorKeyframe = flight.esm.types.particles.Types.ColorKeyframe;

typedef CurlNoiseForce = flight.esm.types.particles.Types.CurlNoiseForce;

typedef CurveKeyframe = flight.esm.types.particles.Types.CurveKeyframe;

typedef DragForce = flight.esm.types.particles.Types.DragForce;

typedef ForceFalloff = flight.esm.types.particles.Types.ForceFalloff;

typedef ParticleBlendMode = flight.esm.types.particles.Types.ParticleBlendMode;

typedef ParticleBurstEntry = flight.esm.types.particles.Types.ParticleBurstEntry;

typedef ParticleBurstSchedule = flight.esm.types.particles.Types.ParticleBurstSchedule;

typedef ParticleCollider = flight.esm.types.particles.Types.ParticleCollider;

typedef ParticleConfigIssue = flight.esm.types.particles.Types.ParticleConfigIssue;

typedef ParticleCurve = flight.esm.types.particles.Types.ParticleCurve;

typedef ParticleDeathEvent = flight.esm.types.particles.Types.ParticleDeathEvent;

typedef ParticleEmitterConfig = flight.esm.types.particles.Types.ParticleEmitterConfig;

typedef ParticleEmitterShape = flight.esm.types.particles.Types.ParticleEmitterShape;

typedef ParticleEmitterSignals = flight.esm.types.particles.Types.ParticleEmitterSignals;

typedef ParticleEmitterState = flight.esm.types.particles.Types.ParticleEmitterState;

typedef ParticleForce = flight.esm.types.particles.Types.ParticleForce;

typedef ParticleObject = flight.esm.types.particles.Types.ParticleObject;

typedef ParticleObjectsState = flight.esm.types.particles.Types.ParticleObjectsState;

typedef ParticleObjectsUpdateOptions = flight.esm.types.particles.Types.ParticleObjectsUpdateOptions;

typedef ParticleSpawnEvent = flight.esm.types.particles.Types.ParticleSpawnEvent;

typedef PlaneCollider = flight.esm.types.particles.Types.PlaneCollider;

typedef PointGravityWellForce = flight.esm.types.particles.Types.PointGravityWellForce;

typedef RectangleCollider = flight.esm.types.particles.Types.RectangleCollider;

typedef SphereCollider = flight.esm.types.particles.Types.SphereCollider;

typedef TurbulenceForce = flight.esm.types.particles.Types.TurbulenceForce;

typedef VortexForce = flight.esm.types.particles.Types.VortexForce;

typedef WindForce = flight.esm.types.particles.Types.WindForce;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
