package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/registry")
extern class Registry {
  public static function concatKindMap<T>(base:js.lib.Map<String, T>, overlay:js.lib.Map<String, T>):js.lib.Map<String, T>;
  public static function createOrdinalTable<T>(vocabulary:Array<String>):flight.esm.types.registry_contract.Types.OrdinalTable<T>;
  public static function getKindMapKeys(out:Array<String>, map:js.lib.Map<String, Dynamic>):Void;
  public static function getOrdinalTableEntry<T>(table:flight.esm.types.registry_contract.Types.OrdinalTable<T>, ordinal:Float):Null<T>;
  public static function withKindMapEntry<T>(map:js.lib.Map<String, T>, key:String, value:T):js.lib.Map<String, T>;
  public static function withoutKindMapEntry<T>(map:js.lib.Map<String, T>, key:String):js.lib.Map<String, T>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
