package flight.esm.types.protocol_contract;

#if (js && flight_esm)
typedef HostProtocolDefaultCapability = { isDefault:((scheme:String) -> Bool), removeAsDefault:((scheme:String) -> Bool), setAsDefault:((scheme:String) -> Bool) };

typedef HostProtocolLaunchCapability = { getLaunchUrl:(() -> Null<String>) };

typedef HostProtocolOpenCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostProtocolRegistrationCapability = { getRegisteredSchemes:(() -> Array<String>), register:((scheme:String) -> Bool) };

typedef HostProtocolRegistrationQueryCapability = { isRegistered:((scheme:String) -> Bool) };

typedef HostProtocolUnregistrationCapability = { unregister:((scheme:String) -> Bool) };

typedef ParsedProtocolUrl = { scheme:String, host:String, path:String, query:Dynamic };

typedef ProtocolHandler = { onOpenUrl:flight.esm.types.signals.Types.Signal<String> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
