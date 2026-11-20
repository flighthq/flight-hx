package flight.esm.types.log_contract;

#if (js && flight_esm)
typedef BufferedLogSink = flight.esm.types.log.Types.BufferedLogSink;

typedef BufferedLogSinkOptions = flight.esm.types.log.Types.BufferedLogSinkOptions;

typedef ConsoleLogSinkOptions = flight.esm.types.log.Types.ConsoleLogSinkOptions;

typedef FileLogSink = flight.esm.types.log.Types.FileLogSink;

typedef FileLogSinkDestroyOutcome = flight.esm.types.log.Types.FileLogSinkDestroyOutcome;

typedef FileLogSinkOptions = flight.esm.types.log.Types.FileLogSinkOptions;

typedef LogContext = flight.esm.types.log.Types.LogContext;

typedef LogData = flight.esm.types.log.Types.LogData;

typedef LogDataOrProvider = flight.esm.types.log.Types.LogDataOrProvider;

typedef LogDataProvider = flight.esm.types.log.Types.LogDataProvider;

typedef LogEntry = flight.esm.types.log.Types.LogEntry;

typedef LogFormatter = flight.esm.types.log.Types.LogFormatter;

typedef LogLevel = Float;

typedef LogPredicate = flight.esm.types.log.Types.LogPredicate;

typedef LogSerializer = flight.esm.types.log.Types.LogSerializer;

typedef LogSignals = flight.esm.types.log.Types.LogSignals;

typedef LogSink = flight.esm.types.log.Types.LogSink;

typedef LogSpan = flight.esm.types.log.Types.LogSpan;

typedef LogState = flight.esm.types.log.Types.LogState;

typedef LogStateRaw = flight.esm.types.log.Types.LogState;

typedef LogStateRef = flight.esm.types.log.Types.LogState;

typedef LogTimer = flight.esm.types.log.Types.LogTimer;

typedef LogTransport = flight.esm.types.log.Types.LogTransport;

typedef LogTransportDeliveryBoundary = flight.esm.types.log.Types.LogTransportDeliveryBoundary;

typedef LogTransportDestroyOutcome = flight.esm.types.log.Types.LogTransportDestroyOutcome;

typedef LogTransportFlushOutcome = flight.esm.types.log.Types.LogTransportFlushOutcome;

typedef LogTransportWriteOutcome = flight.esm.types.log.Types.LogTransportWriteOutcome;

typedef MemoryLogSink = flight.esm.types.log.Types.MemoryLogSink;

typedef RateLimitedLogSink = flight.esm.types.log.Types.RateLimitedLogSink;

typedef RateLimitedLogSinkOptions = flight.esm.types.log.Types.RateLimitedLogSinkOptions;

typedef TextLogFormatterOptions = flight.esm.types.log.Types.TextLogFormatterOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
