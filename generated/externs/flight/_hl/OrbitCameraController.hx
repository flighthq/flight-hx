package flight._hl;

abstract OrbitCameraController(hl.Bytes) {
	public var azimuth(get, set):Single;

	inline function get_azimuth():Single return this.getF32(16);

	inline function set_azimuth(value:Single):Single { this.setF32(16, value); return value; }
	public var distance(get, set):Single;

	inline function get_distance():Single return this.getF32(20);

	inline function set_distance(value:Single):Single { this.setF32(20, value); return value; }
	public var goalAzimuth(get, set):Single;

	inline function get_goalAzimuth():Single return this.getF32(24);

	inline function set_goalAzimuth(value:Single):Single { this.setF32(24, value); return value; }
	public var goalDistance(get, set):Single;

	inline function get_goalDistance():Single return this.getF32(28);

	inline function set_goalDistance(value:Single):Single { this.setF32(28, value); return value; }
	public var goalPolar(get, set):Single;

	inline function get_goalPolar():Single return this.getF32(32);

	inline function set_goalPolar(value:Single):Single { this.setF32(32, value); return value; }
	public var maxDistance(get, set):Single;

	inline function get_maxDistance():Single return this.getF32(36);

	inline function set_maxDistance(value:Single):Single { this.setF32(36, value); return value; }
	public var maxPolar(get, set):Single;

	inline function get_maxPolar():Single return this.getF32(40);

	inline function set_maxPolar(value:Single):Single { this.setF32(40, value); return value; }
	public var minDistance(get, set):Single;

	inline function get_minDistance():Single return this.getF32(44);

	inline function set_minDistance(value:Single):Single { this.setF32(44, value); return value; }
	public var minPolar(get, set):Single;

	inline function get_minPolar():Single return this.getF32(48);

	inline function set_minPolar(value:Single):Single { this.setF32(48, value); return value; }
	public var polar(get, set):Single;

	inline function get_polar():Single return this.getF32(52);

	inline function set_polar(value:Single):Single { this.setF32(52, value); return value; }
	public var smoothTime(get, set):Single;

	inline function get_smoothTime():Single return this.getF32(56);

	inline function set_smoothTime(value:Single):Single { this.setF32(56, value); return value; }
}
