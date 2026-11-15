package flight._hl;

abstract Scene3DLightBlock(hl.Bytes) {
	public var ambientCount(get, set):Int;

	inline function get_ambientCount():Int return this.getI32(0);

	inline function set_ambientCount(value:Int):Int { this.setI32(0, value); return value; }
	public var directionalCount(get, set):Int;

	inline function get_directionalCount():Int return this.getI32(24);

	inline function set_directionalCount(value:Int):Int { this.setI32(24, value); return value; }
	public var hemisphereCount(get, set):Int;

	inline function get_hemisphereCount():Int return this.getI32(32);

	inline function set_hemisphereCount(value:Int):Int { this.setI32(32, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(40);

	inline function set_pointCount(value:Int):Int { this.setI32(40, value); return value; }
	public var spotCount(get, set):Int;

	inline function get_spotCount():Int return this.getI32(48);

	inline function set_spotCount(value:Int):Int { this.setI32(48, value); return value; }
	public var version(get, set):Int;

	inline function get_version():Int return this.getI32(56);

	inline function set_version(value:Int):Int { this.setI32(56, value); return value; }
}
