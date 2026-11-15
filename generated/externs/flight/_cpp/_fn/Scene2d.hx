package flight._cpp._fn;

extern class Scene2d {
	@:native("flight_create_display_object")
	public static function createDisplayObject():cpp.Star<cpp.Void>;
	@:native("flight_create_display_object_runtime")
	public static function createDisplayObjectRuntime():flight._cpp.DisplayObjectRuntime;
	@:native("flight_create_node2d_runtime")
	public static function createNode2dRuntime(methods:flight._cpp.Node2DRuntimeMethods):flight._cpp.Node2DRuntime;
	@:native("flight_as_node2d_ref")
	public static function asNode2dRef(node:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_display_object_runtime")
	public static function getDisplayObjectRuntime(source:flight._cpp.DisplayObject):flight._cpp.DisplayObjectRuntime;
	@:native("flight_get_node2d_runtime")
	public static function getNode2dRuntime(source:cpp.Star<cpp.Void>):flight._cpp.Node2DRuntime;
	@:native("flight_is_node2d")
	public static function isNode2d(node:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node2d_clip")
	public static function setNode2dClip(source:cpp.Star<cpp.Void>, value:cpp.Star<cpp.Void>):Void;
	@:native("flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._cpp.AnimationClip, time:Single):Void;
	@:native("flight_get_node2d_animation_path_string")
	public static function getNode2dAnimationPathString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_node2d_animation_path")
	public static function parseNode2dAnimationPath(value:cpp.ConstCharStar):Int;
	@:native("flight_create_html_view")
	public static function createHtmlView():cpp.Star<cpp.Void>;
	@:native("flight_create_html_view_data")
	public static function createHtmlViewData():flight._cpp.HtmlViewData;
	@:native("flight_create_html_view_runtime")
	public static function createHtmlViewRuntime():flight._cpp.HtmlViewRuntime;
	@:native("flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_html_view_runtime")
	public static function getHtmlViewRuntime(source:flight._cpp.HtmlView):flight._cpp.HtmlViewRuntime;
	@:native("flight_set_html_view_size")
	public static function setHtmlViewSize(source:cpp.Star<cpp.Void>, width:Float, height:Float):Void;
	@:native("flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._cpp.Rectangle):cpp.Star<cpp.Void>;
	@:native("flight_create_scale9_sprite_data")
	public static function createScale9SpriteData(scale9Grid:flight._cpp.Rectangle):flight._cpp.Scale9SpriteData;
	@:native("flight_create_scale9_sprite_runtime")
	public static function createScale9SpriteRuntime():flight._cpp.Node2DRuntime;
	@:native("flight_get_scale9_sprite_runtime")
	public static function getScale9SpriteRuntime(source:flight._cpp.Scale9Sprite):cpp.Star<cpp.Void>;
	@:native("flight_create_scene2d")
	public static function createScene2d():cpp.Star<cpp.Void>;
	@:native("flight_create_scene2d_runtime")
	public static function createScene2dRuntime():flight._cpp.Scene2DRuntime;
	@:native("flight_create_scene2d_signals")
	public static function createScene2dSignals():cpp.Star<cpp.Void>;
	@:native("flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._cpp.Scene2D):cpp.Star<cpp.Void>;
	@:native("flight_get_scene2d_align_string")
	public static function getScene2dAlignString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_scene2d_display_state_string")
	public static function getScene2dDisplayStateString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_scene2d_quality_string")
	public static function getScene2dQualityString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_scene2d_root")
	public static function getScene2dRoot(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_scene2d_runtime")
	public static function getScene2dRuntime(source:flight._cpp.Scene2D):flight._cpp.Scene2DRuntime;
	@:native("flight_get_scene2d_scale_mode_string")
	public static function getScene2dScaleModeString(value:Int):cpp.ConstCharStar;
	@:native("flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._cpp.Scene2D):cpp.Star<cpp.Void>;
	@:native("flight_parse_scene2d_align")
	public static function parseScene2dAlign(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_scene2d_display_state")
	public static function parseScene2dDisplayState(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_scene2d_quality")
	public static function parseScene2dQuality(value:cpp.ConstCharStar):Int;
	@:native("flight_parse_scene2d_scale_mode")
	public static function parseScene2dScaleMode(value:cpp.ConstCharStar):Int;
	@:native("flight_set_scene2d_size")
	public static function setScene2dSize(source:cpp.Star<cpp.Void>, width:Float, height:Float):Void;
	@:native("flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._cpp.Scene2DKindUsage;
	@:native("flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._cpp.Scene2DKindUsage, scene:flight._cpp.Scene2D):Void;
	@:native("flight_create_sprite")
	public static function createSprite():cpp.Star<cpp.Void>;
	@:native("flight_create_sprite_data")
	public static function createSpriteData():flight._cpp.SpriteData;
	@:native("flight_create_sprite_renderer_data")
	public static function createSpriteRendererData(source:cpp.Star<cpp.Void>):flight._cpp.SpriteIdentityRendererData;
	@:native("flight_create_sprite_runtime")
	public static function createSpriteRuntime():flight._cpp.Node2DRuntime;
	@:native("flight_clone_sprite")
	public static function cloneSprite(source:flight._cpp.Sprite):cpp.Star<cpp.Void>;
	@:native("flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_sprite_runtime")
	public static function getSpriteRuntime(source:flight._cpp.Sprite):cpp.Star<cpp.Void>;
	@:native("flight_free_display_object_runtime")
	public static function freeDisplayObjectRuntime(ptr:flight._cpp.DisplayObjectRuntime):Void;
	@:native("flight_free_html_view_data")
	public static function freeHtmlViewData(ptr:flight._cpp.HtmlViewData):Void;
	@:native("flight_free_html_view_runtime")
	public static function freeHtmlViewRuntime(ptr:flight._cpp.HtmlViewRuntime):Void;
	@:native("flight_free_scale9_sprite_data")
	public static function freeScale9SpriteData(ptr:flight._cpp.Scale9SpriteData):Void;
	@:native("flight_free_scene2_druntime")
	public static function freeScene2Druntime(ptr:flight._cpp.Scene2DRuntime):Void;
	@:native("flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._cpp.Scene2DKindUsage):Void;
	@:native("flight_free_sprite_data")
	public static function freeSpriteData(ptr:flight._cpp.SpriteData):Void;
	@:native("flight_free_sprite_identity_renderer_data")
	public static function freeSpriteIdentityRendererData(ptr:flight._cpp.SpriteIdentityRendererData):Void;
}
