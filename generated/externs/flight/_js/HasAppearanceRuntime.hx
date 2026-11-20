package flight._js;

abstract HasAppearanceRuntime(Dynamic) {
	public var worldAlphaUsingAppearanceId(get, set):Int;
	inline function get_worldAlphaUsingAppearanceId():Int return untyped this.worldAlphaUsingAppearanceId;
	inline function set_worldAlphaUsingAppearanceId(value:Int):Int return untyped this.worldAlphaUsingAppearanceId = value;
	public var worldAlphaUsingParentAppearanceId(get, set):Int;
	inline function get_worldAlphaUsingParentAppearanceId():Int return untyped this.worldAlphaUsingParentAppearanceId;
	inline function set_worldAlphaUsingParentAppearanceId(value:Int):Int return untyped this.worldAlphaUsingParentAppearanceId = value;
	public var worldAppearanceId(get, set):Int;
	inline function get_worldAppearanceId():Int return untyped this.worldAppearanceId;
	inline function set_worldAppearanceId(value:Int):Int return untyped this.worldAppearanceId = value;
}
