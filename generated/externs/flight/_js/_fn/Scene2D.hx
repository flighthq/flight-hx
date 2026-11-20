package flight._js._fn;

@:jsRequire("@flighthq/scene2d")
extern class Scene2D {
	@:native("createDisplayObject")
	public static function createDisplayObject():Dynamic;
	@:native("isNode2D")
	public static function isNode2d(node:Dynamic):Bool;
	@:native("setNode2DClip")
	public static function setNode2dClip(source:Dynamic, value:Null<Dynamic>):Void;
	@:native("applyAnimationClipToNode2D")
	public static function applyAnimationClipToNode2d(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("createHtmlView")
	public static function createHtmlView():Dynamic;
	@:native("computeHtmlViewLocalBoundsRectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("setHtmlViewSize")
	public static function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("createScale9Sprite")
	public static function createScale9Sprite(scale9Grid:flight._js.Rectangle):Dynamic;
	@:native("createScene2D")
	public static function createScene2d():Dynamic;
	@:native("enableScene2DSignals")
	public static function enableScene2dSignals(source:flight._js.Scene2D):Dynamic;
	@:native("getScene2DRoot")
	public static function getScene2dRoot(source:Dynamic):Null<Dynamic>;
	@:native("getScene2DSignals")
	public static function getScene2dSignals(source:flight._js.Scene2D):Null<Dynamic>;
	@:native("setScene2DSize")
	public static function setScene2dSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("createScene2DKindUsage")
	public static function createScene2dKindUsage():flight._js.Scene2DKindUsage;
	@:native("getScene2DKindUsage")
	public static function getScene2dKindUsage(out:flight._js.Scene2DKindUsage, scene:flight._js.Scene2D):Void;
	@:native("createSprite")
	public static function createSprite():Dynamic;
	@:native("cloneSprite")
	public static function cloneSprite(source:flight._js.Sprite):Dynamic;
	@:native("computeSpriteLocalBoundsRectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DsignalsRef(ptr:flight._js.Scene2DSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DkindUsage(ptr:flight._js.Scene2DKindUsage):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DslotReferenceRef(ptr:flight._js.Scene2DSlotReference):Void {}
}
