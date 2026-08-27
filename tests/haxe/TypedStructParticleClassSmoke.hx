package;

@:access(flighthq.particleemitter.ParticleEmitter)
@:access(flighthq.particles.ParticleEmitterState)
class TypedStructParticleClassSmoke {
  static function main():Void {
    run();
  }

  public static function run():Void {
    final transforms = new flighthq._internal._Float32Array([1, 2, 3, 4]);
    final data = flighthq.particleemitter.ParticleEmitter.createParticleEmitterData({
      particleCount: 1,
      transforms: transforms,
      worldSpace: true,
    });
    final dataAlias = data;
    if (data.transforms != transforms || data.particleCount != 1 || !data.worldSpace || data.atlas != null) {
      throw 'ParticleEmitterData construction lost supplied values';
    }
    if (data.alphas.length != 0 || data.colors.length != 0 || data.ids.length != 0 || data.velocities.length != 0) {
      throw 'ParticleEmitterData construction lost empty defaults';
    }
    data.particleCount = 2;
    if (dataAlias.particleCount != 2) throw 'ParticleEmitterData lost mutation identity';

    final random = flighthq.math.Random.createRandomSource(123);
    final state = flighthq.particles.ParticleEmitterState.createParticleEmitterState(random);
    final stateAlias = state;
    if (state.random != random || state.lifetimes.length != 0 || state.velocities.length != 0) {
      throw 'ParticleEmitterState construction lost supplied values or empty defaults';
    }
    state.emitterAge = 4;
    flighthq.particles.ParticleEmitterState.ensureParticleEmitterStateCapacity(state, 2, true);
    if (stateAlias.emitterAge != 4 || stateAlias.lifetimes.length < 4 || stateAlias.velocities.length < 6) {
      throw 'ParticleEmitterState lost mutation identity or capacity';
    }
    if (stateAlias.scales.length < 2 || stateAlias.rotationSpeeds.length < 2) {
      throw 'ParticleEmitterState lost scalar capacity';
    }
    if (stateAlias.colorBirth.length < 6 || stateAlias.colorDeath.length < 6) {
      throw 'ParticleEmitterState lost color capacity';
    }

    #if cpp
    if (!Std.isOfType(state, flighthq.types.ParticleEmitterState)) {
      throw 'ParticleEmitterState retained Gate 4 class did not construct an instance';
    }
    #end
  }
}
