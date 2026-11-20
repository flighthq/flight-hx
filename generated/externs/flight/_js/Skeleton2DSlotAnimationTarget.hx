package flight._js;

abstract Skeleton2DSlotAnimationTarget(Dynamic) {
	public var path(get, set):String;
	inline function get_path():String return untyped this.path;
	inline function set_path(value:String):String return untyped this.path = value;
	public var slotIndex(get, set):Int;
	inline function get_slotIndex():Int return untyped this.slotIndex;
	inline function set_slotIndex(value:Int):Int return untyped this.slotIndex = value;
}
