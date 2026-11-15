package flight._hl._fn;

extern class Scene3dFormats {
	@:hlNative("flight", "flight_create_awd2_parse_state")
	public static function createAwd2ParseState():flight._hl.Awd2ParseState;
	@:hlNative("flight", "flight_free_awd2_parse_state")
	public static function freeAwd2ParseState(ptr:flight._hl.Awd2ParseState):Void;
}
