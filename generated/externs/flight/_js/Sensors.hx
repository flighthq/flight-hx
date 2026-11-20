package flight._js;

abstract Sensors(Dynamic) {
	static inline public function create():flight._js.Sensors {
		return flight._js._fn.Sensors.createSensors();
	}
	inline public function attach(hostSensors:flight._js.HostSensorsCapability):Void {
		flight._js._fn.Sensors.attachSensors(hostSensors, cast this);
	}
	inline public function detach():Void {
		flight._js._fn.Sensors.detachSensors(cast this);
	}
	inline public function dispose():Void {
		flight._js._fn.Sensors.disposeSensors(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Sensors.freeSensors(cast this);
	}
}
