package flight._js;

abstract FileStat(Dynamic) {
	public var size(get, set):Int;
	inline function get_size():Int return untyped this.size;
	inline function set_size(value:Int):Int return untyped this.size = value;
	public var isDirectory(get, set):Bool;
	inline function get_isDirectory():Bool return untyped this.isDirectory;
	inline function set_isDirectory(value:Bool):Bool return untyped this.isDirectory = value;
	public var modifiedTime(get, set):Float;
	inline function get_modifiedTime():Float return untyped this.modifiedTime;
	inline function set_modifiedTime(value:Float):Float return untyped this.modifiedTime = value;
	public var createdTime(get, set):Float;
	inline function get_createdTime():Float return untyped this.createdTime;
	inline function set_createdTime(value:Float):Float return untyped this.createdTime = value;
	public var isSymlink(get, set):Bool;
	inline function get_isSymlink():Bool return untyped this.isSymlink;
	inline function set_isSymlink(value:Bool):Bool return untyped this.isSymlink = value;
}
