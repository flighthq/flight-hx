import flighthq.Sdk;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
class Main extends ExampleHost {
  var camera:Dynamic; var world:Dynamic; var player:Dynamic; var dx = 0.0; var dy = 0.0;
  override public function flightReady():Void {
    final stage = createStage("2D camera"); camera = Sdk.createCamera2D(800, 600, {zoom: 1.0}); world = Sdk.createDisplayObject(); Sdk.addNodeChild(stage, world);
    for (x in 0...12) for (y in 0...8) addRectangle(world, x * 100, y * 100, 96, 96, ((x + y) % 2 == 0) ? 0x18344a : 0x20445c);
    player = addCircle(world, 400, 300, 16, 0xffcc33); addLabel(stage, "Arrow keys move; the camera follows.", 20, 555);
  }
  override public function flightUpdate(dt:Float):Void {
    player.x += dx * dt; player.y += dy * dt; Sdk.updateCamera2DFollow(camera, player.x, player.y, dt, {smoothTime: 0.15});
    final view = {a:1.0,b:0.0,c:0.0,d:1.0,tx:0.0,ty:0.0}; Sdk.getCamera2DViewMatrix(camera, view); world.scaleX = view.a; world.skewY = view.b; world.skewX = view.c; world.scaleY = view.d; world.x = view.tx; world.y = view.ty; Sdk.invalidateNodeLocalTransform(world);
  }
  override public function onKeyDown(key:KeyCode, mod:KeyModifier):Void switch key { case LEFT: dx=-240; case RIGHT: dx=240; case UP: dy=-240; case DOWN: dy=240; default: }
  override public function onKeyUp(key:KeyCode, mod:KeyModifier):Void switch key { case LEFT, RIGHT: dx=0; case UP, DOWN: dy=0; default: }
}
