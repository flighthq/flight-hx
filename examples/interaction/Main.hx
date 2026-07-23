import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var selected:Dynamic; var shapes:Array<Dynamic>=[];
  var manager:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Interaction"); manager=Sdk.createInteractionManager(stage,{precise:true}); Sdk.registerDefaultHitTests(); Sdk.registerShapeHitTest();
    for(i in 0...4){final shape=addCircle(stage,150+i*165,260,55,0x4488cc); Sdk.setNodeHitTestEnabled(shape,true); shapes.push(shape);}
    addLabel(stage,"Click and drag with Lime pointer events.",220,420);
  }
  override public function onMouseDown(x:Float,y:Float,button:Int):Void for(shape in shapes) if(Math.sqrt((x-shape.x)*(x-shape.x)+(y-shape.y)*(y-shape.y))<60) selected=shape;
  override public function onMouseMove(x:Float,y:Float):Void {if(selected==null)return; selected.x=x;selected.y=y;Sdk.invalidateNodeLocalTransform(selected);}
  override public function onMouseUp(x:Float,y:Float,button:Int):Void selected=null;
}
