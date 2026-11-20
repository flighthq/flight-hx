package flight._js;

abstract SpineDrawOrderMove(Dynamic) {
	public var offset(get, set):Int;
	inline function get_offset():Int return untyped this.offset;
	inline function set_offset(value:Int):Int return untyped this.offset = value;
	public var slotIndex(get, set):Int;
	inline function get_slotIndex():Int return untyped this.slotIndex;
	inline function set_slotIndex(value:Int):Int return untyped this.slotIndex = value;
}
