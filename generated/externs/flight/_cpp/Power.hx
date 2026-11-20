package flight._cpp;

abstract Power(cpp.Star<cpp.Void>) {
	static extern inline public function create():flight._cpp.Power {
		return flight._cpp._fn.Power.createPower();
	}
	extern inline public function attach(hostPowerStatus:flight._cpp.HostPowerStatusCapability, hostPowerChange:flight._cpp.HostPowerChangeCapability, hostPowerSessionLock:flight._cpp.HostPowerSessionLockCapability, hostPowerSuspension:flight._cpp.HostPowerSuspensionCapability, hostPowerThermal:flight._cpp.HostPowerThermalCapability, hostPowerIdle:flight._cpp.HostPowerIdleCapability, idleThresholdSeconds:Single):Void {
		flight._cpp._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, cast this, idleThresholdSeconds);
	}
	extern inline public function detach():Void {
		flight._cpp._fn.Power.detachPower(cast this);
	}
	extern inline public function dispose():Void {
		flight._cpp._fn.Power.disposePower(cast this);
	}
	extern inline public function enableSignals():Void {
		flight._cpp._fn.Power.enablePowerSignals(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Power.freePower(cast this);
	}
}
