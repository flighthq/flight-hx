package flight.esm.types.device;

#if (js && flight_esm)
typedef DeviceCapabilities = { hasKeyboard:Bool, hasMouse:Bool, hasStylus:Bool };

typedef DeviceDisplayMetrics = { colorDepth:Float, densityDpi:Float, logicalHeight:Float, logicalWidth:Float, physicalHeight:Float, physicalWidth:Float, pixelRatio:Float };

typedef DeviceInfo = { arch:String, availableMemory:Float, boardName:String, colorGamut:String, cpuCores:Float, fontScale:Float, formFactor:String, gpuRenderer:String, gpuVendor:String, isHdr:Bool, isJailbroken:Bool, isLowEndDevice:Bool, isRooted:Bool, isVirtual:Bool, manufacturer:String, marketingName:String, model:String, osBuild:String, osName:String, osVersion:String, platformString:String, productName:String, supportedAbis:Array<String>, totalMemory:Float, webViewVersion:String };

typedef HostDeviceCapabilities = { ?info:Null<flight.esm.types.device.Types.HostDeviceCapability> };

typedef HostDeviceCapability = { getCapabilities:((out:flight.esm.types.device.Types.DeviceCapabilities) -> Void), getDisplayMetrics:((out:flight.esm.types.device.Types.DeviceDisplayMetrics) -> Void), getId:(() -> String), getInfo:((out:flight.esm.types.device.Types.DeviceInfo) -> Void), getSafeAreaInsets:((out:flight.esm.types.device.Types.SafeAreaInsets) -> Void), ?refresh:Null<(() -> Void)> };

typedef SafeAreaInsets = { top:Float, right:Float, bottom:Float, left:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
