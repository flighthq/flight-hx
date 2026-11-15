package flight._hl._fn;

extern class Textureatlas {
	@:hlNative("flight", "flight_are_texture_atlas_guards_enabled")
	public static function areTextureAtlasGuardsEnabled(state:flight._hl.TextureAtlasGuardState):Bool;
	@:hlNative("flight", "flight_disable_texture_atlas_guards")
	public static function disableTextureAtlasGuards(state:flight._hl.TextureAtlasGuardState):Void;
	@:hlNative("flight", "flight_enable_texture_atlas_guards")
	public static function enableTextureAtlasGuards(state:flight._hl.TextureAtlasGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:hlNative("flight", "flight_create_texture_atlas")
	public static function createTextureAtlas():Dynamic;
	@:hlNative("flight", "flight_dispose_texture_atlas")
	public static function disposeTextureAtlas(atlas:flight._hl.TextureAtlas):Void;
	@:hlNative("flight", "flight_get_texture_atlas_byte_size")
	public static function getTextureAtlasByteSize(atlas:flight._hl.TextureAtlas):Int;
	@:hlNative("flight", "flight_create_texture_atlas_from_image_resource")
	public static function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic;
	@:hlNative("flight", "flight_create_texture_atlas_from_grid")
	public static function createTextureAtlasFromGrid(options:flight._hl.GridSliceOptions, texture:Dynamic):Dynamic;
	@:hlNative("flight", "flight_create_texture_atlas_region")
	public static function createTextureAtlasRegion():Dynamic;
	@:hlNative("flight", "flight_add_texture_atlas_region")
	public static function addTextureAtlasRegion(target:flight._hl.TextureAtlas, x:Single, y:Single, width:Single, height:Single, pivotX:Single, pivotY:Single, name:hl.Bytes):Void;
	@:hlNative("flight", "flight_add_texture_atlas_region_corners")
	public static function addTextureAtlasRegionCorners(target:flight._hl.TextureAtlas, ax:Single, ay:Single, bx:Single, by:Single, pivotX:Single, pivotY:Single, name:hl.Bytes):Void;
	@:hlNative("flight", "flight_add_texture_atlas_region_rectangle")
	public static function addTextureAtlasRegionRectangle(target:flight._hl.TextureAtlas, rect:flight._hl.Rectangle, pivot:flight._hl.Vector2, name:hl.Bytes):Void;
	@:hlNative("flight", "flight_add_texture_atlas_region_vector2")
	public static function addTextureAtlasRegionVector2(target:flight._hl.TextureAtlas, a:flight._hl.Vector2, b:flight._hl.Vector2, pivot:flight._hl.Vector2, name:hl.Bytes):Void;
	@:hlNative("flight", "flight_clear_texture_atlas_regions")
	public static function clearTextureAtlasRegions(target:flight._hl.TextureAtlas):Void;
	@:hlNative("flight", "flight_explain_texture_atlas_region_texture")
	public static function explainTextureAtlasRegionTexture(atlas:flight._hl.TextureAtlas, regionId:Int):flight._hl.TextureAtlasRegionTextureExplanation;
	@:hlNative("flight", "flight_get_texture_atlas_region_by_id")
	public static function getTextureAtlasRegionById(atlas:flight._hl.TextureAtlas, id:Int):Dynamic;
	@:hlNative("flight", "flight_get_texture_atlas_region_by_name")
	public static function getTextureAtlasRegionByName(atlas:flight._hl.TextureAtlas, name:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_get_texture_atlas_region_by_ordinal")
	public static function getTextureAtlasRegionByOrdinal(atlas:flight._hl.TextureAtlas, prefix:hl.Bytes, ordinal:Float):Dynamic;
	@:hlNative("flight", "flight_get_texture_atlas_region_count")
	public static function getTextureAtlasRegionCount(atlas:flight._hl.TextureAtlas):Int;
	@:hlNative("flight", "flight_get_texture_atlas_region_frame")
	public static function getTextureAtlasRegionFrame(out:flight._hl.Rectangle, region:flight._hl.TextureAtlasRegion):Void;
	@:hlNative("flight", "flight_get_texture_atlas_region_ordinal")
	public static function getTextureAtlasRegionOrdinal(region:flight._hl.TextureAtlasRegion):Float;
	@:hlNative("flight", "flight_get_texture_atlas_region_texture")
	public static function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:flight._hl.TextureAtlasGuardState):Dynamic;
	@:hlNative("flight", "flight_get_texture_atlas_region_texture_status_string")
	public static function getTextureAtlasRegionTextureStatusString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_texture_atlas_region_uv")
	public static function getTextureAtlasRegionUv(out:flight._hl.Rectangle, region:flight._hl.TextureAtlasRegion, imageWidth:Single, imageHeight:Single):Void;
	@:hlNative("flight", "flight_get_texture_atlas_region_uv_quad")
	public static function getTextureAtlasRegionUvQuad(out:Dynamic, region:flight._hl.TextureAtlasRegion, imageWidth:Single, imageHeight:Single):Void;
	@:hlNative("flight", "flight_has_texture_atlas_region")
	public static function hasTextureAtlasRegion(atlas:flight._hl.TextureAtlas, name:hl.Bytes):Bool;
	@:hlNative("flight", "flight_parse_texture_atlas_region_texture_status")
	public static function parseTextureAtlasRegionTextureStatus(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_remove_texture_atlas_region")
	public static function removeTextureAtlasRegion(target:flight._hl.TextureAtlas, id:Int):Bool;
	@:hlNative("flight", "flight_set_texture_atlas_region")
	public static function setTextureAtlasRegion(out:flight._hl.TextureAtlasRegion, source:flight._hl.TextureAtlasRegionOptions):Void;
	@:hlNative("flight", "flight_free_texture_atlas_region_texture_explanation")
	public static function freeTextureAtlasRegionTextureExplanation(ptr:flight._hl.TextureAtlasRegionTextureExplanation):Void;
}
