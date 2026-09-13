import flight._hx.color.ColorFromKelvin.colorFromKelvin;

/** Executes a compiler-emitted function while the gate type-checks the entire generated tree. */
class GeneratedTranspileSmoke {
  static function main():Void {
    final color = colorFromKelvin(6500);
    if (color != 4294900479) throw 'colorFromKelvin wrong: $color';
    trace('GENERATED_TRANSPILE_OK');
  }
}
