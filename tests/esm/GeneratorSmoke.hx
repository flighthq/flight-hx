class GeneratorBase {
  public function new() {}
  public function value():Int return 7;
}

class GeneratorChild extends GeneratorBase {
  public function new() { super(); }
  override public function value():Int return super.value() + 1;
}

// Exercise the custom generator independently of Flight imports and bindings.
class GeneratorSmoke {
  static var firstKey = {label: 'first'};
  static var initial:Map<{}, Int> = [firstKey => 11];

  static function main() {
    final secondKey = {label: 'second'};
    initial.set(secondKey, 22);
    if (initial.get(firstKey) != 11 || initial.get(secondKey) != 22)
      throw 'ObjectMap keys collided';
    final other:Map<{}, Int> = new Map();
    other.set({label: 'third'}, 33);
    if (initial.get(firstKey) != 11 || initial.get(secondKey) != 22)
      throw 'ObjectMap identity changed';

    final child = new GeneratorChild();
    if (!Std.isOfType(child, GeneratorChild) || !Std.isOfType(child, GeneratorBase))
      throw 'Subclass prototype chain is missing';
    if (child.value() != 8) throw 'Inherited method call failed';
    final error = new haxe.Exception('native base');
    if (!Std.isOfType(error, js.lib.Error)) throw 'Native prototype chain is missing';
    trace('FLIGHT_ESM_GENERATOR_OK');
  }
}
