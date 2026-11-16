class FieldSmoke {
  static function main() {
    final font:flight.FontResource = cast {family: 'Sans Ω'};
    if (font.family != 'Sans Ω') throw 'string read failed';
    font.family = '';
    if (font.family != '') throw 'string write failed';
    final color:flight.ColorScaleBias = cast {redScale: 1.0};
    color.redScale = 0.25;
    if (color.redScale != 0.25) throw 'glob exported field failed';
    final raw:Dynamic = {};
    Reflect.setField(raw, 'operator', 'over');
    final effect:flight.CompositeEffect = cast raw;
    effect.operator_ = 'in';
    if (effect.operator_ != 'in') throw 'keyword field failed';
    trace('FLIGHT_ESM_FIELDS_OK');
  }
}
