package flight._js;

abstract PowerBatteryHealth(Dynamic) {
	public var capacityWearLevel(get, set):Float;
	inline function get_capacityWearLevel():Float return untyped this.capacityWearLevel;
	inline function set_capacityWearLevel(value:Float):Float return untyped this.capacityWearLevel = value;
	public var cycleCount(get, set):Int;
	inline function get_cycleCount():Int return untyped this.cycleCount;
	inline function set_cycleCount(value:Int):Int return untyped this.cycleCount = value;
	public var temperatureCelsius(get, set):Float;
	inline function get_temperatureCelsius():Float return untyped this.temperatureCelsius;
	inline function set_temperatureCelsius(value:Float):Float return untyped this.temperatureCelsius = value;
	public var voltage(get, set):Float;
	inline function get_voltage():Float return untyped this.voltage;
	inline function set_voltage(value:Float):Float return untyped this.voltage = value;
}
