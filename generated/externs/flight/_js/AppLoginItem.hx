package flight._js;

abstract AppLoginItem(Dynamic) {
	public var openAtLogin(get, set):Bool;
	inline function get_openAtLogin():Bool return untyped this.openAtLogin;
	inline function set_openAtLogin(value:Bool):Bool return untyped this.openAtLogin = value;
	public var openAsHidden(get, set):Bool;
	inline function get_openAsHidden():Bool return untyped this.openAsHidden;
	inline function set_openAsHidden(value:Bool):Bool return untyped this.openAsHidden = value;
	public var path(get, set):String;
	inline function get_path():String return untyped this.path;
	inline function set_path(value:String):String return untyped this.path = value;
}
