package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/log")
extern class Log {
  public static function addLogSink(state:flight.esm.types.log.Types.LogState, sink:flight.esm.types.log.Types.LogSink):Void;
  public static function advanceLogSink(handle:flight.esm.types.log.Types.BufferedLogSink, nowMs:Float):Void;
  public static function beginLogGroup(state:flight.esm.types.log.Types.LogState, nowMs:Float, label:String, ?channel:Null<String>):Void;
  public static function clearLogChannelLevel(state:flight.esm.types.log.Types.LogState, channel:String):Void;
  public static function clearLogChannelLevels(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearLogGroups(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearLogOnceKeys(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearLogRedactionPaths(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearLogSerializers(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearLogSinks(state:flight.esm.types.log.Types.LogState):Void;
  public static function clearMemoryLogSink(handle:flight.esm.types.log.Types.MemoryLogSink):Void;
  public static function createBufferedLogSink(target:flight.esm.types.log.Types.LogSink, ?options:Null<flight.esm.types.log.Types.BufferedLogSinkOptions>):flight.esm.types.log.Types.BufferedLogSink;
  public static function createChildLogContext(parent:flight.esm.types.log.Types.LogContext, fields:Dynamic, ?channel:Null<String>):flight.esm.types.log.Types.LogContext;
  public static function createConsoleCaptureSink(state:flight.esm.types.log.Types.LogState, ?options:Null<flight.esm.types.log.Types.ConsoleLogSinkOptions>):flight.esm.types.log.Types.LogSink;
  public static function createConsoleLogSink(state:flight.esm.types.log.Types.LogState, ?options:Null<flight.esm.types.log.Types.ConsoleLogSinkOptions>):flight.esm.types.log.Types.LogSink;
  public static function createFanoutLogSink(sinks:Array<flight.esm.types.log.Types.LogSink>):flight.esm.types.log.Types.LogSink;
  public static function createFileLogSink(state:flight.esm.types.log.Types.LogState, transport:flight.esm.types.log.Types.LogTransport, ?options:Null<flight.esm.types.log.Types.FileLogSinkOptions>):flight.esm.types.log.Types.FileLogSink;
  public static function createFilterLogSink(target:flight.esm.types.log.Types.LogSink, predicate:flight.esm.types.log.Types.LogPredicate):flight.esm.types.log.Types.LogSink;
  public static function createJsonLogFormatter(state:flight.esm.types.log.Types.LogState):flight.esm.types.log.Types.LogFormatter;
  public static function createLogContext():flight.esm.types.log.Types.LogContext;
  public static function createLogSpan(state:flight.esm.types.log.Types.LogState):flight.esm.types.log.Types.LogSpan;
  public static function createLogState():flight.esm.types.log.Types.LogState;
  public static function createMemoryLogSink(capacity:Float):flight.esm.types.log.Types.MemoryLogSink;
  public static function createRateLimitedLogSink(target:flight.esm.types.log.Types.LogSink, options:flight.esm.types.log.Types.RateLimitedLogSinkOptions):flight.esm.types.log.Types.RateLimitedLogSink;
  public static function createSampledLogSink(target:flight.esm.types.log.Types.LogSink, rate:Float):flight.esm.types.log.Types.LogSink;
  public static function createTextLogFormatter(state:flight.esm.types.log.Types.LogState, ?options:Null<flight.esm.types.log.Types.TextLogFormatterOptions>):flight.esm.types.log.Types.LogFormatter;
  public static function destroyFileLogSink(state:flight.esm.types.log.Types.LogState, handle:flight.esm.types.log.Types.FileLogSink):js.lib.Promise<flight.esm.types.log.Types.FileLogSinkDestroyOutcome>;
  public static function disposeLogSink(handle:flight.esm.types.log.Types.BufferedLogSink):Void;
  public static function enableLogSignals(state:flight.esm.types.log.Types.LogState):flight.esm.types.log.Types.LogSignals;
  public static function endLogGroup(state:flight.esm.types.log.Types.LogState, nowMs:Float, ?channel:Null<String>):Void;
  public static function endLogTimer(state:flight.esm.types.log.Types.LogState, nowMs:Float, timer:flight.esm.types.log.Types.LogTimer):Float;
  public static function enterLogSpan(state:flight.esm.types.log.Types.LogState, span:flight.esm.types.log.Types.LogSpan):Void;
  public static function exitLogSpan(state:flight.esm.types.log.Types.LogState, span:flight.esm.types.log.Types.LogSpan):Void;
  public static function flushLogSink(handle:flight.esm.types.log.Types.BufferedLogSink):Void;
  public static function getLogChannelLevel(state:flight.esm.types.log.Types.LogState, channel:String):Null<Float>;
  public static function getLogConsoleLevel(state:flight.esm.types.log.Types.LogState):flight.esm.types.log_contract.Types.LogLevel;
  public static function getLogLevel(state:flight.esm.types.log.Types.LogState):flight.esm.types.log_contract.Types.LogLevel;
  public static function getLogLevelName(level:flight.esm.types.log_contract.Types.LogLevel):String;
  public static function getMemoryLogSinkEntries(out:Array<flight.esm.types.log.Types.LogEntry>, handle:flight.esm.types.log.Types.MemoryLogSink):Void;
  public static function log(state:flight.esm.types.log.Types.LogState, nowMs:Float, level:flight.esm.types.log_contract.Types.LogLevel, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logAssert(state:flight.esm.types.log.Types.LogState, nowMs:Float, condition:Bool, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logDebug(state:flight.esm.types.log.Types.LogState, nowMs:Float, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logDebugWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function logError(state:flight.esm.types.log.Types.LogState, nowMs:Float, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logErrorWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function logInfo(state:flight.esm.types.log.Types.LogState, nowMs:Float, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logInfoWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function logOnce(state:flight.esm.types.log.Types.LogState, nowMs:Float, key:String, level:flight.esm.types.log_contract.Types.LogLevel, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Bool;
  public static function logVerbose(state:flight.esm.types.log.Types.LogState, nowMs:Float, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logVerboseWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function logWarn(state:flight.esm.types.log.Types.LogState, nowMs:Float, data:flight.esm.types.log.Types.LogDataOrProvider, ?channel:Null<String>):Void;
  public static function logWarnWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function logWith(state:flight.esm.types.log.Types.LogState, nowMs:Float, context:flight.esm.types.log.Types.LogContext, level:flight.esm.types.log_contract.Types.LogLevel, data:flight.esm.types.log.Types.LogDataOrProvider):Void;
  public static function parseLogLevel(name:String):Null<Float>;
  public static function registerLogSerializer(state:flight.esm.types.log.Types.LogState, kind:String, serializer:flight.esm.types.log.Types.LogSerializer):Void;
  public static function removeLogSink(state:flight.esm.types.log.Types.LogState, sink:flight.esm.types.log.Types.LogSink):Bool;
  public static function serializeLogError(value:Dynamic):Dynamic;
  public static function setLogChannelLevel(state:flight.esm.types.log.Types.LogState, channel:String, level:flight.esm.types.log_contract.Types.LogLevel):Void;
  public static function setLogConsoleLevel(state:flight.esm.types.log.Types.LogState, level:flight.esm.types.log_contract.Types.LogLevel):Void;
  public static function setLogLevel(state:flight.esm.types.log.Types.LogState, level:flight.esm.types.log_contract.Types.LogLevel):Void;
  public static function setLogRedactionPaths(state:flight.esm.types.log.Types.LogState, paths:Array<String>):Void;
  public static function setLogSink(state:flight.esm.types.log.Types.LogState, sink:Null<flight.esm.types.log.Types.LogSink>):Void;
  public static function startLogTimer(label:String, channel:Null<String>, nowMs:Float):flight.esm.types.log.Types.LogTimer;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
