package flight._hl._fn;

extern class Power {
	@:hlNative("flight", "flight_create_power")
	public static function createPower():flight._hl.Power;
	@:hlNative("flight", "flight_acquire_power_keep_awake")
	public static function acquirePowerKeepAwake(hostPowerKeepAwake:flight._hl.HostPowerKeepAwakeCapability, mode:Int):flight._hl.PowerKeepAwakeAcquireFuture;
	@:hlNative("flight", "flight_attach_power")
	public static function attachPower(hostPowerStatus:flight._hl.HostPowerStatusCapability, hostPowerChange:flight._hl.HostPowerChangeCapability, hostPowerSessionLock:flight._hl.HostPowerSessionLockCapability, hostPowerSuspension:flight._hl.HostPowerSuspensionCapability, hostPowerThermal:flight._hl.HostPowerThermalCapability, hostPowerIdle:flight._hl.HostPowerIdleCapability, power:flight._hl.Power, idleThresholdSeconds:Single):Void;
	@:hlNative("flight", "flight_destroy_power_keep_awake")
	public static function destroyPowerKeepAwake(hostPowerKeepAwake:hl.Bytes, hostPowerKeepAwakeLen:Int, context:flight._hl.PowerContext):Void;
	@:hlNative("flight", "flight_detach_power")
	public static function detachPower(power:flight._hl.Power):Void;
	@:hlNative("flight", "flight_dispose_power")
	public static function disposePower(power:flight._hl.Power):Void;
	@:hlNative("flight", "flight_enable_power_signals")
	public static function enablePowerSignals(power:flight._hl.Power):Void;
	@:hlNative("flight", "flight_get_power_battery_health")
	public static function getPowerBatteryHealth(hostPowerBatteryHealth:flight._hl.HostPowerBatteryHealthCapability, out:flight._hl.PowerBatteryHealth):flight._hl.PowerBatteryHealth;
	@:hlNative("flight", "flight_get_power_idle_polling_interval_ms")
	public static function getPowerIdlePollingIntervalMs(context:flight._hl.PowerContext):Single;
	@:hlNative("flight", "flight_get_power_status")
	public static function getPowerStatus(hostPowerStatus:flight._hl.HostPowerStatusCapability, out:flight._hl.PowerStatus):flight._hl.PowerStatus;
	@:hlNative("flight", "flight_get_power_system_idle_state")
	public static function getPowerSystemIdleState(hostPowerIdle:flight._hl.HostPowerIdleCapability, thresholdSeconds:Single):Int;
	@:hlNative("flight", "flight_get_power_system_idle_time")
	public static function getPowerSystemIdleTime(hostPowerIdle:flight._hl.HostPowerIdleCapability):Single;
	@:hlNative("flight", "flight_get_power_thermal_state")
	public static function getPowerThermalState(hostPowerThermal:flight._hl.HostPowerThermalCapability):Int;
	@:hlNative("flight", "flight_is_power_keep_awake_active")
	public static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight._hl.HostPowerKeepAwakeCapability):Bool;
	@:hlNative("flight", "flight_make_power_battery_health")
	public static function makePowerBatteryHealth():flight._hl.PowerBatteryHealth;
	@:hlNative("flight", "flight_make_power_status")
	public static function makePowerStatus():flight._hl.PowerStatus;
	@:hlNative("flight", "flight_release_power_keep_awake")
	public static function releasePowerKeepAwake(hostPowerKeepAwake:flight._hl.HostPowerKeepAwakeCapability):flight._hl.PowerKeepAwakeReleaseFuture;
	@:hlNative("flight", "flight_set_power_idle_polling_interval_ms")
	public static function setPowerIdlePollingIntervalMs(context:flight._hl.PowerContext, intervalMs:Single):Void;
	@:hlNative("flight", "flight_free_power")
	public static function freePower(ptr:flight._hl.Power):Void;
	@:hlNative("flight", "flight_free_power_keep_awake_acquire_future")
	public static function freePowerKeepAwakeAcquireFuture(ptr:flight._hl.PowerKeepAwakeAcquireFuture):Void;
	@:hlNative("flight", "flight_free_power_battery_health")
	public static function freePowerBatteryHealth(ptr:flight._hl.PowerBatteryHealth):Void;
	@:hlNative("flight", "flight_free_power_status")
	public static function freePowerStatus(ptr:flight._hl.PowerStatus):Void;
	@:hlNative("flight", "flight_free_power_keep_awake_release_future")
	public static function freePowerKeepAwakeReleaseFuture(ptr:flight._hl.PowerKeepAwakeReleaseFuture):Void;
}
