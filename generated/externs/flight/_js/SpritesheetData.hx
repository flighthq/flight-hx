package flight._js;

abstract SpritesheetData(Dynamic) {
	public var imageFile(get, set):String;
	inline function get_imageFile():String return untyped this.imageFile;
	inline function set_imageFile(value:String):String return untyped this.imageFile = value;
	public var imageHeight(get, set):Float;
	inline function get_imageHeight():Float return untyped this.imageHeight;
	inline function set_imageHeight(value:Float):Float return untyped this.imageHeight = value;
	public var imageWidth(get, set):Float;
	inline function get_imageWidth():Float return untyped this.imageWidth;
	inline function set_imageWidth(value:Float):Float return untyped this.imageWidth = value;
	public var scale(get, set):Float;
	inline function get_scale():Float return untyped this.scale;
	inline function set_scale(value:Float):Float return untyped this.scale = value;
}
