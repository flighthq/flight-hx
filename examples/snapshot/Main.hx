import flighthq.Sdk;import lime.ui.KeyCode;import lime.ui.KeyModifier;
class Main extends ExampleHost {
  var state:Dynamic={player:{x:400.0,y:250.0,score:0.0},time:0.0};var saved:Dynamic;var player:Dynamic;var label:Dynamic;
  override public function flightReady():Void {final stage=createStage("Snapshot");player=addCircle(stage,state.player.x,state.player.y,18,0x44aaff);label=addLabel(stage,"S save   R restore",20,450);}
  override public function flightUpdate(dt:Float):Void {state.time+=dt;state.player.x=400+Math.sin(state.time)*240;player.x=state.player.x;Sdk.invalidateNodeLocalTransform(player);}
  override public function onKeyDown(k:KeyCode,m:KeyModifier):Void switch k{case S:saved=Sdk.captureSnapshot(state);setLabel(label,"Saved");case R:if(saved!=null){Sdk.restoreSnapshot(saved,state);setLabel(label,"Restored");}default:}
}
