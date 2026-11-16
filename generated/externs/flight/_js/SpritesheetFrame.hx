package flight._js;

abstract SpritesheetFrame(Dynamic) {
	public var id(get, set):Int;
	inline function get_id():Int return untyped this["id"];
	inline function set_id(value:Int):Int return untyped this["id"] = value;
	public var offsetX(get, set):Float;
	inline function get_offsetX():Float return untyped this["offsetX"];
	inline function set_offsetX(value:Float):Float return untyped this["offsetX"] = value;
	public var offsetY(get, set):Float;
	inline function get_offsetY():Float return untyped this["offsetY"];
	inline function set_offsetY(value:Float):Float return untyped this["offsetY"] = value;
	public var rotated(get, set):Bool;
	inline function get_rotated():Bool return untyped this["rotated"];
	inline function set_rotated(value:Bool):Bool return untyped this["rotated"] = value;
}
