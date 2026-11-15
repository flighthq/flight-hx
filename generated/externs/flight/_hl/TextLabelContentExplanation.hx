package flight._hl;

abstract TextLabelContentExplanation(hl.Bytes) {
	public var agreement(get, set):Bool;

	inline function get_agreement():Bool return this.getUI8(0) != 0;

	inline function set_agreement(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var revision(get, set):Int;

	inline function get_revision():Int return this.getI32(56);

	inline function set_revision(value:Int):Int { this.setI32(56, value); return value; }
}
