package flight._hl;

abstract HasTransform3DRuntime(hl.Bytes) {
	public var localMatrix4Detached(get, set):Bool;

	inline function get_localMatrix4Detached():Bool return this.getUI8(152) != 0;

	inline function set_localMatrix4Detached(value:Bool):Bool { this.setUI8(152, value ? 1 : 0); return value; }
}
