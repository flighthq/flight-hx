package flight._hl;

abstract HasAppearanceRuntime(hl.Bytes) {
	public var worldAlphaUsingAppearanceId(get, set):Int;

	inline function get_worldAlphaUsingAppearanceId():Int return this.getI32(8);

	inline function set_worldAlphaUsingAppearanceId(value:Int):Int { this.setI32(8, value); return value; }
	public var worldAlphaUsingParentAppearanceId(get, set):Int;

	inline function get_worldAlphaUsingParentAppearanceId():Int return this.getI32(12);

	inline function set_worldAlphaUsingParentAppearanceId(value:Int):Int { this.setI32(12, value); return value; }
	public var worldAppearanceId(get, set):Int;

	inline function get_worldAppearanceId():Int return this.getI32(16);

	inline function set_worldAppearanceId(value:Int):Int { this.setI32(16, value); return value; }
}
