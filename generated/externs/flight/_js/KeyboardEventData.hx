package flight._js;

abstract KeyboardEventData(Dynamic) {
	public var altKey(get, set):Bool;
	inline function get_altKey():Bool return untyped this.altKey;
	inline function set_altKey(value:Bool):Bool return untyped this.altKey = value;
	public var ctrlKey(get, set):Bool;
	inline function get_ctrlKey():Bool return untyped this.ctrlKey;
	inline function set_ctrlKey(value:Bool):Bool return untyped this.ctrlKey = value;
	public var key(get, set):String;
	inline function get_key():String return untyped this.key;
	inline function set_key(value:String):String return untyped this.key = value;
	public var keyCode(get, set):Int;
	inline function get_keyCode():Int return untyped this.keyCode;
	inline function set_keyCode(value:Int):Int return untyped this.keyCode = value;
	public var metaKey(get, set):Bool;
	inline function get_metaKey():Bool return untyped this.metaKey;
	inline function set_metaKey(value:Bool):Bool return untyped this.metaKey = value;
	public var shiftKey(get, set):Bool;
	inline function get_shiftKey():Bool return untyped this.shiftKey;
	inline function set_shiftKey(value:Bool):Bool return untyped this.shiftKey = value;
}
