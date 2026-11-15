package flight._js._fn;

@:jsRequire("flight")
extern class Scene2d {
	@:native("flight_create_display_object")
	public static function createDisplayObject():Dynamic;
	@:native("flight_create_display_object_runtime")
	public static function createDisplayObjectRuntime():flight._js.DisplayObjectRuntime;
	@:native("flight_create_node2d_runtime")
	public static function createNode2dRuntime(methods:flight._js.Node2DRuntimeMethods):flight._js.Node2DRuntime;
	@:native("flight_as_node2d_ref")
	public static function asNode2dRef(node:Dynamic):Dynamic;
	@:native("flight_get_display_object_runtime")
	public static function getDisplayObjectRuntime(source:flight._js.DisplayObject):flight._js.DisplayObjectRuntime;
	@:native("flight_get_node2d_runtime")
	public static function getNode2dRuntime(source:Dynamic):flight._js.Node2DRuntime;
	@:native("flight_is_node2d")
	public static function isNode2d(node:Dynamic):Bool;
	@:native("flight_set_node2d_clip")
	public static function setNode2dClip(source:Dynamic, value:Dynamic):Void;
	@:native("flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._js.AnimationClip, time:Float):Void;
	@:native("flight_get_node2d_animation_path_string")
	public static function getNode2dAnimationPathString(value:Int):String;
	@:native("flight_parse_node2d_animation_path")
	public static function parseNode2dAnimationPath(value:String):Int;
	@:native("flight_create_html_view")
	public static function createHtmlView():Dynamic;
	@:native("flight_create_html_view_data")
	public static function createHtmlViewData():flight._js.HtmlViewData;
	@:native("flight_create_html_view_runtime")
	public static function createHtmlViewRuntime():flight._js.HtmlViewRuntime;
	@:native("flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_get_html_view_runtime")
	public static function getHtmlViewRuntime(source:flight._js.HtmlView):flight._js.HtmlViewRuntime;
	@:native("flight_set_html_view_size")
	public static function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._js.Rectangle):Dynamic;
	@:native("flight_create_scale9_sprite_data")
	public static function createScale9SpriteData(scale9Grid:flight._js.Rectangle):flight._js.Scale9SpriteData;
	@:native("flight_create_scale9_sprite_runtime")
	public static function createScale9SpriteRuntime():flight._js.Node2DRuntime;
	@:native("flight_get_scale9_sprite_runtime")
	public static function getScale9SpriteRuntime(source:flight._js.Scale9Sprite):Dynamic;
	@:native("flight_create_scene2d")
	public static function createScene2d():Dynamic;
	@:native("flight_create_scene2d_runtime")
	public static function createScene2dRuntime():flight._js.Scene2DRuntime;
	@:native("flight_create_scene2d_signals")
	public static function createScene2dSignals():Dynamic;
	@:native("flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._js.Scene2D):Dynamic;
	@:native("flight_get_scene2d_align_string")
	public static function getScene2dAlignString(value:Int):String;
	@:native("flight_get_scene2d_display_state_string")
	public static function getScene2dDisplayStateString(value:Int):String;
	@:native("flight_get_scene2d_quality_string")
	public static function getScene2dQualityString(value:Int):String;
	@:native("flight_get_scene2d_root")
	public static function getScene2dRoot(source:Dynamic):Dynamic;
	@:native("flight_get_scene2d_runtime")
	public static function getScene2dRuntime(source:flight._js.Scene2D):flight._js.Scene2DRuntime;
	@:native("flight_get_scene2d_scale_mode_string")
	public static function getScene2dScaleModeString(value:Int):String;
	@:native("flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._js.Scene2D):Dynamic;
	@:native("flight_parse_scene2d_align")
	public static function parseScene2dAlign(value:String):Int;
	@:native("flight_parse_scene2d_display_state")
	public static function parseScene2dDisplayState(value:String):Int;
	@:native("flight_parse_scene2d_quality")
	public static function parseScene2dQuality(value:String):Int;
	@:native("flight_parse_scene2d_scale_mode")
	public static function parseScene2dScaleMode(value:String):Int;
	@:native("flight_set_scene2d_size")
	public static function setScene2dSize(source:Dynamic, width:Float, height:Float):Void;
	@:native("flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._js.Scene2DKindUsage;
	@:native("flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._js.Scene2DKindUsage, scene:flight._js.Scene2D):Void;
	@:native("flight_create_sprite")
	public static function createSprite():Dynamic;
	@:native("flight_create_sprite_data")
	public static function createSpriteData():flight._js.SpriteData;
	@:native("flight_create_sprite_renderer_data")
	public static function createSpriteRendererData(source:Dynamic):flight._js.SpriteIdentityRendererData;
	@:native("flight_create_sprite_runtime")
	public static function createSpriteRuntime():flight._js.Node2DRuntime;
	@:native("flight_clone_sprite")
	public static function cloneSprite(source:flight._js.Sprite):Dynamic;
	@:native("flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_get_sprite_runtime")
	public static function getSpriteRuntime(source:flight._js.Sprite):Dynamic;
	@:native("flight_free_display_object_runtime")
	public static function freeDisplayObjectRuntime(ptr:flight._js.DisplayObjectRuntime):Void;
	@:native("flight_free_html_view_data")
	public static function freeHtmlViewData(ptr:flight._js.HtmlViewData):Void;
	@:native("flight_free_html_view_runtime")
	public static function freeHtmlViewRuntime(ptr:flight._js.HtmlViewRuntime):Void;
	@:native("flight_free_scale9_sprite_data")
	public static function freeScale9SpriteData(ptr:flight._js.Scale9SpriteData):Void;
	@:native("flight_free_scene2_druntime")
	public static function freeScene2Druntime(ptr:flight._js.Scene2DRuntime):Void;
	@:native("flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._js.Scene2DKindUsage):Void;
	@:native("flight_free_sprite_data")
	public static function freeSpriteData(ptr:flight._js.SpriteData):Void;
	@:native("flight_free_sprite_identity_renderer_data")
	public static function freeSpriteIdentityRendererData(ptr:flight._js.SpriteIdentityRendererData):Void;
}
