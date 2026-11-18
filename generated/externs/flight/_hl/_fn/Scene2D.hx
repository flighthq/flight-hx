package flight._hl._fn;

extern class Scene2D {
	@:hlNative("flight", "flight_create_display_object")
	public static function createDisplayObject():hl.Bytes;
	@:hlNative("flight", "flight_is_node2d")
	public static function isNode2d(node:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_node2d_clip")
	public static function setNode2dClip(source:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._hl.AnimationClip, time:Single):Void;
	@:hlNative("flight", "flight_create_html_view")
	public static function createHtmlView():hl.Bytes;
	@:hlNative("flight", "flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._hl.Rectangle, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_html_view_size")
	public static function setHtmlViewSize(source:hl.Bytes, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._hl.Rectangle):hl.Bytes;
	@:hlNative("flight", "flight_create_scene2d")
	public static function createScene2d():hl.Bytes;
	@:hlNative("flight", "flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_root")
	public static function getScene2dRoot(source:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_set_scene2d_size")
	public static function setScene2dSize(source:hl.Bytes, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._hl.Scene2DKindUsage;
	@:hlNative("flight", "flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._hl.Scene2DKindUsage, scene:flight._hl.Scene2D):Void;
	@:hlNative("flight", "flight_create_sprite")
	public static function createSprite():hl.Bytes;
	@:hlNative("flight", "flight_clone_sprite")
	public static function cloneSprite(source:flight._hl.Sprite):hl.Bytes;
	@:hlNative("flight", "flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._hl.Rectangle, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._hl.Scene2DKindUsage):Void;
}
