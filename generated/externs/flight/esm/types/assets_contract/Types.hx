package flight.esm.types.assets_contract;

#if (js && flight_esm)
typedef AssetAcquireGuard = ((library:flight.esm.types.assets_contract.Types.AssetLibrary, explanation:flight.esm.types.assets_contract.Types.AssetLoadExplanation) -> Void);

typedef AssetDescriptor = { id:String, url:String, type:flight.esm.types.assets_contract.Types.AssetType, ?groups:Null<Array<String>> };

typedef AssetEntry = { value:Dynamic, refcount:Float, loadPromise:Null<js.lib.Promise<Dynamic>>, resident:Bool };

typedef AssetGroupLoadOptions = { ?progress:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.assets_contract.Types.AssetLoadProgress>> };

typedef AssetLibrary = { runtime:flight.esm.types.assets_contract.Types.AssetLibraryRuntime };

typedef AssetLibraryRuntime = { acquireGuard:Null<flight.esm.types.assets_contract.Types.AssetAcquireGuard>, adapters:js.lib.Map<flight.esm.types.assets_contract.Types.AssetType, flight.esm.types.assets_contract.Types.AssetLoaderAdapter<Dynamic>>, descriptors:js.lib.Map<String, flight.esm.types.assets_contract.Types.AssetDescriptor>, entries:js.lib.Map<String, flight.esm.types.assets_contract.Types.AssetEntry>, freedIds:js.lib.Set<String>, groups:js.lib.Map<String, Array<String>> };

typedef AssetLoadExplanation = { id:String, refCount:Float, status:String, type:Dynamic };

typedef AssetLoadProgress = { loaded:Float, total:Float };

typedef AssetLoaderAdapter<T> = { load:((descriptor:flight.esm.types.assets_contract.Types.AssetDescriptor) -> js.lib.Promise<T>), dispose:((value:T) -> Void) };

typedef AssetManifest = Array<flight.esm.types.assets_contract.Types.AssetDescriptor>;

typedef AssetType = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
