package flight._cpp;

abstract Connectivity(cpp.Star<cpp.Void>) {
	static extern inline public function create():flight._cpp.Connectivity {
		return flight._cpp._fn.Connectivity.createConnectivity();
	}
	extern inline public function attach(hostConnectivityStatus:flight._cpp.HostConnectivityStatusCapability, hostConnectivityChange:flight._cpp.HostConnectivityChangeCapability):Bool {
		return flight._cpp._fn.Connectivity.attachConnectivity(hostConnectivityStatus, hostConnectivityChange, cast this);
	}
	extern inline public function detach():Void {
		flight._cpp._fn.Connectivity.detachConnectivity(cast this);
	}
	extern inline public function dispose():Void {
		flight._cpp._fn.Connectivity.disposeConnectivity(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Connectivity.freeConnectivity(cast this);
	}
}
