import flight.Scene2dApp;
import flight.Sprite;

class SeededRandom {
  var state:Float;

  public function new(seed:Int) {
    state = seed;
  }

  public function next():Float {
    state = (state * 16807.0) % 2147483647.0;
    return state / 2147483647.0;
  }
}

class CameraSceneAuthor {
  static inline var WIDTH = 800;
  static inline var HEIGHT = 600;
  static inline var WORLD_WIDTH = 2400.0;
  static inline var WORLD_HEIGHT = 1800.0;
  static inline var PLAYER_SIZE = 24.0;

  public static function build(app:Scene2dApp):Void {
    final random = new SeededRandom(42);
    final landmarks:Array<{circle:Bool, size:Float, x:Float, y:Float, height:Float, color:Float}> = [];
    for (_ in 0...60) {
      final circle = random.next() <= 0.5;
      final size = 20.0 + random.next() * 80.0;
      final x = 100.0 + random.next() * (WORLD_WIDTH - 200.0);
      final y = 100.0 + random.next() * (WORLD_HEIGHT - 200.0);
      final height = circle ? size : 20.0 + random.next() * 80.0;
      final color = hsl(Math.floor(random.next() * 360.0));
      landmarks.push({circle: circle, size: size, x: x, y: y, height: height, color: color});
    }
    final stars:Array<{x:Float, y:Float, radius:Float, brightness:Float}> = [];
    for (_ in 0...80) {
      stars.push({
        x: random.next() * WIDTH,
        y: random.next() * HEIGHT,
        radius: 1.0 + random.next() * 2.0,
        brightness: 0.3 + random.next() * 0.7,
      });
    }
    final clouds:Array<{x:Float, y:Float, width:Float, height:Float}> = [];
    for (_ in 0...12) {
      clouds.push({
        x: random.next() * WIDTH,
        y: 50.0 + random.next() * 200.0,
        width: 80.0 + random.next() * 120.0,
        height: 30.0 + random.next() * 40.0,
      });
    }
    final mountains:Array<{x:Float, peakHeight:Float, width:Float}> = [];
    for (_ in 0...8) {
      mountains.push({
        x: random.next() * WIDTH,
        peakHeight: 100.0 + random.next() * 200.0,
        width: 120.0 + random.next() * 180.0,
      });
    }

    final root = app.root();
    final starsContainer = app.createDisplayObject(root);
    final mountainsContainer = app.createDisplayObject(root);
    final cloudsContainer = app.createDisplayObject(root);
    final worldContainer = app.createDisplayObject(root);

    final starsShape = app.createShape(starsContainer);
    for (star in stars) {
      app.beginFill(starsShape, 4294955263.0, star.brightness);
      app.circle(starsShape, star.x, star.y, star.radius);
      app.endFill(starsShape);
    }

    final mountainsShape = app.createShape(mountainsContainer);
    for (mountain in mountains) {
      app.beginFill(mountainsShape, 1011901695.0, 0.6);
      app.triangle(
        mountainsShape,
        mountain.x - mountain.width * 0.5,
        HEIGHT,
        mountain.x,
        HEIGHT - mountain.peakHeight,
        mountain.x + mountain.width * 0.5,
        HEIGHT
      );
      app.endFill(mountainsShape);
    }

    final cloudsShape = app.createShape(cloudsContainer);
    for (cloud in clouds) {
      app.beginFill(cloudsShape, 3369264895.0, 0.4);
      app.ellipse(cloudsShape, cloud.x, cloud.y, cloud.width * 0.5, cloud.height * 0.5);
      app.endFill(cloudsShape);
    }

    // Match the upstream camera2d subject: one shared 1x1 bitmap texture, stretched through
    // genuine Sprite nodes. Scene2dApp owns that texture on both backends.
    final gridContainer = app.createDisplayObject(worldContainer);
    var grid = 0;
    while (grid <= WORLD_WIDTH) {
      final sprite:Sprite = app.createSolidSprite(
        gridContainer,
        1685622015.0,
        grid - 0.5,
        0.0,
        1.0,
        WORLD_HEIGHT,
        0.15
      );
      grid += 100;
    }
    grid = 0;
    while (grid <= WORLD_HEIGHT) {
      final sprite:Sprite = app.createSolidSprite(
        gridContainer,
        1685622015.0,
        0.0,
        grid - 0.5,
        WORLD_WIDTH,
        1.0,
        0.15
      );
      grid += 100;
    }

    final borderShape = app.createShape(worldContainer);
    app.lineStyle(borderShape, 3.0, 3360706815.0, 0.5);
    app.rectangle(borderShape, 0.0, 0.0, WORLD_WIDTH, WORLD_HEIGHT);
    app.endFill(borderShape);

    for (landmark in landmarks) {
      final shape = app.createShape(worldContainer);
      app.beginFill(shape, landmark.color, 0.7);
      if (landmark.circle) {
        app.circle(shape, landmark.x, landmark.y, landmark.size * 0.5);
      } else {
        app.rectangle(
          shape,
          landmark.x - landmark.size * 0.5,
          landmark.y - landmark.height * 0.5,
          landmark.size,
          landmark.height
        );
      }
      app.endFill(shape);
    }

    final playerShape = app.createShape(worldContainer);
    app.beginFill(playerShape, 4291572735.0, 1.0);
    app.triangle(
      playerShape,
      WORLD_WIDTH * 0.5,
      WORLD_HEIGHT * 0.5 - PLAYER_SIZE,
      WORLD_WIDTH * 0.5 + PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6,
      WORLD_WIDTH * 0.5 - PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6
    );
    app.endFill(playerShape);
    app.lineStyle(playerShape, 2.0, 3432579327.0, 1.0);
    app.triangle(
      playerShape,
      WORLD_WIDTH * 0.5,
      WORLD_HEIGHT * 0.5 - PLAYER_SIZE,
      WORLD_WIDTH * 0.5 + PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6,
      WORLD_WIDTH * 0.5 - PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6
    );
    app.endFill(playerShape);

    final boundsShape = app.createShape(worldContainer);
    app.lineStyle(boundsShape, 2.0, 13133055.0, 0.6);
    app.rectangle(boundsShape, 800.0, 600.0, WIDTH, HEIGHT);
    app.endFill(boundsShape);

    // These values are the generated Camera2D view/parallax outputs for a camera centered at
    // (1200, 900), a viewport of 800x600, and zoom 1. Keeping them in the authored Haxe command
    // stream makes both backends exercise the same graph and transform invalidation path.
    app.setTransform(starsContainer, 1.0, 0.0, 0.0, 1.0, -120.0, -90.0);
    app.setTransform(mountainsContainer, 1.0, 0.0, 0.0, 1.0, -480.0, -360.0);
    app.setTransform(cloudsContainer, 1.0, 0.0, 0.0, 1.0, -720.0, -540.0);
    app.setTransform(worldContainer, 1.0, 0.0, 0.0, 1.0, -800.0, -600.0);
  }

  static function hsl(hue:Float):Float {
    final saturation = 0.6;
    final lightness = 0.5;
    final chroma = (1.0 - Math.abs(2.0 * lightness - 1.0)) * saturation;
    final intermediate = chroma * (1.0 - Math.abs((hue / 60.0) % 2.0 - 1.0));
    final match = lightness - chroma * 0.5;
    var red = 0.0;
    var green = 0.0;
    var blue = 0.0;
    if (hue < 60.0) {
      red = chroma;
      green = intermediate;
    } else if (hue < 120.0) {
      red = intermediate;
      green = chroma;
    } else if (hue < 180.0) {
      green = chroma;
      blue = intermediate;
    } else if (hue < 240.0) {
      green = intermediate;
      blue = chroma;
    } else if (hue < 300.0) {
      red = chroma;
      blue = intermediate;
    } else {
      red = chroma;
      blue = intermediate;
    }
    final r = Math.round((red + match) * 255.0);
    final g = Math.round((green + match) * 255.0);
    final b = Math.round((blue + match) * 255.0);
    return r * 65536.0 + g * 256.0 + b;
  }
}

class Camera2d {
  static function main():Void {
    final app = new Scene2dApp(800, 600);
    CameraSceneAuthor.build(app);
    if (app.nodeCount() != 116 || app.shapeCount() != 66 || app.spriteCount() != 44) {
      throw 'unexpected Camera2D graph inventory';
    }
    for (frame in 0...3) {
      if (!app.renderFrame()) {
        throw 'Flight Scene2D GL frame $frame failed (coverage ${app.maximumCoverage()})';
      }
    }
    if (app.verifiedFrames() != 3) throw 'Flight did not verify all Camera2D frames';
    trace(app.successMessage());
    app.dispose();
  }
}
