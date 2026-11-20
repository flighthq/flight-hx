package flight._js;

abstract RenderQueue(Dynamic) {
	public var entryCount(get, set):Int;
	inline function get_entryCount():Int return untyped this.entryCount;
	inline function set_entryCount(value:Int):Int return untyped this.entryCount = value;
}
