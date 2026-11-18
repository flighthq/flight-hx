package flight._js._fn;

@:jsRequire("@flighthq/textureatlas")
extern class TextureAtlas {
	@:native("areTextureAtlasGuardsEnabled")
	public static function areTextureAtlasGuardsEnabled(state:flight._js.TextureAtlasGuardState):Bool;
	@:native("disableTextureAtlasGuards")
	public static function disableTextureAtlasGuards(state:flight._js.TextureAtlasGuardState):Void;
	@:native("enableTextureAtlasGuards")
	public static function enableTextureAtlasGuards(state:flight._js.TextureAtlasGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("createTextureAtlas")
	public static function createTextureAtlas():Dynamic;
	@:native("disposeTextureAtlas")
	public static function disposeTextureAtlas(atlas:flight._js.TextureAtlas):Void;
	@:native("getTextureAtlasByteSize")
	public static function getTextureAtlasByteSize(atlas:flight._js.TextureAtlas):Int;
	@:native("createTextureAtlasFromImageResource")
	public static function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic;
	@:native("createTextureAtlasFromGrid")
	public static function createTextureAtlasFromGrid(options:flight._js.GridSliceOptions, texture:Null<Dynamic>):Dynamic;
	@:native("createTextureAtlasRegion")
	public static function createTextureAtlasRegion():Dynamic;
	@:native("addTextureAtlasRegion")
	public static function addTextureAtlasRegion(target:flight._js.TextureAtlas, x:Float, y:Float, width:Float, height:Float, pivotX:Null<Float>, pivotY:Null<Float>, name:Null<String>):Void;
	@:native("addTextureAtlasRegionCorners")
	public static function addTextureAtlasRegionCorners(target:flight._js.TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, pivotX:Null<Float>, pivotY:Null<Float>, name:Null<String>):Void;
	@:native("addTextureAtlasRegionRectangle")
	public static function addTextureAtlasRegionRectangle(target:flight._js.TextureAtlas, rect:flight._js.Rectangle, pivot:Null<flight._js.Vector2>, name:Null<String>):Void;
	@:native("addTextureAtlasRegionVector2")
	public static function addTextureAtlasRegionVector2(target:flight._js.TextureAtlas, a:flight._js.Vector2, b:flight._js.Vector2, pivot:Null<flight._js.Vector2>, name:Null<String>):Void;
	@:native("clearTextureAtlasRegions")
	public static function clearTextureAtlasRegions(target:flight._js.TextureAtlas):Void;
	@:native("explainTextureAtlasRegionTexture")
	public static function explainTextureAtlasRegionTexture(atlas:flight._js.TextureAtlas, regionId:Int):flight._js.TextureAtlasRegionTextureExplanation;
	@:native("getTextureAtlasRegionById")
	public static function getTextureAtlasRegionById(atlas:flight._js.TextureAtlas, id:Int):Null<Dynamic>;
	@:native("getTextureAtlasRegionByName")
	public static function getTextureAtlasRegionByName(atlas:flight._js.TextureAtlas, name:String):Null<Dynamic>;
	@:native("getTextureAtlasRegionByOrdinal")
	public static function getTextureAtlasRegionByOrdinal(atlas:flight._js.TextureAtlas, prefix:String, ordinal:Float):Null<Dynamic>;
	@:native("getTextureAtlasRegionCount")
	public static function getTextureAtlasRegionCount(atlas:flight._js.TextureAtlas):Int;
	@:native("getTextureAtlasRegionFrame")
	public static function getTextureAtlasRegionFrame(out:flight._js.Rectangle, region:flight._js.TextureAtlasRegion):Void;
	@:native("getTextureAtlasRegionOrdinal")
	public static function getTextureAtlasRegionOrdinal(region:flight._js.TextureAtlasRegion):Float;
	@:native("getTextureAtlasRegionTexture")
	public static function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:Null<flight._js.TextureAtlasGuardState>):Null<Dynamic>;
	@:native("getTextureAtlasRegionUv")
	public static function getTextureAtlasRegionUv(out:flight._js.Rectangle, region:flight._js.TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void;
	@:native("getTextureAtlasRegionUvQuad")
	public static function getTextureAtlasRegionUvQuad(out:Dynamic, region:flight._js.TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void;
	@:native("hasTextureAtlasRegion")
	public static function hasTextureAtlasRegion(atlas:flight._js.TextureAtlas, name:String):Bool;
	@:native("removeTextureAtlasRegion")
	public static function removeTextureAtlasRegion(target:flight._js.TextureAtlas, id:Int):Bool;
	@:native("setTextureAtlasRegion")
	public static function setTextureAtlasRegion(out:flight._js.TextureAtlasRegion, source:flight._js.TextureAtlasRegionOptions):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTextureAtlasRegionTextureExplanation(ptr:flight._js.TextureAtlasRegionTextureExplanation):Void {}
}
