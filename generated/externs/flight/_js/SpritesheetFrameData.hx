package flight._js;

abstract SpritesheetFrameData(Dynamic) {
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var offsetX(get, set):Float;
	inline function get_offsetX():Float return untyped this.offsetX;
	inline function set_offsetX(value:Float):Float return untyped this.offsetX = value;
	public var offsetY(get, set):Float;
	inline function get_offsetY():Float return untyped this.offsetY;
	inline function set_offsetY(value:Float):Float return untyped this.offsetY = value;
	public var rotated(get, set):Bool;
	inline function get_rotated():Bool return untyped this.rotated;
	inline function set_rotated(value:Bool):Bool return untyped this.rotated = value;
	public var sourceHeight(get, set):Float;
	inline function get_sourceHeight():Float return untyped this.sourceHeight;
	inline function set_sourceHeight(value:Float):Float return untyped this.sourceHeight = value;
	public var sourceWidth(get, set):Float;
	inline function get_sourceWidth():Float return untyped this.sourceWidth;
	inline function set_sourceWidth(value:Float):Float return untyped this.sourceWidth = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
}
