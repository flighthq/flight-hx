package flight._js;

abstract Connectivity(Dynamic) {
	static inline public function create():flight._js.Connectivity {
		return flight._js._fn.Connectivity.createConnectivity();
	}
	inline public function attach(hostConnectivityStatus:flight._js.HostConnectivityStatusCapability, hostConnectivityChange:flight._js.HostConnectivityChangeCapability):Bool {
		return flight._js._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, cast this);
	}
	inline public function detach():Void {
		flight._js._fn.Connectivity.detachConnectivity(cast this);
	}
	inline public function dispose():Void {
		flight._js._fn.Connectivity.disposeConnectivity(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Connectivity.freeConnectivity(cast this);
	}
}
