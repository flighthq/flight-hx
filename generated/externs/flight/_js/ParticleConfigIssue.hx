package flight._js;

abstract ParticleConfigIssue(Dynamic) {
	public var field(get, set):String;
	inline function get_field():String return untyped this.field;
	inline function set_field(value:String):String return untyped this.field = value;
	public var message(get, set):String;
	inline function get_message():String return untyped this.message;
	inline function set_message(value:String):String return untyped this.message = value;
	public var severity(get, set):String;
	inline function get_severity():String return untyped this.severity;
	inline function set_severity(value:String):String return untyped this.severity = value;
}
