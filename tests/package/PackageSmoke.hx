package;

import flighthq.sdk.Sdk.*;
import flighthq.types.Vector2.Vector2Like;

class PackageSmoke {
  static function main():Void {
    final vector:Vector2Like = createVector2(5, 12);
    if (getVector2Length(vector) != 13) throw 'installed flight package failed';
  }
}
