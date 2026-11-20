package flight.esm.assets;

#if (js && flight_esm)
@:jsRequire("@flighthq/assets/contract")
extern class Contract {
  public static function acquireAsset<T>(library:flight.esm.types.assets_contract.Types.AssetLibrary, id:String):js.lib.Promise<T>;
  public static function areAssetGuardsEnabled(library:flight.esm.types.assets_contract.Types.AssetLibrary):Bool;
  public static function createAssetLibrary():flight.esm.types.assets_contract.Types.AssetLibrary;
  public static function disableAssetGuards(library:flight.esm.types.assets_contract.Types.AssetLibrary):Void;
  public static function disposeAssetLibrary(library:flight.esm.types.assets_contract.Types.AssetLibrary):Void;
  public static function enableAssetGuards(library:flight.esm.types.assets_contract.Types.AssetLibrary, logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainAssetLoad(library:flight.esm.types.assets_contract.Types.AssetLibrary, id:String):flight.esm.types.assets_contract.Types.AssetLoadExplanation;
  public static function getAsset<T>(library:flight.esm.types.assets_contract.Types.AssetLibrary, id:String):Null<T>;
  public static function getAssetGroupIds(library:flight.esm.types.assets_contract.Types.AssetLibrary, name:String):Array<String>;
  public static function getAssetIds(library:flight.esm.types.assets_contract.Types.AssetLibrary):Array<String>;
  public static function getAssetRefCount(library:flight.esm.types.assets_contract.Types.AssetLibrary, id:String):Float;
  public static function initializeAssetLibrary(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.assets_contract.Types.AssetLibrary>):Void;
  public static function loadAssetGroup(library:flight.esm.types.assets_contract.Types.AssetLibrary, name:String, ?options:Null<flight.esm.types.assets_contract.Types.AssetGroupLoadOptions>):js.lib.Promise<Void>;
  public static function registerAssetDescriptor(library:flight.esm.types.assets_contract.Types.AssetLibrary, descriptor:flight.esm.types.assets_contract.Types.AssetDescriptor):Void;
  public static function registerAssetLoader<T>(library:flight.esm.types.assets_contract.Types.AssetLibrary, type:flight.esm.types.assets_contract.Types.AssetType, adapter:flight.esm.types.assets_contract.Types.AssetLoaderAdapter<T>):Void;
  public static function registerAssetManifest(library:flight.esm.types.assets_contract.Types.AssetLibrary, manifest:flight.esm.types.assets_contract.Types.AssetManifest):Void;
  public static function releaseAsset(library:flight.esm.types.assets_contract.Types.AssetLibrary, id:String):Void;
  public static function releaseAssetGroup(library:flight.esm.types.assets_contract.Types.AssetLibrary, name:String):Void;
  public static function setAssetAcquireGuard(library:flight.esm.types.assets_contract.Types.AssetLibrary, guard:Null<flight.esm.types.assets_contract.Types.AssetAcquireGuard>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
