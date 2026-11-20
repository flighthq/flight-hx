package flight._js;

abstract SocketMessage(Dynamic) {
	public var binary(get, set):Bool;
	inline function get_binary():Bool return untyped this.binary;
	inline function set_binary(value:Bool):Bool return untyped this.binary = value;
}
