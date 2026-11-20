package flight._js;

abstract SpritesheetAnimationData(Dynamic) {
	public var frameDuration(get, set):Float;
	inline function get_frameDuration():Float return untyped this.frameDuration;
	inline function set_frameDuration(value:Float):Float return untyped this.frameDuration = value;
	public var repeatCount(get, set):Int;
	inline function get_repeatCount():Int return untyped this.repeatCount;
	inline function set_repeatCount(value:Int):Int return untyped this.repeatCount = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var originX(get, set):Float;
	inline function get_originX():Float return untyped this.originX;
	inline function set_originX(value:Float):Float return untyped this.originX = value;
	public var originY(get, set):Float;
	inline function get_originY():Float return untyped this.originY;
	inline function set_originY(value:Float):Float return untyped this.originY = value;
}
