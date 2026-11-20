package flight.esm.types.debug;

#if (js && flight_esm)
typedef DebugOptions = { ?subsystems:Null<Array<flight.esm.types.debug.Types.DebugSubsystemName>>, ?level:Null<Float>, ?channels:Null<Array<String>>, ?sink:Null<flight.esm.types.log.Types.LogSink> };

typedef DebugState = { enabled:Bool, enabledSubsystems:Array<flight.esm.types.debug.Types.DebugSubsystemHooks>, frameNumber:Float, installedSink:Null<flight.esm.types.log.Types.LogSink>, savedChannelLevels:js.lib.Map<String, Null<Float>>, savedGlobalLevel:flight.esm.types.log_contract.Types.LogLevel, subsystems:js.lib.Map<String, flight.esm.types.debug.Types.DebugSubsystemHooks> };

typedef DebugSubsystemHooks = { ?channels:Null<Array<String>>, ?enableGuards:Null<(() -> Void)>, ?disableGuards:Null<(() -> Void)> };

typedef DebugSubsystemName = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
