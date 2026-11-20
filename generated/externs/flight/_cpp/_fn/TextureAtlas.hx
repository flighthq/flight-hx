package flight._cpp._fn;

extern class TextureAtlas {
	@:native("flight_are_texture_atlas_guards_enabled")
	public static function areTextureAtlasGuardsEnabled(state:flight._cpp.TextureAtlasGuardState):Bool;
	@:native("flight_disable_texture_atlas_guards")
	public static function disableTextureAtlasGuards(state:flight._cpp.TextureAtlasGuardState):Void;
	@:native("flight_create_texture_atlas")
	public static function createTextureAtlas():cpp.Star<cpp.Void>;
	@:native("flight_dispose_texture_atlas")
	public static function disposeTextureAtlas(atlas:flight._cpp.TextureAtlas):Void;
	@:native("flight_get_texture_atlas_byte_size")
	public static function getTextureAtlasByteSize(atlas:flight._cpp.TextureAtlas):Int;
	@:native("flight_create_texture_atlas_from_image_resource")
	public static function createTextureAtlasFromImageResource(resource:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_texture_atlas_from_grid")
	public static function createTextureAtlasFromGrid(options:flight._cpp.GridSliceOptions, texture:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_create_texture_atlas_region")
	public static function createTextureAtlasRegion():cpp.Star<cpp.Void>;
	@:native("flight_add_texture_atlas_region")
	public static function addTextureAtlasRegion(target:flight._cpp.TextureAtlas, x:Single, y:Single, width:Single, height:Single, pivotX:Single, pivotY:Single, name:cpp.ConstCharStar):Void;
	@:native("flight_add_texture_atlas_region_corners")
	public static function addTextureAtlasRegionCorners(target:flight._cpp.TextureAtlas, ax:Single, ay:Single, bx:Single, by:Single, pivotX:Single, pivotY:Single, name:cpp.ConstCharStar):Void;
	@:native("flight_add_texture_atlas_region_rectangle")
	public static function addTextureAtlasRegionRectangle(target:flight._cpp.TextureAtlas, rect:flight._cpp.Rectangle, pivot:flight._cpp.Vector2, name:cpp.ConstCharStar):Void;
	@:native("flight_add_texture_atlas_region_vector2")
	public static function addTextureAtlasRegionVector2(target:flight._cpp.TextureAtlas, a:flight._cpp.Vector2, b:flight._cpp.Vector2, pivot:flight._cpp.Vector2, name:cpp.ConstCharStar):Void;
	@:native("flight_clear_texture_atlas_regions")
	public static function clearTextureAtlasRegions(target:flight._cpp.TextureAtlas):Void;
	@:native("flight_explain_texture_atlas_region_texture")
	public static function explainTextureAtlasRegionTexture(atlas:flight._cpp.TextureAtlas, regionId:Int):flight._cpp.TextureAtlasRegionTextureExplanation;
	@:native("flight_get_texture_atlas_region_by_id")
	public static function getTextureAtlasRegionById(atlas:flight._cpp.TextureAtlas, id:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_texture_atlas_region_by_name")
	public static function getTextureAtlasRegionByName(atlas:flight._cpp.TextureAtlas, name:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_get_texture_atlas_region_by_ordinal")
	public static function getTextureAtlasRegionByOrdinal(atlas:flight._cpp.TextureAtlas, prefix:cpp.ConstCharStar, ordinal:Float):cpp.Star<cpp.Void>;
	@:native("flight_get_texture_atlas_region_count")
	public static function getTextureAtlasRegionCount(atlas:flight._cpp.TextureAtlas):Int;
	@:native("flight_get_texture_atlas_region_frame")
	public static function getTextureAtlasRegionFrame(out:flight._cpp.Rectangle, region:flight._cpp.TextureAtlasRegion):Void;
	@:native("flight_get_texture_atlas_region_ordinal")
	public static function getTextureAtlasRegionOrdinal(region:flight._cpp.TextureAtlasRegion):Float;
	@:native("flight_get_texture_atlas_region_texture")
	public static function getTextureAtlasRegionTexture(atlas:cpp.Star<cpp.Void>, regionId:Int, guards:flight._cpp.TextureAtlasGuardState):cpp.Star<cpp.Void>;
	@:native("flight_get_texture_atlas_region_uv")
	public static function getTextureAtlasRegionUv(out:flight._cpp.Rectangle, region:flight._cpp.TextureAtlasRegion, imageWidth:Single, imageHeight:Single):Void;
	@:native("flight_get_texture_atlas_region_uv_quad")
	public static function getTextureAtlasRegionUvQuad(out:cpp.Star<cpp.Void>, region:flight._cpp.TextureAtlasRegion, imageWidth:Single, imageHeight:Single):Void;
	@:native("flight_has_texture_atlas_region")
	public static function hasTextureAtlasRegion(atlas:flight._cpp.TextureAtlas, name:cpp.ConstCharStar):Bool;
	@:native("flight_remove_texture_atlas_region")
	public static function removeTextureAtlasRegion(target:flight._cpp.TextureAtlas, id:Int):Bool;
	@:native("flight_set_texture_atlas_region")
	public static function setTextureAtlasRegion(out:flight._cpp.TextureAtlasRegion, source:flight._cpp.TextureAtlasRegionOptions):Void;
	@:native("flight_free_texture_atlas_region_ref")
	public static function freeTextureAtlasRegionRef(ptr:flight._cpp.TextureAtlasRegion):Void;
	@:native("flight_free_texture_atlas_region_texture_explanation")
	public static function freeTextureAtlasRegionTextureExplanation(ptr:flight._cpp.TextureAtlasRegionTextureExplanation):Void;
	@:native("flight_free_texture_atlas_ref")
	public static function freeTextureAtlasRef(ptr:flight._cpp.TextureAtlas):Void;
}
