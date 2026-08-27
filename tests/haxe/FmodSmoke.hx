package;

import flight._internal._Runtime;

class FmodSmoke {
  public static function main():Void {
    run();
  }

  public static function run():Void {
    if (_Runtime.fmod(282475249.0 * 16807.0, 2147483647.0) != 1622650073.0) {
      throw 'float remainder lost precision';
    }
    if (_Runtime.fmod(-5.0, 2.0) != -1.0 || _Runtime.fmod(5.0, -2.0) != 1.0) {
      throw 'float remainder sign diverged from JavaScript';
    }
    if (_Runtime.toInt32(4294967297.0) != 1 || _Runtime.toInt32(-4294967297.0) != -1) {
      throw 'ToInt32 float remainder failed';
    }
  }
}
