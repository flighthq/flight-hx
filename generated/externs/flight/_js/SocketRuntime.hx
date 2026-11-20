package flight._js;

abstract SocketRuntime(Dynamic) {
	public var delivering(get, set):Bool;
	inline function get_delivering():Bool return untyped this.delivering;
	inline function set_delivering(value:Bool):Bool return untyped this.delivering = value;
	public var disposed(get, set):Bool;
	inline function get_disposed():Bool return untyped this.disposed;
	inline function set_disposed(value:Bool):Bool return untyped this.disposed = value;
}
