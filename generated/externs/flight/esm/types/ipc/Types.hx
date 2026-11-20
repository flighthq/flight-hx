package flight.esm.types.ipc;

#if (js && flight_esm)
typedef HostIpcCapabilities = { ?handle:Null<flight.esm.types.ipc.Types.HostIpcHandleCapability>, ?invoke:Null<flight.esm.types.ipc.Types.HostIpcInvokeCapability>, ?message:Null<flight.esm.types.ipc.Types.HostIpcMessageCapability>, ?send:Null<flight.esm.types.ipc.Types.HostIpcSendCapability>, ?targetedSend:Null<flight.esm.types.ipc.Types.HostIpcTargetedSendCapability<Dynamic>> };

typedef HostIpcHandleCapability = { handle:((channel:String, handler:Dynamic) -> Dynamic) };

typedef HostIpcInvokeCapability = { invoke:((channel:String, args:Array<Dynamic>) -> js.lib.Promise<Dynamic>) };

typedef HostIpcMessageCapability = { subscribe:((channel:String, listener:Dynamic) -> Dynamic) };

typedef HostIpcSendCapability = { send:((channel:String, args:Array<Dynamic>) -> Void) };

typedef HostIpcTargetedSendCapability<Target> = { send:((target:Target, channel:String, args:Array<Dynamic>) -> Void) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
