package flight._js;

abstract MessageDialogResult(Dynamic) {
	public var buttonIndex(get, set):Int;
	inline function get_buttonIndex():Int return untyped this.buttonIndex;
	inline function set_buttonIndex(value:Int):Int return untyped this.buttonIndex = value;
	public var cancelled(get, set):Bool;
	inline function get_cancelled():Bool return untyped this.cancelled;
	inline function set_cancelled(value:Bool):Bool return untyped this.cancelled = value;
	public var checkboxChecked(get, set):Bool;
	inline function get_checkboxChecked():Bool return untyped this.checkboxChecked;
	inline function set_checkboxChecked(value:Bool):Bool return untyped this.checkboxChecked = value;
}
