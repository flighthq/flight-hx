package;

class TypedStructClassSmoke {
  static function main():Void {
    run();
  }

  public static function run():Void {
    final camera = flighthq.camera2d.Camera2d.createCamera2D(640, 480, {x: 12, y: 34, zoom: 2, rotation: 0.25});
    if (camera.x != 12 || camera.y != 34 || camera.zoom != 2 || camera.rotation != 0.25) {
      throw 'Camera2D construction lost field values';
    }
    if (camera.viewportWidth != 640 || camera.viewportHeight != 480) {
      throw 'Camera2D construction lost viewport values';
    }
    #if cpp
    if (!Std.isOfType(camera, flighthq.types.Camera2D)) {
      throw 'Camera2D cpp pilot did not construct a class instance';
    }
    #end
  }
}
