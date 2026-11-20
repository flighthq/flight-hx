package flight._js;

abstract RiveArtboardImport(Dynamic) {
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
}
