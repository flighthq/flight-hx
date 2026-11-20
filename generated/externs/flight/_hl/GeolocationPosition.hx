package flight._hl;

abstract GeolocationPosition(hl.Bytes) {
	public var latitude(get, set):Single;

	inline function get_latitude():Single return this.getF32(24);

	inline function set_latitude(value:Single):Single { this.setF32(24, value); return value; }
	public var longitude(get, set):Single;

	inline function get_longitude():Single return this.getF32(28);

	inline function set_longitude(value:Single):Single { this.setF32(28, value); return value; }
	public var accuracy(get, set):Single;

	inline function get_accuracy():Single return this.getF32(32);

	inline function set_accuracy(value:Single):Single { this.setF32(32, value); return value; }
	public var altitude(get, set):Single;

	inline function get_altitude():Single return this.getF32(36);

	inline function set_altitude(value:Single):Single { this.setF32(36, value); return value; }
	public var altitudeAccuracy(get, set):Single;

	inline function get_altitudeAccuracy():Single return this.getF32(40);

	inline function set_altitudeAccuracy(value:Single):Single { this.setF32(40, value); return value; }
	public var floorLevel(get, set):Single;

	inline function get_floorLevel():Single return this.getF32(44);

	inline function set_floorLevel(value:Single):Single { this.setF32(44, value); return value; }
	public var heading(get, set):Single;

	inline function get_heading():Single return this.getF32(48);

	inline function set_heading(value:Single):Single { this.setF32(48, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return this.getF32(52);

	inline function set_speed(value:Single):Single { this.setF32(52, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return this.getF64(16);

	inline function set_timestamp(value:Float):Float { this.setF64(16, value); return value; }
}
