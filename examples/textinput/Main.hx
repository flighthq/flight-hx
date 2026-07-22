import flighthq.Sdk;import lime.ui.KeyCode;import lime.ui.KeyModifier;
class Main extends ExampleHost {
  var field:Dynamic;var value="";var label:Dynamic;
  override public function flightReady():Void {final stage=createStage("Text input");field=Sdk.createRichText();field.data.text="";field.data.width=500;field.x=80;field.y=160;Sdk.addNodeChild(stage,field);Sdk.enableTextInput(field,{placeholder:"Type here"});label=addLabel(stage,"Lime keyboard events feed Flight text state.",80,260);}
  override public function onTextInput(text:String):Void {value+=text;field.data.text=value;Sdk.invalidateNodeAppearance(field);}
  override public function onKeyDown(k:KeyCode,m:KeyModifier):Void if(k==BACKSPACE&&value.length>0){value=value.substr(0,value.length-1);field.data.text=value;Sdk.invalidateNodeAppearance(field);}
}
