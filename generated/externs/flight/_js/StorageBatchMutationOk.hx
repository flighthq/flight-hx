package flight._js;

abstract StorageBatchMutationOk(Dynamic) {
	public var completed(get, set):Int;
	inline function get_completed():Int return untyped this.completed;
	inline function set_completed(value:Int):Int return untyped this.completed = value;
}
