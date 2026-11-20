package flight._hl;

abstract MessageDialogResult(hl.Bytes) {
	public var buttonIndex(get, set):Int;

	inline function get_buttonIndex():Int return this.getI32(0);

	inline function set_buttonIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var cancelled(get, set):Bool;

	inline function get_cancelled():Bool return this.getUI8(4) != 0;

	inline function set_cancelled(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var checkboxChecked(get, set):Bool;

	inline function get_checkboxChecked():Bool return this.getUI8(5) != 0;

	inline function set_checkboxChecked(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
}
