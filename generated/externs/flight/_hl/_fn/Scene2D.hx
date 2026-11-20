package flight._hl._fn;

extern class Scene2D {
	@:hlNative("flight", "flight_create_display_object")
	public static function createDisplayObject():flight._hl.FlightNode;
	@:hlNative("flight", "flight_is_node2d")
	public static function isNode2d(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node2d_clip")
	public static function setNode2dClip(source:flight._hl.FlightNode, value:hl.Bytes):Bool;
	@:hlNative("flight", "flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._hl.AnimationClip, time:Float):Void;
	@:hlNative("flight", "flight_create_html_view")
	public static function createHtmlView():flight._hl.FlightNode;
	@:hlNative("flight", "flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_set_html_view_size")
	public static function setHtmlViewSize(source:flight._hl.FlightNode, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._hl.Rectangle):flight._hl.FlightNode;
	@:hlNative("flight", "flight_create_scene2d")
	public static function createScene2d():hl.Bytes;
	@:hlNative("flight", "flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_root")
	public static function getScene2dRoot(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._hl.Scene2D):hl.Bytes;
	@:hlNative("flight", "flight_set_scene2d_size")
	public static function setScene2dSize(source:hl.Bytes, width:Float, height:Float):Void;
	@:hlNative("flight", "flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._hl.Scene2DKindUsage;
	@:hlNative("flight", "flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._hl.Scene2DKindUsage, scene:flight._hl.Scene2D):Void;
	@:hlNative("flight", "flight_create_sprite")
	public static function createSprite():flight._hl.FlightNode;
	@:hlNative("flight", "flight_clone_sprite")
	public static function cloneSprite(source:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_free_scene2_dsignals_ref")
	public static function freeScene2DsignalsRef(ptr:flight._hl.Scene2DSignals):Void;
	@:hlNative("flight", "flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._hl.Scene2DKindUsage):Void;
	@:hlNative("flight", "flight_free_scene2_dslot_reference_ref")
	public static function freeScene2DslotReferenceRef(ptr:flight._hl.Scene2DSlotReference):Void;
}
