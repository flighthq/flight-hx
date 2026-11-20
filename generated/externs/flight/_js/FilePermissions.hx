package flight._js;

abstract FilePermissions(Dynamic) {
	public var readable(get, set):Bool;
	inline function get_readable():Bool return untyped this.readable;
	inline function set_readable(value:Bool):Bool return untyped this.readable = value;
	public var writable(get, set):Bool;
	inline function get_writable():Bool return untyped this.writable;
	inline function set_writable(value:Bool):Bool return untyped this.writable = value;
	public var executable(get, set):Bool;
	inline function get_executable():Bool return untyped this.executable;
	inline function set_executable(value:Bool):Bool return untyped this.executable = value;
}
