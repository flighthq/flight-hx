package flight._js;

abstract HostCapabilityBackend(Dynamic) {
	public var entryPoint(get, set):String;
	inline function get_entryPoint():String return untyped this.entryPoint;
	inline function set_entryPoint(value:String):String return untyped this.entryPoint = value;
	public var packageName(get, set):String;
	inline function get_packageName():String return untyped this.packageName;
	inline function set_packageName(value:String):String return untyped this.packageName = value;
	public var platform(get, set):String;
	inline function get_platform():String return untyped this.platform;
	inline function set_platform(value:String):String return untyped this.platform = value;
}
