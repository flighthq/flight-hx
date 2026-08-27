package;

import flighthq.pathBoolean.MartinezKernel.createMartinezPathBooleanBackend;
import flighthq.types.PathBooleanContour;

@:access(flighthq.pathBoolean.MartinezKernel)
class PathBooleanDceSmoke {
  static function main():Void {
    final subject:Array<PathBooleanContour> = [[0, 0, 10, 0, 10, 10, 0, 10]];
    final clip:Array<PathBooleanContour> = [[5, 0, 15, 0, 15, 10, 5, 10]];
    final backend = createMartinezPathBooleanBackend();
    final result:Array<PathBooleanContour> = cast backend.computePathBoolean(
      subject,
      clip,
      'intersection',
      'nonZero',
    );
    if (result.length != 1 || result[0].length < 8) throw 'path boolean intersection was not computed';
  }
}
