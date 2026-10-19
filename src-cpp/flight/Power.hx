// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Power = flight._cpp.Power;

inline function getPowerIdlePollingIntervalMs():Float {
  return flight._cpp._fn.Power.getPowerIdlePollingIntervalMs();
}

inline function setPowerIdlePollingIntervalMs(intervalMs:Float):Void {
  flight._cpp._fn.Power.setPowerIdlePollingIntervalMs(intervalMs);
}

extern inline function createPower():flight.Power {
  return flight._cpp._fn.Power.createPower();
}

extern inline function detachPower(power:flight.Power):Void {
  flight._cpp._fn.Power.detachPower(power);
}

extern inline function disposePower(power:flight.Power):Void {
  flight._cpp._fn.Power.disposePower(power);
}

extern inline function enablePowerSignals(power:flight.Power):Void {
  flight._cpp._fn.Power.enablePowerSignals(power);
}

extern inline function makePowerBatteryHealth():flight.PowerBatteryHealth {
  return flight._cpp._fn.Power.makePowerBatteryHealth();
}

extern inline function makePowerStatus():flight.PowerStatus {
  return flight._cpp._fn.Power.makePowerStatus();
}

extern inline function acquirePowerKeepAwake(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability, ?mode:flight.PowerKeepAwakeMode):flight._internal._Promise<flight.PowerKeepAwakeAcquireResult> {
  return flight._cpp._attempt.Attempt_Power_acquirePowerKeepAwake.acquirePowerKeepAwake(hostPowerKeepAwake, mode);
}

extern inline function attachPower(hostPowerStatus:Null<flight.HostPowerStatusCapability>, hostPowerChange:Null<flight.HostPowerChangeCapability>, hostPowerSessionLock:Null<flight.HostPowerSessionLockCapability>, hostPowerSuspension:Null<flight.HostPowerSuspensionCapability>, hostPowerThermal:Null<flight.HostPowerThermalCapability>, hostPowerIdle:Null<flight.HostPowerIdleCapability>, power:flight.Power, ?idleThresholdSeconds:Float):Void {
  flight._cpp._attempt.Attempt_Power_attachPower.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, power, idleThresholdSeconds);
}

extern inline function destroyPowerKeepAwake(...hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):Void {
  flight._cpp._attempt.Attempt_Power_destroyPowerKeepAwake.destroyPowerKeepAwake(...hostPowerKeepAwake);
}

extern inline function getPowerBatteryHealth(hostPowerBatteryHealth:flight.HostPowerBatteryHealthCapability, out:flight.PowerBatteryHealth):flight.PowerBatteryHealth {
  return flight._cpp._attempt.Attempt_Power_getPowerBatteryHealth.getPowerBatteryHealth(hostPowerBatteryHealth, out);
}

extern inline function getPowerStatus(hostPowerStatus:flight.HostPowerStatusCapability, out:flight.PowerStatus):flight.PowerStatus {
  return flight._cpp._attempt.Attempt_Power_getPowerStatus.getPowerStatus(hostPowerStatus, out);
}

extern inline function getPowerSystemIdleState(hostPowerIdle:flight.HostPowerIdleCapability, thresholdSeconds:Float):flight.PowerIdleState {
  return flight._cpp._attempt.Attempt_Power_getPowerSystemIdleState.getPowerSystemIdleState(hostPowerIdle, thresholdSeconds);
}

extern inline function getPowerSystemIdleTime(hostPowerIdle:flight.HostPowerIdleCapability):Float {
  return flight._cpp._attempt.Attempt_Power_getPowerSystemIdleTime.getPowerSystemIdleTime(hostPowerIdle);
}

extern inline function getPowerThermalState(hostPowerThermal:flight.HostPowerThermalCapability):flight.PowerThermalState {
  return flight._cpp._attempt.Attempt_Power_getPowerThermalState.getPowerThermalState(hostPowerThermal);
}

extern inline function initializePower(out:flight.EntityConstruction<flight.Power>):Void {
  flight._cpp._attempt.Attempt_Power_initializePower.initializePower(out);
}

extern inline function isPowerKeepAwakeActive(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):Bool {
  return flight._cpp._attempt.Attempt_Power_isPowerKeepAwakeActive.isPowerKeepAwakeActive(hostPowerKeepAwake);
}

extern inline function releasePowerKeepAwake(hostPowerKeepAwake:flight.HostPowerKeepAwakeCapability):flight._internal._Promise<flight.PowerKeepAwakeReleaseResult> {
  return flight._cpp._attempt.Attempt_Power_releasePowerKeepAwake.releasePowerKeepAwake(hostPowerKeepAwake);
}
