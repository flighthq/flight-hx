package flight._js;

abstract TiledLayerBase(Dynamic) {
	public var class_(get, set):String;
	inline function get_class_():String return untyped this.class_;
	inline function set_class_(value:String):String return untyped this.class_ = value;
	public var id(get, set):Int;
	inline function get_id():Int return untyped this.id;
	inline function set_id(value:Int):Int return untyped this.id = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var offsetX(get, set):Float;
	inline function get_offsetX():Float return untyped this.offsetX;
	inline function set_offsetX(value:Float):Float return untyped this.offsetX = value;
	public var offsetY(get, set):Float;
	inline function get_offsetY():Float return untyped this.offsetY;
	inline function set_offsetY(value:Float):Float return untyped this.offsetY = value;
	public var opacity(get, set):Float;
	inline function get_opacity():Float return untyped this.opacity;
	inline function set_opacity(value:Float):Float return untyped this.opacity = value;
	public var parallaxX(get, set):Float;
	inline function get_parallaxX():Float return untyped this.parallaxX;
	inline function set_parallaxX(value:Float):Float return untyped this.parallaxX = value;
	public var parallaxY(get, set):Float;
	inline function get_parallaxY():Float return untyped this.parallaxY;
	inline function set_parallaxY(value:Float):Float return untyped this.parallaxY = value;
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool return untyped this.visible = value;
}
