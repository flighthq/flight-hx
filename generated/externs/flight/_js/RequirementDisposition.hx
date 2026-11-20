package flight._js;

abstract RequirementDisposition(Dynamic) {
	public var backend(get, set):String;
	inline function get_backend():String return untyped this.backend;
	inline function set_backend(value:String):String return untyped this.backend = value;
	public var reason(get, set):String;
	inline function get_reason():String return untyped this.reason;
	inline function set_reason(value:String):String return untyped this.reason = value;
}
