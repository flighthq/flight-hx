package flight.esm.types.connectivity_contract;

#if (js && flight_esm)
typedef Connectivity = { onChange:flight.esm.types.signals.Types.Signal<flight.esm.types.connectivity_contract.Types.ConnectivityStatus>, onConnectionTypeChange:flight.esm.types.signals.Types.Signal<flight.esm.types.connectivity_contract.Types.ConnectivityConnectionType>, onMeteredChange:flight.esm.types.signals.Types.Signal<Bool>, onOnline:flight.esm.types.signals.Types.Signal<Void>, onOffline:flight.esm.types.signals.Types.Signal<Void> };

typedef ConnectivityConnectionType = String;

typedef ConnectivityReachability = { reachable:Bool, latency:Float };

typedef ConnectivityReachabilityOptions = { url:String, ?timeout:Null<Float>, ?signal:Null<js.html.AbortSignal> };

typedef ConnectivityStatus = { online:Null<Bool>, type:flight.esm.types.connectivity_contract.Types.ConnectivityConnectionType, downlink:Float, downlinkMax:Float, effectiveType:String, rtt:Float, saveData:Bool, metered:Bool };

typedef HostConnectivityChangeCapability = { destroy:(() -> Void), subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostConnectivityReachabilityCapability = { detectReachability:((options:flight.esm.types.connectivity_contract.Types.ConnectivityReachabilityOptions, out:flight.esm.types.connectivity_contract.Types.ConnectivityReachability) -> js.lib.Promise<flight.esm.types.connectivity_contract.Types.ConnectivityReachability>) };

typedef HostConnectivityStatusCapability = { getStatus:((out:flight.esm.types.connectivity_contract.Types.ConnectivityStatus) -> Void) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
