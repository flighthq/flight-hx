package flight._js;

abstract ParticleObject(Dynamic) {
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float return untyped this.alpha = value;
	public var rotation(get, set):Float;
	inline function get_rotation():Float return untyped this.rotation;
	inline function set_rotation(value:Float):Float return untyped this.rotation = value;
	public var scaleX(get, set):Float;
	inline function get_scaleX():Float return untyped this.scaleX;
	inline function set_scaleX(value:Float):Float return untyped this.scaleX = value;
	public var scaleY(get, set):Float;
	inline function get_scaleY():Float return untyped this.scaleY;
	inline function set_scaleY(value:Float):Float return untyped this.scaleY = value;
	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool return untyped this.visible = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
}
