package flight._js;

abstract Power(Dynamic) {
	static inline public function create():flight._js.Power {
		return flight._js._fn.Power.createPower();
	}
	inline public function attach(hostPowerStatus:Null<flight._js.HostPowerStatusCapability>, hostPowerChange:Null<flight._js.HostPowerChangeCapability>, hostPowerSessionLock:Null<flight._js.HostPowerSessionLockCapability>, hostPowerSuspension:Null<flight._js.HostPowerSuspensionCapability>, hostPowerThermal:Null<flight._js.HostPowerThermalCapability>, hostPowerIdle:Null<flight._js.HostPowerIdleCapability>, idleThresholdSeconds:Null<Float>):Void {
		flight._js._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, cast this, idleThresholdSeconds);
	}
	inline public function detach():Void {
		flight._js._fn.Power.detachPower(cast this);
	}
	inline public function dispose():Void {
		flight._js._fn.Power.disposePower(cast this);
	}
	inline public function enableSignals():Void {
		flight._js._fn.Power.enablePowerSignals(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Power.freePower(cast this);
	}
}
