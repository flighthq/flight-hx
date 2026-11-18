package flight._hl;

abstract SetNodePropertyCommand(hl.Bytes) {
	public var mergeWindow(get, set):Float;

	inline function get_mergeWindow():Float return this.getF64(88);

	inline function set_mergeWindow(value:Float):Float { this.setF64(88, value); return value; }
	public var time(get, set):Float;

	inline function get_time():Float return this.getF64(96);

	inline function set_time(value:Float):Float { this.setF64(96, value); return value; }
}
