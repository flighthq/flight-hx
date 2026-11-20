package flight.esm.power;

#if (js && flight_esm)
@:jsRequire("@flighthq/power/contract")
extern class Contract {
  public static function acquirePowerKeepAwake(hostPowerKeepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability, ?mode:flight.esm.types.power.Types.PowerKeepAwakeMode):js.lib.Promise<flight.esm.types.power.Types.PowerKeepAwakeAcquireResult>;
  public static function attachPower(hostPowerStatus:Null<flight.esm.types.power.Types.HostPowerStatusCapability>, hostPowerChange:Null<flight.esm.types.power.Types.HostPowerChangeCapability>, hostPowerSessionLock:Null<flight.esm.types.power.Types.HostPowerSessionLockCapability>, hostPowerSuspension:Null<flight.esm.types.power.Types.HostPowerSuspensionCapability>, hostPowerThermal:Null<flight.esm.types.power.Types.HostPowerThermalCapability>, hostPowerIdle:Null<flight.esm.types.power.Types.HostPowerIdleCapability>, power:flight.esm.types.power.Types.Power, ?idleThresholdSeconds:Float):Void;
  public static function createPower():flight.esm.types.power.Types.Power;
  public static function destroyPowerKeepAwake(...hostPowerKeepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability):Void;
  public static function detachPower(power:flight.esm.types.power.Types.Power):Void;
  public static function disposePower(power:flight.esm.types.power.Types.Power):Void;
  public static function enablePowerSignals(power:flight.esm.types.power.Types.Power):Void;
  public static function getPowerBatteryHealth(hostPowerBatteryHealth:flight.esm.types.power.Types.HostPowerBatteryHealthCapability, out:flight.esm.types.power.Types.PowerBatteryHealth):flight.esm.types.power.Types.PowerBatteryHealth;
  public static function getPowerIdlePollingIntervalMs():Float;
  public static function getPowerStatus(hostPowerStatus:flight.esm.types.power.Types.HostPowerStatusCapability, out:flight.esm.types.power.Types.PowerStatus):flight.esm.types.power.Types.PowerStatus;
  public static function getPowerSystemIdleState(hostPowerIdle:flight.esm.types.power.Types.HostPowerIdleCapability, thresholdSeconds:Float):flight.esm.types.power.Types.PowerIdleState;
  public static function getPowerSystemIdleTime(hostPowerIdle:flight.esm.types.power.Types.HostPowerIdleCapability):Float;
  public static function getPowerThermalState(hostPowerThermal:flight.esm.types.power.Types.HostPowerThermalCapability):flight.esm.types.power.Types.PowerThermalState;
  public static function initializePower(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.power.Types.Power>):Void;
  public static function isPowerKeepAwakeActive(hostPowerKeepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability):Bool;
  public static function makePowerBatteryHealth():flight.esm.types.power.Types.PowerBatteryHealth;
  public static function makePowerStatus():flight.esm.types.power.Types.PowerStatus;
  public static function releasePowerKeepAwake(hostPowerKeepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability):js.lib.Promise<flight.esm.types.power.Types.PowerKeepAwakeReleaseResult>;
  public static function setPowerIdlePollingIntervalMs(intervalMs:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
