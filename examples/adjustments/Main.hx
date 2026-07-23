import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var time = 0.0; var swatches:Array<Dynamic> = [];
  override public function flightReady():Void {
    final stage = createStage("Color adjustments");
    final colors = [0xff3366ff, 0x33ff99ff, 0x3399ffff, 0xffcc33ff];
    for (i in 0...colors.length) { addRectangle(stage, 80 + i * 150, 120, 90, 90, colors[i] >>> 8); swatches.push(addRectangle(stage, 80 + i * 150, 300, 90, 90, colors[i] >>> 8)); }
    addLabel(stage, "Original", 80, 90); addLabel(stage, "Fused animated matrix", 80, 270);
  }
  override public function flightUpdate(dt:Float):Void {
    time += dt;
    final matrix = Sdk.fuseColorMatrices([Sdk.createBrightnessColorMatrix(Math.sin(time) * 48), Sdk.createContrastColorMatrix(1.2), Sdk.createHueRotateColorMatrix(time * 25), Sdk.createSaturationColorMatrix(1.4)]);
    final colors = [0xff3366ff, 0x33ff99ff, 0x3399ffff, 0xffcc33ff];
    for (i in 0...swatches.length) redrawRectangle(swatches[i], 90, 90, Std.int(Sdk.applyColorMatrixToColor(matrix, colors[i])) >>> 8);
  }
}
