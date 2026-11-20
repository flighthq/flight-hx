package flight.esm.types.haptics;

#if (js && flight_esm)
typedef HapticImpactStyle = String;

typedef HapticNotificationType = String;

typedef HapticsCapabilities = { amplitudeControl:Bool, customEvents:Bool, intensity:Bool, patterns:Bool, supported:Bool };

typedef HapticsOperation = String;

typedef HostHapticsCapabilities = { ?engine:Null<flight.esm.types.haptics.Types.HostHapticsCapability> };

typedef HostHapticsCapability = { cancel:(() -> Bool), capabilities:((out:flight.esm.types.haptics.Types.HapticsCapabilities) -> Void), impact:((style:flight.esm.types.haptics.Types.HapticImpactStyle, ?intensity:Null<Float>) -> Bool), isSupported:(() -> Bool), notification:((type:flight.esm.types.haptics.Types.HapticNotificationType) -> Bool), ?prepare:Null<(() -> Void)>, selection:(() -> Bool), vibrate:((durationMs:Float) -> Bool), vibratePattern:((pattern:Array<Float>) -> Bool), ?vibrateWaveform:Null<((timings:Array<Float>, amplitudes:Array<Float>, ?repeat:Null<Float>) -> Bool)> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
