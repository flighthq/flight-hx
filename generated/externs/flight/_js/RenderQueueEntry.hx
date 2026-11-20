package flight._js;

abstract RenderQueueEntry(Dynamic) {
	public var proxy(get, set):Float;
	inline function get_proxy():Float return untyped this.proxy;
	inline function set_proxy(value:Float):Float return untyped this.proxy = value;
}
