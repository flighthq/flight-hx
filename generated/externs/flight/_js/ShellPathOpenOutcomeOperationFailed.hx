package flight._js;

abstract ShellPathOpenOutcomeOperationFailed(Dynamic) {
	public var message(get, set):String;
	inline function get_message():String return untyped this.message;
	inline function set_message(value:String):String return untyped this.message = value;
}
