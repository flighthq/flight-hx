package flight._hl;

abstract Sensors(hl.Bytes) {
	static inline public function create():flight._hl.Sensors {
		return flight._hl._fn.Sensors.createSensors();
	}
	inline public function attach(hostSensors:flight._hl.HostSensorsCapability):Void {
		flight._hl._fn.Sensors.attachSensors(hostSensors, cast this);
	}
	inline public function detach():Void {
		flight._hl._fn.Sensors.detachSensors(cast this);
	}
	inline public function dispose():Void {
		flight._hl._fn.Sensors.disposeSensors(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Sensors.freeSensors(cast this);
	}
}
