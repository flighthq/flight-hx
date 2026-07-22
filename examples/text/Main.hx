import flighthq.Sdk;
class Main extends ExampleHost {
  override public function flightReady():Void {final stage=createStage("Text");addLabel(stage,"Sans serif — 18 px",40,80,18,0xffffff);addLabel(stage,"Serif heading",40,130,30,0xffcc66);addLabel(stage,"Monospace diagnostics: 0123456789",40,190,16,0x66ccff);final rich=Sdk.createRichText();rich.data.text="Rich text wraps, aligns, and carries spans.";rich.data.width=360;rich.x=40;rich.y=260;Sdk.addNodeChild(stage,rich);addRectangle(stage,430,80,300,220,0x335577,.6);addLabel(stage,"Background and layout",455,125,22,0xffffff);}
}
