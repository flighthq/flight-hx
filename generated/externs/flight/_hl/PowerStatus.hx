package flight._hl;

abstract PowerStatus(hl.Bytes) {
	public var batteryLevel(get, set):Single;

	inline function get_batteryLevel():Single return this.getF32(4);

	inline function set_batteryLevel(value:Single):Single { this.setF32(4, value); return value; }
	public var chargingTime(get, set):Single;

	inline function get_chargingTime():Single return this.getF32(8);

	inline function set_chargingTime(value:Single):Single { this.setF32(8, value); return value; }
	public var dischargingTime(get, set):Single;

	inline function get_dischargingTime():Single return this.getF32(12);

	inline function set_dischargingTime(value:Single):Single { this.setF32(12, value); return value; }
	public var isBatteryLow(get, set):Bool;

	inline function get_isBatteryLow():Bool return this.getUI8(16) != 0;

	inline function set_isBatteryLow(value:Bool):Bool { this.setUI8(16, value ? 1 : 0); return value; }
	public var isCharging(get, set):Bool;

	inline function get_isCharging():Bool return this.getUI8(17) != 0;

	inline function set_isCharging(value:Bool):Bool { this.setUI8(17, value ? 1 : 0); return value; }
	public var isLowPower(get, set):Bool;

	inline function get_isLowPower():Bool return this.getUI8(18) != 0;

	inline function set_isLowPower(value:Bool):Bool { this.setUI8(18, value ? 1 : 0); return value; }
	public var isOnBattery(get, set):Bool;

	inline function get_isOnBattery():Bool return this.getUI8(19) != 0;

	inline function set_isOnBattery(value:Bool):Bool { this.setUI8(19, value ? 1 : 0); return value; }
}
