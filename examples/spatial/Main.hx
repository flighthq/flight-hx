import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var index:Dynamic;var objects:Array<Dynamic>=[];var pairs:Array<Dynamic>=[];var time=0.0;var label:Dynamic;
  override public function flightReady():Void {final stage=createStage("Spatial index");index=Sdk.createSpatialIndex(Sdk.createUniformGridSpatialBackend(100));for(i in 0...20){final o={id:i+1,x:30+(i*97)%730,y:80+(i*61)%380,w:42.0,h:32.0,shape:null};o.shape=addRectangle(stage,o.x,o.y,o.w,o.h,0x4488cc);objects.push(o);Sdk.insertSpatialObject(index,o.id,{minX:o.x,minY:o.y,maxX:o.x+o.w,maxY:o.y+o.h});}label=addLabel(stage,"",20,550);}
  override public function flightUpdate(dt:Float):Void {time+=dt;for(i in 0...5){final o=objects[i];o.x+=Math.sin(time+i)*dt*40;Sdk.updateSpatialObject(index,o.id,{minX:o.x,minY:o.y,maxX:o.x+o.w,maxY:o.y+o.h});o.shape.x=o.x;Sdk.invalidateNodeLocalTransform(o.shape);}pairs.resize(0);Sdk.querySpatialPairs(index,pairs);setLabel(label,"Broadphase pairs: "+pairs.length);}
}
