package flight._cpp;

private extern class PowerStatus_Ffi {
	@:native("flight_get_power_status_battery_level") static function get_batteryLevel(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_status_battery_level") static function set_batteryLevel(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_power_status_charging_time") static function get_chargingTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_status_charging_time") static function set_chargingTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_power_status_discharging_time") static function get_dischargingTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_power_status_discharging_time") static function set_dischargingTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_power_status_is_battery_low") static function get_isBatteryLow(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_power_status_is_battery_low") static function set_isBatteryLow(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_power_status_is_charging") static function get_isCharging(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_power_status_is_charging") static function set_isCharging(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_power_status_is_low_power") static function get_isLowPower(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_power_status_is_low_power") static function set_isLowPower(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_power_status_is_on_battery") static function get_isOnBattery(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_power_status_is_on_battery") static function set_isOnBattery(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract PowerStatus(cpp.Star<cpp.Void>) {
	public var batteryLevel(get, set):Single;

	inline function get_batteryLevel():Single return PowerStatus_Ffi.get_batteryLevel(this);

	inline function set_batteryLevel(value:Single):Single { PowerStatus_Ffi.set_batteryLevel(this, value); return value; }
	public var chargingTime(get, set):Single;

	inline function get_chargingTime():Single return PowerStatus_Ffi.get_chargingTime(this);

	inline function set_chargingTime(value:Single):Single { PowerStatus_Ffi.set_chargingTime(this, value); return value; }
	public var dischargingTime(get, set):Single;

	inline function get_dischargingTime():Single return PowerStatus_Ffi.get_dischargingTime(this);

	inline function set_dischargingTime(value:Single):Single { PowerStatus_Ffi.set_dischargingTime(this, value); return value; }
	public var isBatteryLow(get, set):Bool;

	inline function get_isBatteryLow():Bool return PowerStatus_Ffi.get_isBatteryLow(this);

	inline function set_isBatteryLow(value:Bool):Bool { PowerStatus_Ffi.set_isBatteryLow(this, value); return value; }
	public var isCharging(get, set):Bool;

	inline function get_isCharging():Bool return PowerStatus_Ffi.get_isCharging(this);

	inline function set_isCharging(value:Bool):Bool { PowerStatus_Ffi.set_isCharging(this, value); return value; }
	public var isLowPower(get, set):Bool;

	inline function get_isLowPower():Bool return PowerStatus_Ffi.get_isLowPower(this);

	inline function set_isLowPower(value:Bool):Bool { PowerStatus_Ffi.set_isLowPower(this, value); return value; }
	public var isOnBattery(get, set):Bool;

	inline function get_isOnBattery():Bool return PowerStatus_Ffi.get_isOnBattery(this);

	inline function set_isOnBattery(value:Bool):Bool { PowerStatus_Ffi.set_isOnBattery(this, value); return value; }
}
