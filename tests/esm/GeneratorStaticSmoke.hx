private class StaticFields {
  public static var length = 4;
  public static final name = 'fields';
}

private class StaticMethods {
  public static dynamic function length():Int return 8;
  public static function name():String return 'methods';
}

class GeneratorStaticSmoke {
  static function main() {
    if (StaticFields.length != 4 || StaticFields.name != 'fields')
      throw new js.lib.Error('Static constructor fields changed');
    StaticFields.length++;
    if (StaticFields.length != 5) throw new js.lib.Error('Static length field is not writable');

    if (StaticMethods.length() != 8 || StaticMethods.name() != 'methods')
      throw new js.lib.Error('Static constructor methods changed');
    StaticMethods.length = () -> 16;
    if (StaticMethods.length() != 16) throw new js.lib.Error('Dynamic static length method is not writable');
    trace('FLIGHT_ESM_STATICS_OK');
  }
}
