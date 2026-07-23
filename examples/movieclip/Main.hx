import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var clip:Dynamic; var content:Dynamic; var frameLabel:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Movie clip"); clip=Sdk.createMovieClip(); content=Sdk.createShape(); content.x=400;content.y=250;Sdk.addNodeChild(clip,content);Sdk.addNodeChild(stage,clip);
    final source=Sdk.createTimelineSource({totalFrames:24.0,frameRate:8.0,labels:[{name:"intro",frame:1.0},{name:"loop",frame:9.0},{name:"outro",frame:19.0}],constructFrame:function(target:Dynamic,frame:Float) drawFrame(Std.int(frame))});
    Sdk.setMovieClipSource(clip,source);Sdk.playMovieClip(clip);frameLabel=addLabel(stage,"",20,60);addLabel(stage,"A 24-frame labeled timeline.",20,90);
  }
  function drawFrame(frame:Int):Void {Sdk.clearShapeCommands(content);final radius=25+(frame%12)*4;Sdk.appendShapeBeginFill(content,frame<9?0x4488cc:frame<19?0x44cc88:0xcc4444);Sdk.appendShapeCircle(content,0,0,radius);Sdk.appendShapeEndFill(content);Sdk.invalidateNodeAppearance(content);}
  override public function flightUpdate(dt:Float):Void {Sdk.updateMovieClip(clip,dt);setLabel(frameLabel,"Frame "+Sdk.getMovieClipCurrentFrame(clip));}
}
