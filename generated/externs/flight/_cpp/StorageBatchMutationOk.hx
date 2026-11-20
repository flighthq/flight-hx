package flight._cpp;

private extern class StorageBatchMutationOk_Ffi {
	@:native("flight_get_storage_batch_mutation_ok_completed") static function get_completed(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_storage_batch_mutation_ok_completed") static function set_completed(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract StorageBatchMutationOk(cpp.Star<cpp.Void>) {
	public var completed(get, set):Int;

	inline function get_completed():Int return StorageBatchMutationOk_Ffi.get_completed(this);

	inline function set_completed(value:Int):Int { StorageBatchMutationOk_Ffi.set_completed(this, value); return value; }
}
