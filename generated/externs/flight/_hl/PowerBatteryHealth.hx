package flight._hl;

abstract PowerBatteryHealth(hl.Bytes) {
	public var capacityWearLevel(get, set):Single;

	inline function get_capacityWearLevel():Single return this.getF32(4);

	inline function set_capacityWearLevel(value:Single):Single { this.setF32(4, value); return value; }
	public var cycleCount(get, set):Int;

	inline function get_cycleCount():Int return this.getI32(8);

	inline function set_cycleCount(value:Int):Int { this.setI32(8, value); return value; }
	public var temperatureCelsius(get, set):Single;

	inline function get_temperatureCelsius():Single return this.getF32(12);

	inline function set_temperatureCelsius(value:Single):Single { this.setF32(12, value); return value; }
	public var voltage(get, set):Single;

	inline function get_voltage():Single return this.getF32(16);

	inline function set_voltage(value:Single):Single { this.setF32(16, value); return value; }
}
