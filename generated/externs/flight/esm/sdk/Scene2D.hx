package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/scene2d")
extern class Scene2D {
  public static final DisplayObjectKind:String;
  public static final HtmlViewKind:String;
  public static final Scale9SpriteKind:String;
  public static final SpriteKind:String;
  public static function applyAnimationClipToNode2D(clip:flight.esm.types.animation.Types.AnimationClip, time:Float):Void;
  public static function cloneSprite(source:flight.esm.types.scene2d_contract.Types.Sprite):flight.esm.types.scene2d_contract.Types.Sprite;
  public static function computeHtmlViewLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>):Void;
  public static function computeSpriteLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>):Void;
  public static function createDisplayObject():flight.esm.types.scene2d_contract.Types.DisplayObject;
  public static function createHtmlView():flight.esm.types.scene2d_contract.Types.HtmlView;
  public static function createNode2D<R>(kind:String, ?createData:Null<flight.esm.types.scene2d_contract.Types.Node2DDataFactory>, ?createNode2DRuntimeFactory:Null<flight.esm.types.scene2d_contract.Types.Node2DRuntimeFactory<R>>):flight.esm.types.scene2d_contract.Types.Node2D;
  public static function createScale9Sprite(scale9Grid:flight.esm.types.geometry.Types.RectangleLike):flight.esm.types.scene2d_contract.Types.Scale9Sprite;
  public static function createScene2D():flight.esm.types.scene2d_contract.Types.Scene2D;
  public static function createScene2DKindUsage():{ blendModes:Array<String>, materialKinds:Array<String>, nodeKinds:Array<String>, shapeCommandKeys:Array<String> };
  public static function createSprite():flight.esm.types.scene2d_contract.Types.Sprite;
  public static function enableScene2DSignals(source:flight.esm.types.scene2d_contract.Types.Scene2D):flight.esm.types.scene2d_contract.Types.Scene2DSignals;
  public static function getScene2DKindUsage(out:flight.esm.types.scene2d_contract.Types.Scene2DKindUsage, scene:flight.esm.types.scene2d_contract.Types.Scene2D):Void;
  public static function getScene2DRoot(source:flight.esm.types.scene2d_contract.Types.Node2D):Null<flight.esm.types.scene2d_contract.Types.Scene2D>;
  public static function getScene2DSignals(source:flight.esm.types.scene2d_contract.Types.Scene2D):Null<flight.esm.types.scene2d_contract.Types.Scene2DSignals>;
  public static function isNode2D(node:flight.esm.types.node.Types.NodeAny):Bool;
  public static function setHtmlViewSize(source:flight.esm.types.scene2d_contract.Types.HtmlView, width:Float, height:Float):Void;
  public static function setNode2DClip(source:flight.esm.types.scene2d_contract.Types.Node2D, value:Null<flight.esm.types.clip.Types.ClipRegion>):Void;
  public static function setScene2DSize(source:flight.esm.types.scene2d_contract.Types.Scene2D, width:Float, height:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
