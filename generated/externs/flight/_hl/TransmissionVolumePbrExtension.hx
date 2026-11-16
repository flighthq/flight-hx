package flight._hl;

abstract TransmissionVolumePbrExtension(hl.Bytes) {
	public var attenuationColor(get, set):Int;

	inline function get_attenuationColor():Int return this.getI32(56);

	inline function set_attenuationColor(value:Int):Int { this.setI32(56, value); return value; }
	public var attenuationDistance(get, set):Single;

	inline function get_attenuationDistance():Single return this.getF32(60);

	inline function set_attenuationDistance(value:Single):Single { this.setF32(60, value); return value; }
	public var ior(get, set):Single;

	inline function get_ior():Single return this.getF32(64);

	inline function set_ior(value:Single):Single { this.setF32(64, value); return value; }
	public var thickness(get, set):Single;

	inline function get_thickness():Single return this.getF32(68);

	inline function set_thickness(value:Single):Single { this.setF32(68, value); return value; }
	public var transmission(get, set):Single;

	inline function get_transmission():Single return this.getF32(76);

	inline function set_transmission(value:Single):Single { this.setF32(76, value); return value; }
}
