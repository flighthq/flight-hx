package flight._js;

abstract BackendOperationExplanation(Dynamic) {
	public var implemented(get, set):Bool;
	inline function get_implemented():Bool return untyped this.implemented;
	inline function set_implemented(value:Bool):Bool return untyped this.implemented = value;
	public var operation(get, set):String;
	inline function get_operation():String return untyped this.operation;
	inline function set_operation(value:String):String return untyped this.operation = value;
}
