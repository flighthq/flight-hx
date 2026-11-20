package flight.esm.scene2d;

#if (js && flight_esm)
@:jsRequire("@flighthq/scene2d/contract")
extern class Contract {
  public static final DisplayObjectKind:String;
  public static final GroupKind:String;
  public static final HtmlViewKind:String;
  public static final Node2DAnimationPathAlpha:String;
  public static final Node2DAnimationPathPivot:String;
  public static final Node2DAnimationPathPivotX:String;
  public static final Node2DAnimationPathPivotY:String;
  public static final Node2DAnimationPathPosition:String;
  public static final Node2DAnimationPathRotation:String;
  public static final Node2DAnimationPathScale:String;
  public static final Node2DAnimationPathScaleX:String;
  public static final Node2DAnimationPathScaleY:String;
  public static final Node2DAnimationPathSkew:String;
  public static final Node2DAnimationPathSkewX:String;
  public static final Node2DAnimationPathSkewY:String;
  public static final Node2DAnimationPathVisible:String;
  public static final Node2DAnimationPathX:String;
  public static final Node2DAnimationPathY:String;
  public static final Node2DFieldsKey:Dynamic;
  public static final Scale9SpriteKind:String;
  public static final SpriteKind:String;
  public static function applyAnimationClipToNode2D(clip:flight.esm.types.animation.Types.AnimationClip, time:Float):Void;
  public static function cloneSprite(source:flight.esm.types.scene2d_contract.Types.Sprite):flight.esm.types.scene2d_contract.Types.Sprite;
  public static function computeHtmlViewLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>):Void;
  public static function computeSpriteLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.node.Types.BoundsNode<flight.esm.types.scene2d_contract.Types.Node2DFields>):Void;
  public static function createDisplayObject():flight.esm.types.scene2d_contract.Types.DisplayObject;
  public static function createDisplayObjectRuntime():flight.esm.types.scene2d_contract.Types.DisplayObjectRuntime;
  public static function createHtmlView():flight.esm.types.scene2d_contract.Types.HtmlView;
  public static function createHtmlViewData():flight.esm.types.scene2d_contract.Types.HtmlViewData;
  public static function createHtmlViewRuntime():flight.esm.types.scene2d_contract.Types.HtmlViewRuntime;
  public static function createNode2D<R>(kind:String, ?createData:Null<flight.esm.types.scene2d_contract.Types.Node2DDataFactory>, ?createNode2DRuntimeFactory:Null<flight.esm.types.scene2d_contract.Types.Node2DRuntimeFactory<R>>):flight.esm.types.scene2d_contract.Types.Node2D;
  public static function createNode2DRuntime(?methods:Dynamic):flight.esm.types.scene2d_contract.Types.Node2DRuntime;
  public static function createScale9Sprite(scale9Grid:flight.esm.types.geometry.Types.RectangleLike):flight.esm.types.scene2d_contract.Types.Scale9Sprite;
  public static function createScale9SpriteData(scale9Grid:flight.esm.types.geometry.Types.RectangleLike):flight.esm.types.scene2d_contract.Types.Scale9SpriteData;
  public static function createScale9SpriteRuntime():flight.esm.types.scene2d_contract.Types.Scale9SpriteRuntime;
  public static function createScene2D():flight.esm.types.scene2d_contract.Types.Scene2D;
  public static function createScene2DKindUsage():{ blendModes:Array<String>, materialKinds:Array<String>, nodeKinds:Array<String>, shapeCommandKeys:Array<String> };
  public static function createScene2DRuntime():flight.esm.types.scene2d_contract.Types.Scene2DRuntime;
  public static function createScene2DSignals():flight.esm.types.scene2d_contract.Types.Scene2DSignals;
  public static function createSprite():flight.esm.types.scene2d_contract.Types.Sprite;
  public static function createSpriteData():flight.esm.types.scene2d_contract.Types.SpriteData;
  public static function createSpriteRendererData(source:flight.esm.types.node.Types.NodeAny):flight.esm.types.scene2d_contract.Types.SpriteIdentityRendererData;
  public static function createSpriteRuntime():flight.esm.types.scene2d_contract.Types.SpriteRuntime;
  public static function enableScene2DSignals(source:flight.esm.types.scene2d_contract.Types.Scene2D):flight.esm.types.scene2d_contract.Types.Scene2DSignals;
  public static function getDisplayObjectRuntime(source:flight.esm.types.scene2d_contract.Types.DisplayObject):flight.esm.types.scene2d_contract.Types.DisplayObjectRuntime;
  public static function getHtmlViewRuntime(source:flight.esm.types.scene2d_contract.Types.HtmlView):flight.esm.types.scene2d_contract.Types.HtmlViewRuntime;
  public static function getNode2DRuntime(source:flight.esm.types.scene2d_contract.Types.Node2D):flight.esm.types.scene2d_contract.Types.Node2DRuntime;
  public static function getScale9SpriteRuntime(source:flight.esm.types.scene2d_contract.Types.Scale9Sprite):flight.esm.types.scene2d_contract.Types.Scale9SpriteRuntime;
  public static function getScene2DKindUsage(out:flight.esm.types.scene2d_contract.Types.Scene2DKindUsage, scene:flight.esm.types.scene2d_contract.Types.Scene2D):Void;
  public static function getScene2DRoot(source:flight.esm.types.scene2d_contract.Types.Node2D):Null<flight.esm.types.scene2d_contract.Types.Scene2D>;
  public static function getScene2DRuntime(source:flight.esm.types.scene2d_contract.Types.Scene2D):flight.esm.types.scene2d_contract.Types.Scene2DRuntime;
  public static function getScene2DSignals(source:flight.esm.types.scene2d_contract.Types.Scene2D):Null<flight.esm.types.scene2d_contract.Types.Scene2DSignals>;
  public static function getSpriteRuntime(source:flight.esm.types.scene2d_contract.Types.Sprite):flight.esm.types.scene2d_contract.Types.SpriteRuntime;
  public static function initializeHtmlViewData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.HtmlViewData>):Void;
  public static function initializeScale9SpriteData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.Scale9SpriteData>, scale9Grid:flight.esm.types.geometry.Types.RectangleLike):Void;
  public static function initializeScene2D(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.Scene2D>, root:flight.esm.types.scene2d_contract.Types.Node2D):Void;
  public static function initializeScene2DKindUsage(out:flight.esm.types.entity_contract.Types.EntityConstruction<Dynamic>):Void;
  public static function initializeScene2DSignals(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.Scene2DSignals>):Void;
  public static function initializeSpriteData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.SpriteData>):Void;
  public static function initializeSpriteRendererData(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.scene2d_contract.Types.SpriteIdentityRendererData>, source:flight.esm.types.node.Types.NodeAny):Void;
  public static function isNode2D(node:flight.esm.types.node.Types.NodeAny):Bool;
  public static function isSpriteRendererDirty(source:flight.esm.types.node.Types.NodeAny, rendererData:Null<flight.esm.types.node.Types.RendererData>):Bool;
  public static function setHtmlViewSize(source:flight.esm.types.scene2d_contract.Types.HtmlView, width:Float, height:Float):Void;
  public static function setNode2DClip(source:flight.esm.types.scene2d_contract.Types.Node2D, value:Null<flight.esm.types.clip.Types.ClipRegion>):Void;
  public static function setScene2DSize(source:flight.esm.types.scene2d_contract.Types.Scene2D, width:Float, height:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
