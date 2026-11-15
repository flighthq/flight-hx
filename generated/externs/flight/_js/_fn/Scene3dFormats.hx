package flight._js._fn;

@:jsRequire("flight")
extern class Scene3dFormats {
	@:native("flight_create_awd2_parse_state")
	public static function createAwd2ParseState():flight._js.Awd2ParseState;
	@:native("flight_free_awd2_parse_state")
	public static function freeAwd2ParseState(ptr:flight._js.Awd2ParseState):Void;
}
