package flight._js;

abstract AssetLoadExplanation(Dynamic) {
	public var id(get, set):String;
	inline function get_id():String return untyped this.id;
	inline function set_id(value:String):String return untyped this.id = value;
	public var refCount(get, set):Int;
	inline function get_refCount():Int return untyped this.refCount;
	inline function set_refCount(value:Int):Int return untyped this.refCount = value;
}
