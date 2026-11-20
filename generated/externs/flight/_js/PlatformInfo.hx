package flight._js;

abstract PlatformInfo(Dynamic) {
	public var version(get, set):String;
	inline function get_version():String return untyped this.version;
	inline function set_version(value:String):String return untyped this.version = value;
	public var arch(get, set):String;
	inline function get_arch():String return untyped this.arch;
	inline function set_arch(value:String):String return untyped this.arch = value;
	public var locale(get, set):String;
	inline function get_locale():String return untyped this.locale;
	inline function set_locale(value:String):String return untyped this.locale = value;
	public var isTouch(get, set):Bool;
	inline function get_isTouch():Bool return untyped this.isTouch;
	inline function set_isTouch(value:Bool):Bool return untyped this.isTouch = value;
	public var engineVersion(get, set):String;
	inline function get_engineVersion():String return untyped this.engineVersion;
	inline function set_engineVersion(value:String):String return untyped this.engineVersion = value;
	public var pointerWidth(get, set):Int;
	inline function get_pointerWidth():Int return untyped this.pointerWidth;
	inline function set_pointerWidth(value:Int):Int return untyped this.pointerWidth = value;
	public var osBuild(get, set):String;
	inline function get_osBuild():String return untyped this.osBuild;
	inline function set_osBuild(value:String):String return untyped this.osBuild = value;
	public var distro(get, set):String;
	inline function get_distro():String return untyped this.distro;
	inline function set_distro(value:String):String return untyped this.distro = value;
	public var distroVersion(get, set):String;
	inline function get_distroVersion():String return untyped this.distroVersion;
	inline function set_distroVersion(value:String):String return untyped this.distroVersion = value;
}
