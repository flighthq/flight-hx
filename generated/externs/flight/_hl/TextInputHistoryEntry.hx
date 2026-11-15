package flight._hl;

abstract TextInputHistoryEntry(hl.Bytes) {
	public var caretIndexAfter(get, set):Int;

	inline function get_caretIndexAfter():Int return this.getI32(0);

	inline function set_caretIndexAfter(value:Int):Int { this.setI32(0, value); return value; }
	public var caretIndexBefore(get, set):Int;

	inline function get_caretIndexBefore():Int return this.getI32(8);

	inline function set_caretIndexBefore(value:Int):Int { this.setI32(8, value); return value; }
	public var selectionIndexAfter(get, set):Int;

	inline function get_selectionIndexAfter():Int return this.getI32(40);

	inline function set_selectionIndexAfter(value:Int):Int { this.setI32(40, value); return value; }
	public var selectionIndexBefore(get, set):Int;

	inline function get_selectionIndexBefore():Int return this.getI32(48);

	inline function set_selectionIndexBefore(value:Int):Int { this.setI32(48, value); return value; }
}
