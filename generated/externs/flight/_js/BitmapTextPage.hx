package flight._js;

abstract BitmapTextPage(Dynamic) {
	public var instanceCount(get, set):Int;
	inline function get_instanceCount():Int return untyped this.instanceCount;
	inline function set_instanceCount(value:Int):Int return untyped this.instanceCount = value;
}
