package flight._js;

abstract TextInputHistoryEntry(Dynamic) {
	public var caretIndexAfter(get, set):Int;
	inline function get_caretIndexAfter():Int return untyped this["caretIndexAfter"];
	inline function set_caretIndexAfter(value:Int):Int return untyped this["caretIndexAfter"] = value;
	public var caretIndexBefore(get, set):Int;
	inline function get_caretIndexBefore():Int return untyped this["caretIndexBefore"];
	inline function set_caretIndexBefore(value:Int):Int return untyped this["caretIndexBefore"] = value;
	public var selectionIndexAfter(get, set):Int;
	inline function get_selectionIndexAfter():Int return untyped this["selectionIndexAfter"];
	inline function set_selectionIndexAfter(value:Int):Int return untyped this["selectionIndexAfter"] = value;
	public var selectionIndexBefore(get, set):Int;
	inline function get_selectionIndexBefore():Int return untyped this["selectionIndexBefore"];
	inline function set_selectionIndexBefore(value:Int):Int return untyped this["selectionIndexBefore"] = value;
	public var textAfter(get, set):String;
	inline function get_textAfter():String return untyped this["textAfter"];
	inline function set_textAfter(value:String):String return untyped this["textAfter"] = value;
	public var textBefore(get, set):String;
	inline function get_textBefore():String return untyped this["textBefore"];
	inline function set_textBefore(value:String):String return untyped this["textBefore"] = value;
}
