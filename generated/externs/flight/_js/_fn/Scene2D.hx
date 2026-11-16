package flight._js._fn;

@:jsRequire("@flighthq/scene2d")
extern class Scene2D {
	@:native("createDisplayObject")
	public static function createDisplayObject():Dynamic;
	@:native("createDisplayObjectRuntime")
	public static function createDisplayObjectRuntime():flight._js.DisplayObjectRuntime;
	@:native("createNode2DRuntime")
	public static function createNode2dRuntime(methods:Null<flight._js.Node2DRuntimeMethods>):flight._js.Node2DRuntime;
	@:native("asNode2DRef")
	public static function asNode2dRef(node:Dynamic):Null<Dynamic>;
	@:native("getDisplayObjectRuntime")
	public static function getDisplayObjectRuntime(source:flight._js.DisplayObject):flight._js.DisplayObjectRuntime;
	@:native("getNode2DRuntime")
	public static function getNode2dRuntime(source:Dynamic):flight._js.Node2DRuntime;
	@:native("isNode2D")
	public static function isNode2d(node:Dynamic):Bool;
	@:native("setNode2DClip")
	public static function setNode2dClip(source:Dynamic, value:Null<Dynamic>):Void;
	@:native("applyAnimationClipToNode2D")
	public static function applyAnimationClipToNode2d(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("getNode2DAnimationPathString")
	public static function getNode2dAnimationPathString(value:Dynamic):String;
	@:native("parseNode2DAnimationPath")
	public static function parseNode2dAnimationPath(value:String):Null<Dynamic>;
	@:native("createHtmlView")
	public static function createHtmlView():Dynamic;
	@:native("createHtmlViewData")
	public static function createHtmlViewData():flight._js.HtmlViewData;
	@:native("createHtmlViewRuntime")
	public static function createHtmlViewRuntime():flight._js.HtmlViewRuntime;
	@:native("computeHtmlViewLocalBoundsRectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("getHtmlViewRuntime")
	public static function getHtmlViewRuntime(source:flight._js.HtmlView):flight._js.HtmlViewRuntime;
	@:native("setHtmlViewSize")
	public static function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("createScale9Sprite")
	public static function createScale9Sprite(scale9Grid:flight._js.Rectangle):Dynamic;
	@:native("createScale9SpriteData")
	public static function createScale9SpriteData(scale9Grid:flight._js.Rectangle):flight._js.Scale9SpriteData;
	@:native("createScale9SpriteRuntime")
	public static function createScale9SpriteRuntime():flight._js.Node2DRuntime;
	@:native("getScale9SpriteRuntime")
	public static function getScale9SpriteRuntime(source:flight._js.Scale9Sprite):Dynamic;
	@:native("createScene2D")
	public static function createScene2d():Dynamic;
	@:native("createScene2DRuntime")
	public static function createScene2dRuntime():flight._js.Scene2DRuntime;
	@:native("createScene2DSignals")
	public static function createScene2dSignals():Dynamic;
	@:native("enableScene2DSignals")
	public static function enableScene2dSignals(source:flight._js.Scene2D):Dynamic;
	@:native("getScene2DAlignString")
	public static function getScene2dAlignString(value:Dynamic):String;
	@:native("getScene2DDisplayStateString")
	public static function getScene2dDisplayStateString(value:Dynamic):String;
	@:native("getScene2DQualityString")
	public static function getScene2dQualityString(value:Dynamic):String;
	@:native("getScene2DRoot")
	public static function getScene2dRoot(source:Dynamic):Null<Dynamic>;
	@:native("getScene2DRuntime")
	public static function getScene2dRuntime(source:flight._js.Scene2D):flight._js.Scene2DRuntime;
	@:native("getScene2DScaleModeString")
	public static function getScene2dScaleModeString(value:Dynamic):String;
	@:native("getScene2DSignals")
	public static function getScene2dSignals(source:flight._js.Scene2D):Null<Dynamic>;
	@:native("parseScene2DAlign")
	public static function parseScene2dAlign(value:String):Null<Dynamic>;
	@:native("parseScene2DDisplayState")
	public static function parseScene2dDisplayState(value:String):Null<Dynamic>;
	@:native("parseScene2DQuality")
	public static function parseScene2dQuality(value:String):Null<Dynamic>;
	@:native("parseScene2DScaleMode")
	public static function parseScene2dScaleMode(value:String):Null<Dynamic>;
	@:native("setScene2DSize")
	public static function setScene2dSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("createScene2DKindUsage")
	public static function createScene2dKindUsage():flight._js.Scene2DKindUsage;
	@:native("getScene2DKindUsage")
	public static function getScene2dKindUsage(out:flight._js.Scene2DKindUsage, scene:flight._js.Scene2D):Void;
	@:native("createSprite")
	public static function createSprite():Dynamic;
	@:native("createSpriteData")
	public static function createSpriteData():flight._js.SpriteData;
	@:native("createSpriteRendererData")
	public static function createSpriteRendererData(source:Dynamic):flight._js.SpriteIdentityRendererData;
	@:native("createSpriteRuntime")
	public static function createSpriteRuntime():flight._js.Node2DRuntime;
	@:native("cloneSprite")
	public static function cloneSprite(source:flight._js.Sprite):Dynamic;
	@:native("computeSpriteLocalBoundsRectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("getSpriteRuntime")
	public static function getSpriteRuntime(source:flight._js.Sprite):Dynamic;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDisplayObjectRuntime(ptr:flight._js.DisplayObjectRuntime):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHtmlViewData(ptr:flight._js.HtmlViewData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeHtmlViewRuntime(ptr:flight._js.HtmlViewRuntime):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScale9SpriteData(ptr:flight._js.Scale9SpriteData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2Druntime(ptr:flight._js.Scene2DRuntime):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeScene2DkindUsage(ptr:flight._js.Scene2DKindUsage):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpriteData(ptr:flight._js.SpriteData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSpriteIdentityRendererData(ptr:flight._js.SpriteIdentityRendererData):Void {}
}
