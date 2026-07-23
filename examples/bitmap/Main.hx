import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  override public function flightReady():Void {
    final stage = createStage("Bitmap");
    final bitmapNodes = [Sdk.createBitmap(), Sdk.createBitmap(), Sdk.createBitmap()];
    addLabel(stage, "Lime supplies native image assets; Flight owns bitmap nodes.", 30, 70);
    final colors = [0xff3355, 0x33dd88, 0x3388ff, 0xffcc33];
    for (i in 0...colors.length) { final image = addRectangle(stage, 70 + i * 170, 150, 128, 128, colors[i]); image.rotation = i * 8; }
    addLabel(stage, "Procedural stand-ins keep the port asset-free.", 30, 330);
  }
}
