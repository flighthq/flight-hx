package flight._js;

abstract Scene3DResourceLoadProgress(Dynamic) {
	public var loaded(get, set):Int;
	inline function get_loaded():Int return untyped this.loaded;
	inline function set_loaded(value:Int):Int return untyped this.loaded = value;
	public var total(get, set):Int;
	inline function get_total():Int return untyped this.total;
	inline function set_total(value:Int):Int return untyped this.total = value;
}
