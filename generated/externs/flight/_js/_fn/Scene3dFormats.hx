package flight._js._fn;

@:jsRequire("@flighthq/scene3d-formats")
extern class Scene3dFormats {
	@:native("createAwd2ParseState")
	public static function createAwd2ParseState():flight._js.Awd2ParseState;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAwd2ParseState(ptr:flight._js.Awd2ParseState):Void {}
}
