package flight._cpp._fn;

extern class Power {
	@:native("flight_create_power")
	public static function createPower():flight._cpp.Power;
	@:native("flight_acquire_power_keep_awake")
	public static function acquirePowerKeepAwake(hostPowerKeepAwake:flight._cpp.HostPowerKeepAwakeCapability, mode:Int):flight._cpp.PowerKeepAwakeAcquireFuture;
	@:native("flight_attach_power")
	public static function attachPower(hostPowerStatus:flight._cpp.HostPowerStatusCapability, hostPowerChange:flight._cpp.HostPowerChangeCapability, hostPowerSessionLock:flight._cpp.HostPowerSessionLockCapability, hostPowerSuspension:flight._cpp.HostPowerSuspensionCapability, hostPowerThermal:flight._cpp.HostPowerThermalCapability, hostPowerIdle:flight._cpp.HostPowerIdleCapability, power:flight._cpp.Power, idleThresholdSeconds:Single):Void;
	@:native("flight_destroy_power_keep_awake")
	public static function destroyPowerKeepAwake(hostPowerKeepAwake:cpp.Star<cpp.Void>, hostPowerKeepAwakeLen:Int, context:flight._cpp.PowerContext):Void;
	@:native("flight_detach_power")
	public static function detachPower(power:flight._cpp.Power):Void;
	@:native("flight_dispose_power")
	public static function disposePower(power:flight._cpp.Power):Void;
	@:native("flight_enable_power_signals")
	public static function enablePowerSignals(power:flight._cpp.Power):Void;
	@:native("flight_get_power_battery_health")
	public static function getPowerBatteryHealth(hostPowerBatteryHealth:flight._cpp.HostPowerBatteryHealthCapability, out:flight._cpp.PowerBatteryHealth):flight._cpp.PowerBatteryHealth;
	@:native("flight_get_power_idle_polling_interval_ms")
	public static function getPowerIdlePollingIntervalMs(context:flight._cpp.PowerContext):Single;
	@:native("flight_get_power_status")
	public static function getPowerStatus(hostPowerStatus:flight._cpp.HostPowerStatusCapability, out:flight._cpp.PowerStatus):flight._cpp.PowerStatus;
	@:native("flight_get_power_system_idle_state")
	public static function getPowerSystemIdleState(hostPowerIdle:flight._cpp.HostPowerIdleCapability, thresholdSeconds:Single):Int;
	@:native("flight_get_power_system_idle_time")
	public static function getPowerSystemIdleTime(hostPowerIdle:flight._cpp.HostPowerIdleCapability):Single;
	@:native("flight_get_power_thermal_state")
	public static function getPowerThermalState(hostPowerThermal:flight._cpp.HostPowerThermalCapability):Int;
	@:native("flight_is_power_keep_awake_active")
	public static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight._cpp.HostPowerKeepAwakeCapability):Bool;
	@:native("flight_make_power_battery_health")
	public static function makePowerBatteryHealth():flight._cpp.PowerBatteryHealth;
	@:native("flight_make_power_status")
	public static function makePowerStatus():flight._cpp.PowerStatus;
	@:native("flight_release_power_keep_awake")
	public static function releasePowerKeepAwake(hostPowerKeepAwake:flight._cpp.HostPowerKeepAwakeCapability):flight._cpp.PowerKeepAwakeReleaseFuture;
	@:native("flight_set_power_idle_polling_interval_ms")
	public static function setPowerIdlePollingIntervalMs(context:flight._cpp.PowerContext, intervalMs:Single):Void;
	@:native("flight_free_power")
	public static function freePower(ptr:flight._cpp.Power):Void;
	@:native("flight_free_power_keep_awake_acquire_future")
	public static function freePowerKeepAwakeAcquireFuture(ptr:flight._cpp.PowerKeepAwakeAcquireFuture):Void;
	@:native("flight_free_power_battery_health")
	public static function freePowerBatteryHealth(ptr:flight._cpp.PowerBatteryHealth):Void;
	@:native("flight_free_power_status")
	public static function freePowerStatus(ptr:flight._cpp.PowerStatus):Void;
	@:native("flight_free_power_keep_awake_release_future")
	public static function freePowerKeepAwakeReleaseFuture(ptr:flight._cpp.PowerKeepAwakeReleaseFuture):Void;
}
