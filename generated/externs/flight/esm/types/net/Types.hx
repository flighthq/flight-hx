package flight.esm.types.net;

#if (js && flight_esm)
typedef HostNetCapabilities = { ?http:Null<flight.esm.types.net.Types.HostNetCapability> };

typedef HostNetCapability = { sendNetRequest:((request:flight.esm.types.net.Types.NetRequest, ?options:Null<flight.esm.types.net.Types.NetRequestOptions>) -> js.lib.Promise<flight.esm.types.net.Types.NetResponse>) };

typedef NetBody = Dynamic;

typedef NetCredentials = String;

typedef NetGuard = ((notice:flight.esm.types.net.Types.NetGuardNotice) -> Void);

typedef NetGuardNotice = { operation:String, reason:String, request:flight.esm.types.net.Types.NetRequest };

typedef NetMethod = Dynamic;

typedef NetProgress = { phase:String, loaded:Float, total:Float };

typedef NetRedirect = String;

typedef NetRequest = { method:flight.esm.types.net.Types.NetMethod, url:String, ?headers:Dynamic, ?body:Dynamic, ?responseType:Null<String>, ?timeoutMs:Null<Float>, ?credentials:Null<String>, ?redirect:Null<String> };

typedef NetRequestOptions = { ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.net.Types.NetProgress>>, ?signal:Null<js.html.AbortSignal> };

typedef NetResponse = { status:Float, statusText:String, ok:Bool, headers:Dynamic, body:Dynamic, url:String };

typedef NetResponseBody = Dynamic;

typedef NetResponseExplanation = { reason:String, status:Float, statusText:String, url:String };

typedef NetResponseType = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
