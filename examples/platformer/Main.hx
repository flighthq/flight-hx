import flighthq.sdk.Sdk;
import lime.ui.KeyCode;import lime.ui.KeyModifier;
class Main extends ExampleHost {
  var player:Dynamic;var vx=0.0;var vy=0.0;var grounded=false;
  override public function flightReady():Void {final stage=createStage("Platformer");for(p in [{x:0,y:530,w:800,h:70},{x:130,y:410,w:180,h:24},{x:430,y:330,w:180,h:24},{x:650,y:450,w:100,h:24}])addRectangle(stage,p.x,p.y,p.w,p.h,0x335577);player=addRectangle(stage,200,350,24,32,0xffcc33);addLabel(stage,"Arrows move, Space jumps.",20,560);}
  override public function flightUpdate(dt:Float):Void {vy+=980*dt;player.x+=vx*dt;player.y+=vy*dt;if(player.y>498){player.y=498;vy=0;grounded=true;}Sdk.invalidateNodeLocalTransform(player);}
  override public function onKeyDown(k:KeyCode,m:KeyModifier):Void switch k{case LEFT:vx=-220;case RIGHT:vx=220;case SPACE:if(grounded){vy=-420;grounded=false;}default:}
  override public function onKeyUp(k:KeyCode,m:KeyModifier):Void switch k{case LEFT,RIGHT:vx=0;default:}
}
