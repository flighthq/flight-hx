package flight._js;

abstract AsepriteLayer(Dynamic) {
	public var blendMode(get, set):String;
	inline function get_blendMode():String return untyped this.blendMode;
	inline function set_blendMode(value:String):String return untyped this.blendMode = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var opacity(get, set):Float;
	inline function get_opacity():Float return untyped this.opacity;
	inline function set_opacity(value:Float):Float return untyped this.opacity = value;
}
