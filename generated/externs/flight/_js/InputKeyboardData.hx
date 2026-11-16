package flight._js;

abstract InputKeyboardData(Dynamic) {
	public var altKey(get, set):Bool;
	inline function get_altKey():Bool return untyped this.altKey;
	inline function set_altKey(value:Bool):Bool return untyped this.altKey = value;
	public var capsLock(get, set):Bool;
	inline function get_capsLock():Bool return untyped this.capsLock;
	inline function set_capsLock(value:Bool):Bool return untyped this.capsLock = value;
	public var ctrlKey(get, set):Bool;
	inline function get_ctrlKey():Bool return untyped this.ctrlKey;
	inline function set_ctrlKey(value:Bool):Bool return untyped this.ctrlKey = value;
	public var keyCode(get, set):Int;
	inline function get_keyCode():Int return untyped this.keyCode;
	inline function set_keyCode(value:Int):Int return untyped this.keyCode = value;
	public var location(get, set):Int;
	inline function get_location():Int return untyped this.location;
	inline function set_location(value:Int):Int return untyped this.location = value;
	public var metaKey(get, set):Bool;
	inline function get_metaKey():Bool return untyped this.metaKey;
	inline function set_metaKey(value:Bool):Bool return untyped this.metaKey = value;
	public var modifier(get, set):Int;
	inline function get_modifier():Int return untyped this.modifier;
	inline function set_modifier(value:Int):Int return untyped this.modifier = value;
	public var numLock(get, set):Bool;
	inline function get_numLock():Bool return untyped this.numLock;
	inline function set_numLock(value:Bool):Bool return untyped this.numLock = value;
	public var repeat(get, set):Bool;
	inline function get_repeat():Bool return untyped this.repeat;
	inline function set_repeat(value:Bool):Bool return untyped this.repeat = value;
	public var shiftKey(get, set):Bool;
	inline function get_shiftKey():Bool return untyped this.shiftKey;
	inline function set_shiftKey(value:Bool):Bool return untyped this.shiftKey = value;
	public var timeStamp(get, set):Float;
	inline function get_timeStamp():Float return untyped this.timeStamp;
	inline function set_timeStamp(value:Float):Float return untyped this.timeStamp = value;
}
