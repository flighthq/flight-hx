package flight._js;

abstract TweenManagerData(Dynamic) {
	public var brand(get, set):String;
	inline function get_brand():String return untyped this.__brand;
	inline function set_brand(value:String):String return untyped this.__brand = value;
}
