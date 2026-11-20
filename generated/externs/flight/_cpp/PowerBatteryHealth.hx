package flight._cpp;

private extern class PowerBatteryHealth_Ffi {
	@:native("flight_get_power_battery_health_capacity_wear_level") static function get_capacityWearLevel(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_battery_health_capacity_wear_level") static function set_capacityWearLevel(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_power_battery_health_cycle_count") static function get_cycleCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_power_battery_health_cycle_count") static function set_cycleCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_power_battery_health_temperature_celsius") static function get_temperatureCelsius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_battery_health_temperature_celsius") static function set_temperatureCelsius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_power_battery_health_voltage") static function get_voltage(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_battery_health_voltage") static function set_voltage(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract PowerBatteryHealth(cpp.Star<cpp.Void>) {
	public var capacityWearLevel(get, set):Single;

	inline function get_capacityWearLevel():Single return PowerBatteryHealth_Ffi.get_capacityWearLevel(this);

	inline function set_capacityWearLevel(value:Single):Single { PowerBatteryHealth_Ffi.set_capacityWearLevel(this, value); return value; }
	public var cycleCount(get, set):Int;

	inline function get_cycleCount():Int return PowerBatteryHealth_Ffi.get_cycleCount(this);

	inline function set_cycleCount(value:Int):Int { PowerBatteryHealth_Ffi.set_cycleCount(this, value); return value; }
	public var temperatureCelsius(get, set):Single;

	inline function get_temperatureCelsius():Single return PowerBatteryHealth_Ffi.get_temperatureCelsius(this);

	inline function set_temperatureCelsius(value:Single):Single { PowerBatteryHealth_Ffi.set_temperatureCelsius(this, value); return value; }
	public var voltage(get, set):Single;

	inline function get_voltage():Single return PowerBatteryHealth_Ffi.get_voltage(this);

	inline function set_voltage(value:Single):Single { PowerBatteryHealth_Ffi.set_voltage(this, value); return value; }
}
