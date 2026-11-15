package flight._js._fn;

@:jsRequire("flight")
extern class Textureatlas {
	@:native("flight_are_texture_atlas_guards_enabled")
	public static function areTextureAtlasGuardsEnabled(state:flight._js.TextureAtlasGuardState):Bool;
	@:native("flight_disable_texture_atlas_guards")
	public static function disableTextureAtlasGuards(state:flight._js.TextureAtlasGuardState):Void;
	@:native("flight_enable_texture_atlas_guards")
	public static function enableTextureAtlasGuards(state:flight._js.TextureAtlasGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_create_texture_atlas")
	public static function createTextureAtlas():Dynamic;
	@:native("flight_dispose_texture_atlas")
	public static function disposeTextureAtlas(atlas:flight._js.TextureAtlas):Void;
	@:native("flight_get_texture_atlas_byte_size")
	public static function getTextureAtlasByteSize(atlas:flight._js.TextureAtlas):Int;
	@:native("flight_create_texture_atlas_from_image_resource")
	public static function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic;
	@:native("flight_create_texture_atlas_from_grid")
	public static function createTextureAtlasFromGrid(options:flight._js.GridSliceOptions, texture:Dynamic):Dynamic;
	@:native("flight_create_texture_atlas_region")
	public static function createTextureAtlasRegion():Dynamic;
	@:native("flight_add_texture_atlas_region")
	public static function addTextureAtlasRegion(target:flight._js.TextureAtlas, x:Float, y:Float, width:Float, height:Float, pivotX:Float, pivotY:Float, name:String):Void;
	@:native("flight_add_texture_atlas_region_corners")
	public static function addTextureAtlasRegionCorners(target:flight._js.TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, pivotX:Float, pivotY:Float, name:String):Void;
	@:native("flight_add_texture_atlas_region_rectangle")
	public static function addTextureAtlasRegionRectangle(target:flight._js.TextureAtlas, rect:flight._js.Rectangle, pivot:flight._js.Vector2, name:String):Void;
	@:native("flight_add_texture_atlas_region_vector2")
	public static function addTextureAtlasRegionVector2(target:flight._js.TextureAtlas, a:flight._js.Vector2, b:flight._js.Vector2, pivot:flight._js.Vector2, name:String):Void;
	@:native("flight_clear_texture_atlas_regions")
	public static function clearTextureAtlasRegions(target:flight._js.TextureAtlas):Void;
	@:native("flight_explain_texture_atlas_region_texture")
	public static function explainTextureAtlasRegionTexture(atlas:flight._js.TextureAtlas, regionId:Int):flight._js.TextureAtlasRegionTextureExplanation;
	@:native("flight_get_texture_atlas_region_by_id")
	public static function getTextureAtlasRegionById(atlas:flight._js.TextureAtlas, id:Int):Dynamic;
	@:native("flight_get_texture_atlas_region_by_name")
	public static function getTextureAtlasRegionByName(atlas:flight._js.TextureAtlas, name:String):Dynamic;
	@:native("flight_get_texture_atlas_region_by_ordinal")
	public static function getTextureAtlasRegionByOrdinal(atlas:flight._js.TextureAtlas, prefix:String, ordinal:Float):Dynamic;
	@:native("flight_get_texture_atlas_region_count")
	public static function getTextureAtlasRegionCount(atlas:flight._js.TextureAtlas):Int;
	@:native("flight_get_texture_atlas_region_frame")
	public static function getTextureAtlasRegionFrame(out:flight._js.Rectangle, region:flight._js.TextureAtlasRegion):Void;
	@:native("flight_get_texture_atlas_region_ordinal")
	public static function getTextureAtlasRegionOrdinal(region:flight._js.TextureAtlasRegion):Float;
	@:native("flight_get_texture_atlas_region_texture")
	public static function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:flight._js.TextureAtlasGuardState):Dynamic;
	@:native("flight_get_texture_atlas_region_texture_status_string")
	public static function getTextureAtlasRegionTextureStatusString(value:Int):String;
	@:native("flight_get_texture_atlas_region_uv")
	public static function getTextureAtlasRegionUv(out:flight._js.Rectangle, region:flight._js.TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void;
	@:native("flight_get_texture_atlas_region_uv_quad")
	public static function getTextureAtlasRegionUvQuad(out:Dynamic, region:flight._js.TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void;
	@:native("flight_has_texture_atlas_region")
	public static function hasTextureAtlasRegion(atlas:flight._js.TextureAtlas, name:String):Bool;
	@:native("flight_parse_texture_atlas_region_texture_status")
	public static function parseTextureAtlasRegionTextureStatus(value:String):Int;
	@:native("flight_remove_texture_atlas_region")
	public static function removeTextureAtlasRegion(target:flight._js.TextureAtlas, id:Int):Bool;
	@:native("flight_set_texture_atlas_region")
	public static function setTextureAtlasRegion(out:flight._js.TextureAtlasRegion, source:flight._js.TextureAtlasRegionOptions):Void;
	@:native("flight_free_texture_atlas_region_texture_explanation")
	public static function freeTextureAtlasRegionTextureExplanation(ptr:flight._js.TextureAtlasRegionTextureExplanation):Void;
}
