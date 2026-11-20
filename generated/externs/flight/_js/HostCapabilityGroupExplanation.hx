package flight._js;

abstract HostCapabilityGroupExplanation(Dynamic) {
	public var group(get, set):String;
	inline function get_group():String return untyped this.group;
	inline function set_group(value:String):String return untyped this.group = value;
}
