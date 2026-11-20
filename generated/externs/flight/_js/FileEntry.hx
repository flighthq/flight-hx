package flight._js;

abstract FileEntry(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var path(get, set):String;
	inline function get_path():String return untyped this.path;
	inline function set_path(value:String):String return untyped this.path = value;
	public var isDirectory(get, set):Bool;
	inline function get_isDirectory():Bool return untyped this.isDirectory;
	inline function set_isDirectory(value:Bool):Bool return untyped this.isDirectory = value;
}
