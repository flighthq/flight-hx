package flight.esm.types.log;

#if (js && flight_esm)
typedef BufferedLogSink = { sink:flight.esm.types.log.Types.LogSink };

typedef BufferedLogSinkOptions = { ?size:Null<Float>, ?intervalMs:Null<Float> };

typedef ConsoleLogSinkOptions = { ?formatter:Null<flight.esm.types.log.Types.LogFormatter> };

typedef FileLogSink = { sink:flight.esm.types.log.Types.LogSink };

typedef FileLogSinkDestroyOutcome = { reason:String, flush:flight.esm.types.log.Types.LogTransportFlushOutcome, destroy:flight.esm.types.log.Types.LogTransportDestroyOutcome };

typedef FileLogSinkOptions = { ?formatter:Null<flight.esm.types.log.Types.LogFormatter> };

typedef LogContext = { channel:Null<String>, fields:Dynamic };

typedef LogData = Dynamic;

typedef LogDataOrProvider = Dynamic;

typedef LogDataProvider = (() -> flight.esm.types.log.Types.LogData);

typedef LogEntry = { level:flight.esm.types.log_contract.Types.LogLevel, channel:Null<String>, data:flight.esm.types.log.Types.LogData, timestampMs:Float };

typedef LogFormatter = ((entry:flight.esm.types.log.Types.LogEntry) -> String);

typedef LogPredicate = ((entry:flight.esm.types.log.Types.LogEntry) -> Bool);

typedef LogSerializer = ((value:Dynamic) -> Dynamic);

typedef LogSignals = { onLogEntry:flight.esm.types.signals.Types.Signal<flight.esm.types.log.Types.LogEntry>, onLogError:flight.esm.types.signals.Types.Signal<flight.esm.types.log.Types.LogEntry> };

typedef LogSink = ((entry:flight.esm.types.log.Types.LogEntry) -> Void);

typedef LogSpan = { id:Float, name:String, fields:Dynamic, channel:Null<String> };

typedef LogState = { sinks:Array<flight.esm.types.log.Types.LogSink>, level:flight.esm.types.log_contract.Types.LogLevel, consoleLevel:flight.esm.types.log_contract.Types.LogLevel, channelLevels:js.lib.Map<String, flight.esm.types.log_contract.Types.LogLevel>, onceKeys:js.lib.Set<String>, redactionPaths:Array<String>, serializers:js.lib.Map<String, flight.esm.types.log.Types.LogSerializer>, groupDepth:Float, spans:Array<flight.esm.types.log.Types.LogSpan>, signals:Null<flight.esm.types.log.Types.LogSignals>, nextSpanId:Float };

typedef LogTimer = { label:String, channel:Null<String>, startedAt:Float };

typedef LogTransport = { write:((line:String) -> flight.esm.types.log.Types.LogTransportWriteOutcome), flush:(() -> js.lib.Promise<flight.esm.types.log.Types.LogTransportFlushOutcome>), destroy:(() -> js.lib.Promise<flight.esm.types.log.Types.LogTransportDestroyOutcome>) };

typedef LogTransportDeliveryBoundary = String;

typedef LogTransportDestroyOutcome = { reason:String };

typedef LogTransportFlushOutcome = { reason:String };

typedef LogTransportWriteOutcome = { reason:String };

typedef MemoryLogSink = { sink:flight.esm.types.log.Types.LogSink };

typedef RateLimitedLogSink = { sink:flight.esm.types.log.Types.LogSink };

typedef RateLimitedLogSinkOptions = { ?perChannel:Null<Bool>, maxPerInterval:Float, intervalMs:Float };

typedef TextLogFormatterOptions = { ?indentGroups:Null<Bool>, ?levelPrefix:Null<Bool>, ?timestamp:Null<Bool> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
