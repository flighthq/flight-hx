import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var quads:Array<Dynamic> = [];
  var batch:Dynamic;
  override public function flightReady():Void {
    final stage = createStage("Bunnymark-style benchmark");
    batch = Sdk.createQuadBatch();
    Sdk.resizeQuadBatch(batch, 500);
    for (i in 0...500) quads.push(addRectangle(stage, 20 + (i * 37) % 760, 50 + (i * 53) % 420, 12, 12, 0x44aaff));
    addLabel(stage, "500 independently animated nodes", 20, 465);
  }
  override public function flightUpdate(dt:Float):Void for (i in 0...quads.length) {
    final quad = quads[i]; quad.y += (40 + (i % 11) * 9) * dt; if (quad.y > 480) quad.y = 40; Sdk.invalidateNodeLocalTransform(quad);
  }
}
