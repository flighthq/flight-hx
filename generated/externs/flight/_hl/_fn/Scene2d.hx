package flight._hl._fn;

extern class Scene2d {
	@:hlNative("flight", "flight_create_display_object")
	public static function createDisplayObject():hl.Bytes;
	@:hlNative("flight", "flight_create_display_object_runtime")
	public static function createDisplayObjectRuntime():flight._hl.DisplayObjectRuntime;
	@:hlNative("flight", "flight_create_node2d_runtime")
	public static function createNode2dRuntime(methods:flight._hl.Node2DRuntimeMethods):flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_as_node2d_ref")
	public static function asNode2dRef(node:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_display_object_runtime")
	public static function getDisplayObjectRuntime(source:flight._hl.DisplayObject):flight._hl.DisplayObjectRuntime;
	@:hlNative("flight", "flight_get_node2d_runtime")
	public static function getNode2dRuntime(source:hl.Bytes):flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_is_node2d")
	public static function isNode2d(node:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_node2d_clip")
	public static function setNode2dClip(source:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._hl.AnimationClip, time:Single):Void;
	@:hlNative("flight", "flight_get_node2d_animation_path_string")
	public static function getNode2dAnimationPathString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_node2d_animation_path")
	public static function parseNode2dAnimationPath(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_create_html_view")
	public static function createHtmlView():hl.Bytes;
	@:hlNative("flight", "flight_create_html_view_data")
	public static function createHtmlViewData():flight._hl.HtmlViewData;
	@:hlNative("flight", "flight_create_html_view_runtime")
	public static function createHtmlViewRuntime():flight._hl.HtmlViewRuntime;
	@:hlNative("flight", "flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._hl.Rectangle, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_html_view_runtime")
	public static function getHtmlViewRuntime(source:flight._hl.HtmlView):flight._hl.HtmlViewRuntime;
	@:hlNative("flight", "flight_set_html_view_size")
	public static function setHtmlViewSize(source:hl.Bytes, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._hl.Rectangle):hl.Bytes;
	@:hlNative("flight", "flight_create_scale9_sprite_data")
	public static function createScale9SpriteData(scale9Grid:flight._hl.Rectangle):flight._hl.Scale9SpriteData;
	@:hlNative("flight", "flight_create_scale9_sprite_runtime")
	public static function createScale9SpriteRuntime():flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_get_scale9_sprite_runtime")
	public static function getScale9SpriteRuntime(source:flight._hl.Scale9Sprite):hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d")
	public static function createScene2d():hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d_runtime")
	public static function createScene2dRuntime():flight._hl.Scene2DRuntime;
	@:hlNative("flight", "flight_create_scene2d_signals")
	public static function createScene2dSignals():hl.Bytes;
	@:hlNative("flight", "flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_align_string")
	public static function getScene2dAlignString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_display_state_string")
	public static function getScene2dDisplayStateString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_quality_string")
	public static function getScene2dQualityString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_root")
	public static function getScene2dRoot(source:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_runtime")
	public static function getScene2dRuntime(source:flight._hl.Scene2D):flight._hl.Scene2DRuntime;
	@:hlNative("flight", "flight_get_scene2d_scale_mode_string")
	public static function getScene2dScaleModeString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_parse_scene2d_align")
	public static function parseScene2dAlign(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_scene2d_display_state")
	public static function parseScene2dDisplayState(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_scene2d_quality")
	public static function parseScene2dQuality(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_parse_scene2d_scale_mode")
	public static function parseScene2dScaleMode(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_scene2d_size")
	public static function setScene2dSize(source:hl.Bytes, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._hl.Scene2DKindUsage;
	@:hlNative("flight", "flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._hl.Scene2DKindUsage, scene:flight._hl.Scene2D):Void;
	@:hlNative("flight", "flight_create_sprite")
	public static function createSprite():hl.Bytes;
	@:hlNative("flight", "flight_create_sprite_data")
	public static function createSpriteData():flight._hl.SpriteData;
	@:hlNative("flight", "flight_create_sprite_renderer_data")
	public static function createSpriteRendererData(source:hl.Bytes):flight._hl.SpriteIdentityRendererData;
	@:hlNative("flight", "flight_create_sprite_runtime")
	public static function createSpriteRuntime():flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_clone_sprite")
	public static function cloneSprite(source:flight._hl.Sprite):hl.Bytes;
	@:hlNative("flight", "flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._hl.Rectangle, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_sprite_runtime")
	public static function getSpriteRuntime(source:flight._hl.Sprite):hl.Bytes;
	@:hlNative("flight", "flight_free_display_object_runtime")
	public static function freeDisplayObjectRuntime(ptr:flight._hl.DisplayObjectRuntime):Void;
	@:hlNative("flight", "flight_free_html_view_data")
	public static function freeHtmlViewData(ptr:flight._hl.HtmlViewData):Void;
	@:hlNative("flight", "flight_free_html_view_runtime")
	public static function freeHtmlViewRuntime(ptr:flight._hl.HtmlViewRuntime):Void;
	@:hlNative("flight", "flight_free_scale9_sprite_data")
	public static function freeScale9SpriteData(ptr:flight._hl.Scale9SpriteData):Void;
	@:hlNative("flight", "flight_free_scene2_druntime")
	public static function freeScene2Druntime(ptr:flight._hl.Scene2DRuntime):Void;
	@:hlNative("flight", "flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._hl.Scene2DKindUsage):Void;
	@:hlNative("flight", "flight_free_sprite_data")
	public static function freeSpriteData(ptr:flight._hl.SpriteData):Void;
	@:hlNative("flight", "flight_free_sprite_identity_renderer_data")
	public static function freeSpriteIdentityRendererData(ptr:flight._hl.SpriteIdentityRendererData):Void;
}
