package flight.esm.types.loader;

#if (js && flight_esm)
typedef LoadOptions = { ?signal:Null<js.html.AbortSignal>, ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.loader.Types.LoadProgress>> };

typedef LoadProgress = { url:String, loaded:Float, total:Float, phase:String };

typedef ResourceLoadBytes = { bytesLoaded:Float, bytesTotalKnown:Float, itemsWithKnownBytes:Float };

typedef ResourceLoadBytesReporter = ((loaded:Float, ?total:Null<Float>) -> Void);

typedef ResourceLoadCounts = { settledItems:Float, inFlightItems:Float, queuedItems:Float, totalItems:Float };

typedef ResourceLoadHandle<T> = { key:String, promise:js.lib.Promise<T> };

typedef ResourceLoadItem<T> = { ?bytesHint:Null<Float>, ?group:Null<String>, ?key:Null<String>, load:((signal:js.html.AbortSignal, reportBytes:flight.esm.types.loader.Types.ResourceLoadBytesReporter) -> js.lib.Promise<T>), ?onBytesProgress:Null<((loaded:Float, total:Float) -> Void)>, ?priority:Null<Float>, ?retries:Null<Float>, ?timeoutMs:Null<Float>, ?weight:Null<Float> };

typedef ResourceLoadItemStatus = String;

typedef ResourceLoadReport = { attempts:Float, bytes:Float, elapsedMs:Float, group:Null<String>, key:String, status:flight.esm.types.loader.Types.ResourceLoadReportStatus };

typedef ResourceLoadReportStatus = String;

typedef ResourceLoader = { onCancel:flight.esm.types.signals.Types.Signal<Void>, onComplete:flight.esm.types.signals.Types.Signal<Array<flight.esm.types.loader.Types.ResourceLoadReport>>, onError:flight.esm.types.signals.Types.Signal<Array<Dynamic>>, onPause:flight.esm.types.signals.Types.Signal<Void>, onProgress:flight.esm.types.signals.Types.Signal<Float>, onResume:flight.esm.types.signals.Types.Signal<Void> };

typedef ResourceLoaderItemSignals = { onItemComplete:flight.esm.types.signals.Types.Signal<Array<Dynamic>>, onItemError:flight.esm.types.signals.Types.Signal<Array<Dynamic>>, onItemRetry:flight.esm.types.signals.Types.Signal<Array<Dynamic>>, onItemStart:flight.esm.types.signals.Types.Signal<String> };

typedef ResourceLoaderOptions = { ?dedupe:Null<Bool>, ?errorPolicy:Null<String>, ?maxBytesPerSecond:Null<Float>, ?maxConcurrent:Null<Float>, ?retries:Null<Float>, ?retryBackoff:Null<String>, ?retryBaseDelayMs:Null<Float>, ?retryMaxDelayMs:Null<Float>, ?streaming:Null<Bool>, ?timeoutMs:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
