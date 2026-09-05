// Consumer-style regression for the Node<Traits> covariance fix. Upstream marks
// `NodeData.data` (NodeTraits.data) `readonly`; the generator emits a readonly
// nullable reference field as the covariant read-only structure field
// `(default, never)`. Without it, a node subtype that narrows TData
// (ParticleEmitter3D : Node3D<ParticleEmitterData>) fails to unify with the
// structural `Node<Traits>` a free Node function takes — Haxe holds a plain `var`
// field invariant. Compilation of `acceptsNode(emitter)` IS the assertion; it must
// hold on both the nominal class and the `-D flight_struct_typedef` representation.
import flight.ParticleEmitter;

class NodeCovarianceSmoke {
  static function acceptsNode<T>(node:flight.types.Node<T>):Void {
    // A read of the wide field is all a covariant consumer needs.
    if (node == null) throw 'node was null';
  }

  public static function run():Void {
    final emitter = ParticleEmitter.createParticleEmitter3D();
    // The covariance under test: a Node3D<ParticleEmitterData> passed where a
    // structural Node<Traits> is expected.
    acceptsNode(emitter);
    // The narrowing that makes the fix worth keeping still types the data field.
    if (emitter.data.particleCount < 0) throw 'unexpected particleCount';
  }

  public static function main():Void {
    run();
    Sys.println('NODE_COVARIANCE_SMOKE_OK');
  }
}
