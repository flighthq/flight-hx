package flight.esm.types.sdk_loader;

#if (js && flight_esm)
typedef LoadOptions = flight.esm.types.loader.Types.LoadOptions;

typedef LoadProgress = flight.esm.types.loader.Types.LoadProgress;

typedef ResourceLoadBytes = flight.esm.types.loader.Types.ResourceLoadBytes;

typedef ResourceLoadBytesReporter = flight.esm.types.loader.Types.ResourceLoadBytesReporter;

typedef ResourceLoadCounts = flight.esm.types.loader.Types.ResourceLoadCounts;

typedef ResourceLoadHandle<T> = flight.esm.types.loader.Types.ResourceLoadHandle<T>;

typedef ResourceLoadItem<T> = flight.esm.types.loader.Types.ResourceLoadItem<T>;

typedef ResourceLoadItemStatus = flight.esm.types.loader.Types.ResourceLoadItemStatus;

typedef ResourceLoadReport = flight.esm.types.loader.Types.ResourceLoadReport;

typedef ResourceLoadReportStatus = flight.esm.types.loader.Types.ResourceLoadReportStatus;

typedef ResourceLoader = flight.esm.types.loader.Types.ResourceLoader;

typedef ResourceLoaderItemSignals = flight.esm.types.loader.Types.ResourceLoaderItemSignals;

typedef ResourceLoaderOptions = flight.esm.types.loader.Types.ResourceLoaderOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
