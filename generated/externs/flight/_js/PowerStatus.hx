package flight._js;

abstract PowerStatus(Dynamic) {
	public var batteryLevel(get, set):Float;
	inline function get_batteryLevel():Float return untyped this.batteryLevel;
	inline function set_batteryLevel(value:Float):Float return untyped this.batteryLevel = value;
	public var chargingTime(get, set):Float;
	inline function get_chargingTime():Float return untyped this.chargingTime;
	inline function set_chargingTime(value:Float):Float return untyped this.chargingTime = value;
	public var dischargingTime(get, set):Float;
	inline function get_dischargingTime():Float return untyped this.dischargingTime;
	inline function set_dischargingTime(value:Float):Float return untyped this.dischargingTime = value;
	public var isBatteryLow(get, set):Bool;
	inline function get_isBatteryLow():Bool return untyped this.isBatteryLow;
	inline function set_isBatteryLow(value:Bool):Bool return untyped this.isBatteryLow = value;
	public var isCharging(get, set):Bool;
	inline function get_isCharging():Bool return untyped this.isCharging;
	inline function set_isCharging(value:Bool):Bool return untyped this.isCharging = value;
	public var isLowPower(get, set):Bool;
	inline function get_isLowPower():Bool return untyped this.isLowPower;
	inline function set_isLowPower(value:Bool):Bool return untyped this.isLowPower = value;
	public var isOnBattery(get, set):Bool;
	inline function get_isOnBattery():Bool return untyped this.isOnBattery;
	inline function set_isOnBattery(value:Bool):Bool return untyped this.isOnBattery = value;
}
