package flight.esm.types.platform;

#if (js && flight_esm)
typedef HostPlatformCapabilities = { ?info:Null<flight.esm.types.platform.Types.HostPlatformCapability> };

typedef HostPlatformCapability = { getInfo:((out:flight.esm.types.platform.Types.PlatformInfo) -> Void) };

typedef PlatformEndianness = String;

typedef PlatformEngine = String;

typedef PlatformInfo = { name:flight.esm.types.platform.Types.PlatformName, kind:flight.esm.types.platform.Types.PlatformKind, version:String, arch:String, locale:String, isTouch:Bool, runtime:flight.esm.types.platform.Types.PlatformRuntime, engine:flight.esm.types.platform.Types.PlatformEngine, engineVersion:String, endianness:flight.esm.types.platform.Types.PlatformEndianness, pointerWidth:Float, osBuild:String, distro:String, distroVersion:String };

typedef PlatformKind = String;

typedef PlatformName = String;

typedef PlatformRuntime = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
