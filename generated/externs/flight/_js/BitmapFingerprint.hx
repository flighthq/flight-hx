package flight._js;

abstract BitmapFingerprint(Dynamic) {
	public var gridSize(get, set):Int;
	inline function get_gridSize():Int return untyped this.gridSize;
	inline function set_gridSize(value:Int):Int return untyped this.gridSize = value;
}
