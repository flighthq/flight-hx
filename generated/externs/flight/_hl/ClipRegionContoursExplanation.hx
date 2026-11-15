package flight._hl;

abstract ClipRegionContoursExplanation(hl.Bytes) {
	public var contourIndex(get, set):Int;

	inline function get_contourIndex():Int return this.getI32(0);

	inline function set_contourIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var coordinateCount(get, set):Int;

	inline function get_coordinateCount():Int return this.getI32(8);

	inline function set_coordinateCount(value:Int):Int { this.setI32(8, value); return value; }
}
