package flight._hl;

abstract Connectivity(hl.Bytes) {
	static inline public function create():flight._hl.Connectivity {
		return flight._hl._fn.Connectivity.createConnectivity();
	}
	inline public function attach(hostConnectivityStatus:flight._hl.HostConnectivityStatusCapability, hostConnectivityChange:flight._hl.HostConnectivityChangeCapability):Bool {
		return flight._hl._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, cast this);
	}
	inline public function detach():Void {
		flight._hl._fn.Connectivity.detachConnectivity(cast this);
	}
	inline public function dispose():Void {
		flight._hl._fn.Connectivity.disposeConnectivity(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Connectivity.freeConnectivity(cast this);
	}
}
