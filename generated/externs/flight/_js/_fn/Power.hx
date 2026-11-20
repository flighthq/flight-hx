package flight._js._fn;

@:jsRequire("@flighthq/power")
extern class Power {
	@:native("createPower")
	public static function createPower():flight._js.Power;
	@:native("acquirePowerKeepAwake")
	public static function acquirePowerKeepAwake(hostPowerKeepAwake:flight._js.HostPowerKeepAwakeCapability, mode:Null<Dynamic>):flight._js.PowerKeepAwakeAcquireFuture;
	@:native("attachPower")
	public static function attachPower(hostPowerStatus:Null<flight._js.HostPowerStatusCapability>, hostPowerChange:Null<flight._js.HostPowerChangeCapability>, hostPowerSessionLock:Null<flight._js.HostPowerSessionLockCapability>, hostPowerSuspension:Null<flight._js.HostPowerSuspensionCapability>, hostPowerThermal:Null<flight._js.HostPowerThermalCapability>, hostPowerIdle:Null<flight._js.HostPowerIdleCapability>, power:flight._js.Power, idleThresholdSeconds:Null<Float>):Void;
	@:native("destroyPowerKeepAwake")
	public static function destroyPowerKeepAwake(hostPowerKeepAwake:Dynamic, context:flight._js.PowerContext):Void;
	@:native("detachPower")
	public static function detachPower(power:flight._js.Power):Void;
	@:native("disposePower")
	public static function disposePower(power:flight._js.Power):Void;
	@:native("enablePowerSignals")
	public static function enablePowerSignals(power:flight._js.Power):Void;
	@:native("getPowerBatteryHealth")
	public static function getPowerBatteryHealth(hostPowerBatteryHealth:flight._js.HostPowerBatteryHealthCapability, out:flight._js.PowerBatteryHealth):flight._js.PowerBatteryHealth;
	@:native("getPowerIdlePollingIntervalMs")
	public static function getPowerIdlePollingIntervalMs(context:flight._js.PowerContext):Float;
	@:native("getPowerStatus")
	public static function getPowerStatus(hostPowerStatus:flight._js.HostPowerStatusCapability, out:flight._js.PowerStatus):flight._js.PowerStatus;
	@:native("getPowerSystemIdleState")
	public static function getPowerSystemIdleState(hostPowerIdle:flight._js.HostPowerIdleCapability, thresholdSeconds:Float):Dynamic;
	@:native("getPowerSystemIdleTime")
	public static function getPowerSystemIdleTime(hostPowerIdle:flight._js.HostPowerIdleCapability):Float;
	@:native("getPowerThermalState")
	public static function getPowerThermalState(hostPowerThermal:flight._js.HostPowerThermalCapability):Dynamic;
	@:native("isPowerKeepAwakeActive")
	public static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight._js.HostPowerKeepAwakeCapability):Bool;
	@:native("makePowerBatteryHealth")
	public static function makePowerBatteryHealth():flight._js.PowerBatteryHealth;
	@:native("makePowerStatus")
	public static function makePowerStatus():flight._js.PowerStatus;
	@:native("releasePowerKeepAwake")
	public static function releasePowerKeepAwake(hostPowerKeepAwake:flight._js.HostPowerKeepAwakeCapability):flight._js.PowerKeepAwakeReleaseFuture;
	@:native("setPowerIdlePollingIntervalMs")
	public static function setPowerIdlePollingIntervalMs(context:flight._js.PowerContext, intervalMs:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePower(ptr:flight._js.Power):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePowerKeepAwakeAcquireFuture(ptr:flight._js.PowerKeepAwakeAcquireFuture):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePowerBatteryHealth(ptr:flight._js.PowerBatteryHealth):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePowerStatus(ptr:flight._js.PowerStatus):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePowerKeepAwakeReleaseFuture(ptr:flight._js.PowerKeepAwakeReleaseFuture):Void {}
}
