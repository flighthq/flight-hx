package flight._hl;

abstract TextInputState(hl.Bytes) {
	public var alwaysShowSelection(get, set):Bool;

	inline function get_alwaysShowSelection():Bool return this.getUI8(0) != 0;

	inline function set_alwaysShowSelection(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var caretColor(get, set):Int;

	inline function get_caretColor():Int return this.getI32(4);

	inline function set_caretColor(value:Int):Int { this.setI32(4, value); return value; }
	public var caretIndex(get, set):Int;

	inline function get_caretIndex():Int return this.getI32(8);

	inline function set_caretIndex(value:Int):Int { this.setI32(8, value); return value; }
	public var caretWidth(get, set):Single;

	inline function get_caretWidth():Single return this.getF32(16);

	inline function set_caretWidth(value:Single):Single { this.setF32(16, value); return value; }
	public var desiredCaretX(get, set):Single;

	inline function get_desiredCaretX():Single return this.getF32(20);

	inline function set_desiredCaretX(value:Single):Single { this.setF32(20, value); return value; }
	public var displayAsPassword(get, set):Bool;

	inline function get_displayAsPassword():Bool return this.getUI8(24) != 0;

	inline function set_displayAsPassword(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var focused(get, set):Bool;

	inline function get_focused():Bool return this.getUI8(25) != 0;

	inline function set_focused(value:Bool):Bool { this.setUI8(25, value ? 1 : 0); return value; }
	public var historyIndex(get, set):Int;

	inline function get_historyIndex():Int return this.getI32(56);

	inline function set_historyIndex(value:Int):Int { this.setI32(56, value); return value; }
	public var historyLimit(get, set):Int;

	inline function get_historyLimit():Int return this.getI32(64);

	inline function set_historyLimit(value:Int):Int { this.setI32(64, value); return value; }
	public var selectionAlpha(get, set):Single;

	inline function get_selectionAlpha():Single return this.getF32(120);

	inline function set_selectionAlpha(value:Single):Single { this.setF32(120, value); return value; }
	public var selectionColor(get, set):Int;

	inline function get_selectionColor():Int return this.getI32(124);

	inline function set_selectionColor(value:Int):Int { this.setI32(124, value); return value; }
	public var selectionIndex(get, set):Int;

	inline function get_selectionIndex():Int return this.getI32(128);

	inline function set_selectionIndex(value:Int):Int { this.setI32(128, value); return value; }
}
