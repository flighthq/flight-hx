package flight._js;

abstract TexturePackerAtlasMeta(Dynamic) {
	public var app(get, set):String;
	inline function get_app():String return untyped this.app;
	inline function set_app(value:String):String return untyped this.app = value;
	public var format(get, set):String;
	inline function get_format():String return untyped this.format;
	inline function set_format(value:String):String return untyped this.format = value;
	public var image(get, set):String;
	inline function get_image():String return untyped this.image;
	inline function set_image(value:String):String return untyped this.image = value;
	public var version(get, set):String;
	inline function get_version():String return untyped this.version;
	inline function set_version(value:String):String return untyped this.version = value;
}
