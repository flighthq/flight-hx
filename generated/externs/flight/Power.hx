package flight;

#if hl

typedef Power = flight._hl.Power;

#elseif cpp

typedef Power = flight._cpp.Power;

#elseif (js && flight_esm)

typedef Power = flight._js.Power;

#elseif js

#error "flight.Power on js requires flight_esm."

#else

#error "flight.Power: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createPower():Power {
	return flight._js._fn.Power.createPower();
}
#else
extern inline function createPower():Power {
#if hl
	return flight._hl._fn.Power.createPower();
#elseif cpp
	return flight._cpp._fn.Power.createPower();
#elseif (js && flight_esm)
	return flight._js._fn.Power.createPower();
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function acquirePowerKeepAwake(hostPowerKeepAwake:HostPowerKeepAwakeCapability, mode:Null<Dynamic>):PowerKeepAwakeAcquireFuture {
	return flight._js._fn.Power.acquirePowerKeepAwake(hostPowerKeepAwake, mode);
}
#else
extern inline function acquirePowerKeepAwake(hostPowerKeepAwake:HostPowerKeepAwakeCapability, mode:Int):PowerKeepAwakeAcquireFuture {
#if hl
	return flight._hl._fn.Power.acquirePowerKeepAwake(hostPowerKeepAwake, mode);
#elseif cpp
	return flight._cpp._fn.Power.acquirePowerKeepAwake(hostPowerKeepAwake, mode);
#elseif (js && flight_esm)
	return flight._js._fn.Power.acquirePowerKeepAwake(hostPowerKeepAwake, mode);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachPower(hostPowerStatus:Null<HostPowerStatusCapability>, hostPowerChange:Null<HostPowerChangeCapability>, hostPowerSessionLock:Null<HostPowerSessionLockCapability>, hostPowerSuspension:Null<HostPowerSuspensionCapability>, hostPowerThermal:Null<HostPowerThermalCapability>, hostPowerIdle:Null<HostPowerIdleCapability>, power:Power, idleThresholdSeconds:Null<Float>):Void {
	flight._js._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, power, idleThresholdSeconds);
}
#else
extern inline function attachPower(hostPowerStatus:HostPowerStatusCapability, hostPowerChange:HostPowerChangeCapability, hostPowerSessionLock:HostPowerSessionLockCapability, hostPowerSuspension:HostPowerSuspensionCapability, hostPowerThermal:HostPowerThermalCapability, hostPowerIdle:HostPowerIdleCapability, power:Power, idleThresholdSeconds:Float):Void {
#if hl
	flight._hl._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, power, idleThresholdSeconds);
#elseif cpp
	flight._cpp._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, power, idleThresholdSeconds);
#elseif (js && flight_esm)
	flight._js._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, power, idleThresholdSeconds);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyPowerKeepAwake(hostPowerKeepAwake:Dynamic, context:PowerContext):Void {
	flight._js._fn.Power.destroyPowerKeepAwake(hostPowerKeepAwake, context);
}
#else
extern inline function destroyPowerKeepAwake(hostPowerKeepAwake:Dynamic, hostPowerKeepAwakeLen:Int, context:PowerContext):Void {
#if hl
	flight._hl._fn.Power.destroyPowerKeepAwake(hostPowerKeepAwake, hostPowerKeepAwakeLen, context);
#elseif cpp
	flight._cpp._fn.Power.destroyPowerKeepAwake(hostPowerKeepAwake, hostPowerKeepAwakeLen, context);
#elseif (js && flight_esm)
	flight._js._fn.Power.destroyPowerKeepAwake(hostPowerKeepAwake, hostPowerKeepAwakeLen, context);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachPower(power:Power):Void {
	flight._js._fn.Power.detachPower(power);
}
#else
extern inline function detachPower(power:Power):Void {
#if hl
	flight._hl._fn.Power.detachPower(power);
#elseif cpp
	flight._cpp._fn.Power.detachPower(power);
#elseif (js && flight_esm)
	flight._js._fn.Power.detachPower(power);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposePower(power:Power):Void {
	flight._js._fn.Power.disposePower(power);
}
#else
extern inline function disposePower(power:Power):Void {
#if hl
	flight._hl._fn.Power.disposePower(power);
#elseif cpp
	flight._cpp._fn.Power.disposePower(power);
#elseif (js && flight_esm)
	flight._js._fn.Power.disposePower(power);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enablePowerSignals(power:Power):Void {
	flight._js._fn.Power.enablePowerSignals(power);
}
#else
extern inline function enablePowerSignals(power:Power):Void {
#if hl
	flight._hl._fn.Power.enablePowerSignals(power);
#elseif cpp
	flight._cpp._fn.Power.enablePowerSignals(power);
#elseif (js && flight_esm)
	flight._js._fn.Power.enablePowerSignals(power);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerBatteryHealth(hostPowerBatteryHealth:HostPowerBatteryHealthCapability, out:PowerBatteryHealth):PowerBatteryHealth {
	return flight._js._fn.Power.getPowerBatteryHealth(hostPowerBatteryHealth, out);
}
#else
extern inline function getPowerBatteryHealth(hostPowerBatteryHealth:HostPowerBatteryHealthCapability, out:PowerBatteryHealth):PowerBatteryHealth {
#if hl
	return flight._hl._fn.Power.getPowerBatteryHealth(hostPowerBatteryHealth, out);
#elseif cpp
	return flight._cpp._fn.Power.getPowerBatteryHealth(hostPowerBatteryHealth, out);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerBatteryHealth(hostPowerBatteryHealth, out);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerIdlePollingIntervalMs(context:PowerContext):Float {
	return flight._js._fn.Power.getPowerIdlePollingIntervalMs(context);
}
#else
extern inline function getPowerIdlePollingIntervalMs(context:PowerContext):Float {
#if hl
	return flight._hl._fn.Power.getPowerIdlePollingIntervalMs(context);
#elseif cpp
	return flight._cpp._fn.Power.getPowerIdlePollingIntervalMs(context);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerIdlePollingIntervalMs(context);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerStatus(hostPowerStatus:HostPowerStatusCapability, out:PowerStatus):PowerStatus {
	return flight._js._fn.Power.getPowerStatus(hostPowerStatus, out);
}
#else
extern inline function getPowerStatus(hostPowerStatus:HostPowerStatusCapability, out:PowerStatus):PowerStatus {
#if hl
	return flight._hl._fn.Power.getPowerStatus(hostPowerStatus, out);
#elseif cpp
	return flight._cpp._fn.Power.getPowerStatus(hostPowerStatus, out);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerStatus(hostPowerStatus, out);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerSystemIdleState(hostPowerIdle:HostPowerIdleCapability, thresholdSeconds:Float):Dynamic {
	return flight._js._fn.Power.getPowerSystemIdleState(hostPowerIdle, thresholdSeconds);
}
#else
extern inline function getPowerSystemIdleState(hostPowerIdle:HostPowerIdleCapability, thresholdSeconds:Float):flight.PowerIdleState {
#if hl
	return flight._hl._fn.Power.getPowerSystemIdleState(hostPowerIdle, thresholdSeconds);
#elseif cpp
	return flight._cpp._fn.Power.getPowerSystemIdleState(hostPowerIdle, thresholdSeconds);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerSystemIdleState(hostPowerIdle, thresholdSeconds);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerSystemIdleTime(hostPowerIdle:HostPowerIdleCapability):Float {
	return flight._js._fn.Power.getPowerSystemIdleTime(hostPowerIdle);
}
#else
extern inline function getPowerSystemIdleTime(hostPowerIdle:HostPowerIdleCapability):Float {
#if hl
	return flight._hl._fn.Power.getPowerSystemIdleTime(hostPowerIdle);
#elseif cpp
	return flight._cpp._fn.Power.getPowerSystemIdleTime(hostPowerIdle);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerSystemIdleTime(hostPowerIdle);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPowerThermalState(hostPowerThermal:HostPowerThermalCapability):Dynamic {
	return flight._js._fn.Power.getPowerThermalState(hostPowerThermal);
}
#else
extern inline function getPowerThermalState(hostPowerThermal:HostPowerThermalCapability):flight.PowerThermalState {
#if hl
	return flight._hl._fn.Power.getPowerThermalState(hostPowerThermal);
#elseif cpp
	return flight._cpp._fn.Power.getPowerThermalState(hostPowerThermal);
#elseif (js && flight_esm)
	return flight._js._fn.Power.getPowerThermalState(hostPowerThermal);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPowerKeepAwakeActive(hostPowerKeepAwake:HostPowerKeepAwakeCapability):Bool {
	return flight._js._fn.Power.isPowerKeepAwakeActive(hostPowerKeepAwake);
}
#else
extern inline function isPowerKeepAwakeActive(hostPowerKeepAwake:HostPowerKeepAwakeCapability):Bool {
#if hl
	return flight._hl._fn.Power.isPowerKeepAwakeActive(hostPowerKeepAwake);
#elseif cpp
	return flight._cpp._fn.Power.isPowerKeepAwakeActive(hostPowerKeepAwake);
#elseif (js && flight_esm)
	return flight._js._fn.Power.isPowerKeepAwakeActive(hostPowerKeepAwake);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function makePowerBatteryHealth():PowerBatteryHealth {
	return flight._js._fn.Power.makePowerBatteryHealth();
}
#else
extern inline function makePowerBatteryHealth():PowerBatteryHealth {
#if hl
	return flight._hl._fn.Power.makePowerBatteryHealth();
#elseif cpp
	return flight._cpp._fn.Power.makePowerBatteryHealth();
#elseif (js && flight_esm)
	return flight._js._fn.Power.makePowerBatteryHealth();
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function makePowerStatus():PowerStatus {
	return flight._js._fn.Power.makePowerStatus();
}
#else
extern inline function makePowerStatus():PowerStatus {
#if hl
	return flight._hl._fn.Power.makePowerStatus();
#elseif cpp
	return flight._cpp._fn.Power.makePowerStatus();
#elseif (js && flight_esm)
	return flight._js._fn.Power.makePowerStatus();
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function releasePowerKeepAwake(hostPowerKeepAwake:HostPowerKeepAwakeCapability):PowerKeepAwakeReleaseFuture {
	return flight._js._fn.Power.releasePowerKeepAwake(hostPowerKeepAwake);
}
#else
extern inline function releasePowerKeepAwake(hostPowerKeepAwake:HostPowerKeepAwakeCapability):PowerKeepAwakeReleaseFuture {
#if hl
	return flight._hl._fn.Power.releasePowerKeepAwake(hostPowerKeepAwake);
#elseif cpp
	return flight._cpp._fn.Power.releasePowerKeepAwake(hostPowerKeepAwake);
#elseif (js && flight_esm)
	return flight._js._fn.Power.releasePowerKeepAwake(hostPowerKeepAwake);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPowerIdlePollingIntervalMs(context:PowerContext, intervalMs:Float):Void {
	flight._js._fn.Power.setPowerIdlePollingIntervalMs(context, intervalMs);
}
#else
extern inline function setPowerIdlePollingIntervalMs(context:PowerContext, intervalMs:Float):Void {
#if hl
	flight._hl._fn.Power.setPowerIdlePollingIntervalMs(context, intervalMs);
#elseif cpp
	flight._cpp._fn.Power.setPowerIdlePollingIntervalMs(context, intervalMs);
#elseif (js && flight_esm)
	flight._js._fn.Power.setPowerIdlePollingIntervalMs(context, intervalMs);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePower(ptr:Power):Void {
	flight._js._fn.Power.freePower(ptr);
}
#else
extern inline function freePower(ptr:Power):Void {
#if hl
	flight._hl._fn.Power.freePower(ptr);
#elseif cpp
	flight._cpp._fn.Power.freePower(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Power.freePower(ptr);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePowerKeepAwakeAcquireFuture(ptr:PowerKeepAwakeAcquireFuture):Void {
	flight._js._fn.Power.freePowerKeepAwakeAcquireFuture(ptr);
}
#else
extern inline function freePowerKeepAwakeAcquireFuture(ptr:PowerKeepAwakeAcquireFuture):Void {
#if hl
	flight._hl._fn.Power.freePowerKeepAwakeAcquireFuture(ptr);
#elseif cpp
	flight._cpp._fn.Power.freePowerKeepAwakeAcquireFuture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Power.freePowerKeepAwakeAcquireFuture(ptr);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePowerBatteryHealth(ptr:PowerBatteryHealth):Void {
	flight._js._fn.Power.freePowerBatteryHealth(ptr);
}
#else
extern inline function freePowerBatteryHealth(ptr:PowerBatteryHealth):Void {
#if hl
	flight._hl._fn.Power.freePowerBatteryHealth(ptr);
#elseif cpp
	flight._cpp._fn.Power.freePowerBatteryHealth(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Power.freePowerBatteryHealth(ptr);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePowerStatus(ptr:PowerStatus):Void {
	flight._js._fn.Power.freePowerStatus(ptr);
}
#else
extern inline function freePowerStatus(ptr:PowerStatus):Void {
#if hl
	flight._hl._fn.Power.freePowerStatus(ptr);
#elseif cpp
	flight._cpp._fn.Power.freePowerStatus(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Power.freePowerStatus(ptr);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePowerKeepAwakeReleaseFuture(ptr:PowerKeepAwakeReleaseFuture):Void {
	flight._js._fn.Power.freePowerKeepAwakeReleaseFuture(ptr);
}
#else
extern inline function freePowerKeepAwakeReleaseFuture(ptr:PowerKeepAwakeReleaseFuture):Void {
#if hl
	flight._hl._fn.Power.freePowerKeepAwakeReleaseFuture(ptr);
#elseif cpp
	flight._cpp._fn.Power.freePowerKeepAwakeReleaseFuture(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Power.freePowerKeepAwakeReleaseFuture(ptr);
#else
	#error "flight.Power: no backend for this target."
#end
}
#end
