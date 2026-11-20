package flight._js;

abstract RequirementCodegenPlan(Dynamic) {
	public var backend(get, set):String;
	inline function get_backend():String return untyped this.backend;
	inline function set_backend(value:String):String return untyped this.backend = value;
}
