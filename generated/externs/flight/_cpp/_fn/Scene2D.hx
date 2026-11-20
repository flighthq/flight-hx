package flight._cpp._fn;

extern class Scene2D {
	@:native("flight_create_display_object")
	public static function createDisplayObject():flight._cpp.FlightNode;
	@:native("flight_is_node2d")
	public static function isNode2d(node:flight._cpp.FlightNode):Bool;
	@:native("flight_set_node2d_clip")
	public static function setNode2dClip(source:flight._cpp.FlightNode, value:cpp.Star<cpp.Void>):Bool;
	@:native("flight_apply_animation_clip_to_node2d")
	public static function applyAnimationClipToNode2d(clip:flight._cpp.AnimationClip, time:Float):Void;
	@:native("flight_create_html_view")
	public static function createHtmlView():flight._cpp.FlightNode;
	@:native("flight_compute_html_view_local_bounds_rectangle")
	public static function computeHtmlViewLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_set_html_view_size")
	public static function setHtmlViewSize(source:flight._cpp.FlightNode, width:Float, height:Float):Void;
	@:native("flight_create_scale9_sprite")
	public static function createScale9Sprite(scale9Grid:flight._cpp.Rectangle):flight._cpp.FlightNode;
	@:native("flight_create_scene2d")
	public static function createScene2d():cpp.Star<cpp.Void>;
	@:native("flight_enable_scene2d_signals")
	public static function enableScene2dSignals(source:flight._cpp.Scene2D):cpp.Star<cpp.Void>;
	@:native("flight_get_scene2d_root")
	public static function getScene2dRoot(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_scene2d_signals")
	public static function getScene2dSignals(source:flight._cpp.Scene2D):cpp.Star<cpp.Void>;
	@:native("flight_set_scene2d_size")
	public static function setScene2dSize(source:cpp.Star<cpp.Void>, width:Float, height:Float):Void;
	@:native("flight_create_scene2d_kind_usage")
	public static function createScene2dKindUsage():flight._cpp.Scene2DKindUsage;
	@:native("flight_get_scene2d_kind_usage")
	public static function getScene2dKindUsage(out:flight._cpp.Scene2DKindUsage, scene:flight._cpp.Scene2D):Void;
	@:native("flight_create_sprite")
	public static function createSprite():flight._cpp.FlightNode;
	@:native("flight_clone_sprite")
	public static function cloneSprite(source:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_compute_sprite_local_bounds_rectangle")
	public static function computeSpriteLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_free_scene2_dsignals_ref")
	public static function freeScene2DsignalsRef(ptr:flight._cpp.Scene2DSignals):Void;
	@:native("flight_free_scene2_dkind_usage")
	public static function freeScene2DkindUsage(ptr:flight._cpp.Scene2DKindUsage):Void;
	@:native("flight_free_scene2_dslot_reference_ref")
	public static function freeScene2DslotReferenceRef(ptr:flight._cpp.Scene2DSlotReference):Void;
}
