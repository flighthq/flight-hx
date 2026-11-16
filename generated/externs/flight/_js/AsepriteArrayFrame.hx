package flight._js;

abstract AsepriteArrayFrame(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this["duration"];
	inline function set_duration(value:Float):Float return untyped this["duration"] = value;
	public var filename(get, set):String;
	inline function get_filename():String return untyped this["filename"];
	inline function set_filename(value:String):String return untyped this["filename"] = value;
	public var rotated(get, set):Bool;
	inline function get_rotated():Bool return untyped this["rotated"];
	inline function set_rotated(value:Bool):Bool return untyped this["rotated"] = value;
	public var trimmed(get, set):Bool;
	inline function get_trimmed():Bool return untyped this["trimmed"];
	inline function set_trimmed(value:Bool):Bool return untyped this["trimmed"] = value;
}
