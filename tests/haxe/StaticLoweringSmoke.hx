package;

import flight.Math.*;

class StaticLoweringSmoke {
  public static function run():Void {
    final nan = Math.NaN;
    if (nan < 0 || nan <= 0 || nan > 0 || nan >= 0) throw 'target NaN relations failed';
    if (!Math.isNaN(clamp(nan, 0, 10))) throw 'generated NaN relational lowering failed';
  }

  static function main():Void {
    run();
  }
}
