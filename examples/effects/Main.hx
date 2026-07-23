import flighthq.sdk.Sdk;
import lime.graphics.RenderContext;
class Main extends ExampleHost {
  var effects:Array<Dynamic>; var pipeline:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Render effects"); final colors=[0xff3366,0x33ff99,0x3399ff,0xffcc33,0xff66cc];
    for(i in 0...10) addCircle(stage,120+(i%5)*135,170+Std.int(i/5)*180,48,colors[i%5]);
    Sdk.registerStandardGlRenderEffects(renderState); pipeline=Sdk.createGlRenderEffectPipeline(renderState);
    effects=[Sdk.createBloomEffect({intensity:0.9}),Sdk.createVignetteEffect({intensity:0.6}),Sdk.createToneMapEffect()];
  }
  override public function flightRender(context:RenderContext):Void {
    if(!Sdk.prepareDisplayObjectRender(renderState,root)) return; Sdk.beginGlRenderEffectPipeline(renderState,pipeline); Sdk.renderGlBackground(renderState);
    Sdk.renderGlDisplayObject(renderState,root); Sdk.endGlRenderEffectPipeline(renderState,pipeline,effects);
  }
}
