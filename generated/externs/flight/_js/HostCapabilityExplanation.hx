package flight._js;

abstract HostCapabilityExplanation(Dynamic) {
	public var capability(get, set):String;
	inline function get_capability():String return untyped this.capability;
	inline function set_capability(value:String):String return untyped this.capability = value;
	public var group(get, set):String;
	inline function get_group():String return untyped this.group;
	inline function set_group(value:String):String return untyped this.group = value;
	public var isPresent(get, set):Bool;
	inline function get_isPresent():Bool return untyped this.isPresent;
	inline function set_isPresent(value:Bool):Bool return untyped this.isPresent = value;
	public var message(get, set):String;
	inline function get_message():String return untyped this.message;
	inline function set_message(value:String):String return untyped this.message = value;
	public var slot(get, set):String;
	inline function get_slot():String return untyped this.slot;
	inline function set_slot(value:String):String return untyped this.slot = value;
}
