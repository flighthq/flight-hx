package flight._hl;

abstract Scene3DForwardLightSelectionExplanation(hl.Bytes) {
	public var pointLightCount(get, set):Int;

	inline function get_pointLightCount():Int return this.getI32(0);

	inline function set_pointLightCount(value:Int):Int { this.setI32(0, value); return value; }
	public var selectionPrepared(get, set):Bool;

	inline function get_selectionPrepared():Bool return this.getUI8(12) != 0;

	inline function set_selectionPrepared(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
	public var spotLightCount(get, set):Int;

	inline function get_spotLightCount():Int return this.getI32(16);

	inline function set_spotLightCount(value:Int):Int { this.setI32(16, value); return value; }
}
