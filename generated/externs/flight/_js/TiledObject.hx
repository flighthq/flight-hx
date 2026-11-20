package flight._js;

abstract TiledObject(Dynamic) {
	public var ellipse(get, set):Bool;
	inline function get_ellipse():Bool return untyped this.ellipse;
	inline function set_ellipse(value:Bool):Bool return untyped this.ellipse = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var id(get, set):Int;
	inline function get_id():Int return untyped this.id;
	inline function set_id(value:Int):Int return untyped this.id = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var point(get, set):Bool;
	inline function get_point():Bool return untyped this.point;
	inline function set_point(value:Bool):Bool return untyped this.point = value;
	public var rotation(get, set):Float;
	inline function get_rotation():Float return untyped this.rotation;
	inline function set_rotation(value:Float):Float return untyped this.rotation = value;
	public var objectType(get, set):String;
	inline function get_objectType():String return untyped this.objectType;
	inline function set_objectType(value:String):String return untyped this.objectType = value;
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool return untyped this.visible = value;
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
