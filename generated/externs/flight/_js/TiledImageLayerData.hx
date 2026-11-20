package flight._js;

abstract TiledImageLayerData(Dynamic) {
	public var image(get, set):String;
	inline function get_image():String return untyped this.image;
	inline function set_image(value:String):String return untyped this.image = value;
	public var repeatX(get, set):Bool;
	inline function get_repeatX():Bool return untyped this.repeatX;
	inline function set_repeatX(value:Bool):Bool return untyped this.repeatX = value;
	public var repeatY(get, set):Bool;
	inline function get_repeatY():Bool return untyped this.repeatY;
	inline function set_repeatY(value:Bool):Bool return untyped this.repeatY = value;
}
