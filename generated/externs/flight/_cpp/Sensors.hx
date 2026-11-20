package flight._cpp;

abstract Sensors(cpp.Star<cpp.Void>) {
	static extern inline public function create():flight._cpp.Sensors {
		return flight._cpp._fn.Sensors.createSensors();
	}
	extern inline public function attach(hostSensors:flight._cpp.HostSensorsCapability):Void {
		flight._cpp._fn.Sensors.attachSensors(hostSensors, cast this);
	}
	extern inline public function detach():Void {
		flight._cpp._fn.Sensors.detachSensors(cast this);
	}
	extern inline public function dispose():Void {
		flight._cpp._fn.Sensors.disposeSensors(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Sensors.freeSensors(cast this);
	}
}
