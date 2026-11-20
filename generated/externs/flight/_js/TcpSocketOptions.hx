package flight._js;

abstract TcpSocketOptions(Dynamic) {
	public var host(get, set):String;
	inline function get_host():String return untyped this.host;
	inline function set_host(value:String):String return untyped this.host = value;
	public var port(get, set):Int;
	inline function get_port():Int return untyped this.port;
	inline function set_port(value:Int):Int return untyped this.port = value;
}
