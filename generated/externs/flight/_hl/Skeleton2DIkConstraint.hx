package flight._hl;

abstract Skeleton2DIkConstraint(hl.Bytes) {
	public var bendPositive(get, set):Bool;

	inline function get_bendPositive():Bool return this.getUI8(16) != 0;

	inline function set_bendPositive(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var compress(get, set):Bool;

	inline function get_compress():Bool return this.getUI8(48) != 0;

	inline function set_compress(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var mix(get, set):Single;

	inline function get_mix():Single return this.getF32(80);

	inline function set_mix(value:Single):Single { this.setF32(80, value); return value; }
	public var stretch(get, set):Bool;

	inline function get_stretch():Bool return this.getUI8(84) != 0;

	inline function set_stretch(value:Bool):Bool { this.setUI8(84, value ? 1 : 0); return value; }
	public var targetBoneIndex(get, set):Int;

	inline function get_targetBoneIndex():Int return this.getI32(88);

	inline function set_targetBoneIndex(value:Int):Int { this.setI32(88, value); return value; }
}
