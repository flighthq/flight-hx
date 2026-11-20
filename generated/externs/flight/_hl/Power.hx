package flight._hl;

abstract Power(hl.Bytes) {
	static inline public function create():flight._hl.Power {
		return flight._hl._fn.Power.createPower();
	}
	inline public function attach(hostPowerStatus:flight._hl.HostPowerStatusCapability, hostPowerChange:flight._hl.HostPowerChangeCapability, hostPowerSessionLock:flight._hl.HostPowerSessionLockCapability, hostPowerSuspension:flight._hl.HostPowerSuspensionCapability, hostPowerThermal:flight._hl.HostPowerThermalCapability, hostPowerIdle:flight._hl.HostPowerIdleCapability, idleThresholdSeconds:Single):Void {
		flight._hl._fn.Power.attachPower(hostPowerStatus, hostPowerChange, hostPowerSessionLock, hostPowerSuspension, hostPowerThermal, hostPowerIdle, cast this, idleThresholdSeconds);
	}
	inline public function detach():Void {
		flight._hl._fn.Power.detachPower(cast this);
	}
	inline public function dispose():Void {
		flight._hl._fn.Power.disposePower(cast this);
	}
	inline public function enableSignals():Void {
		flight._hl._fn.Power.enablePowerSignals(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Power.freePower(cast this);
	}
}
