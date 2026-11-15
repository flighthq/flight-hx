package flight._hl;

abstract SpritesheetTimelineSourceExplanation(hl.Bytes) {
	public var directionMaterialized(get, set):Bool;

	inline function get_directionMaterialized():Bool return this.getUI8(0) != 0;

	inline function set_directionMaterialized(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
}
