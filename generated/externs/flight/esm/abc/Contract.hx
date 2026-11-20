package flight.esm.abc;

#if (js && flight_esm)
@:jsRequire("@flighthq/abc/contract")
extern class Contract {
  public static final AbcMultinameKind:Dynamic;
  public static final AbcOpcode:Dynamic;
  public static final AbcTraitKind:Dynamic;
  public static function readAbcFile(source:js.lib.Uint8Array):Null<flight.esm.types.abc.Types.AbcFile>;
  public static function readAbcInstructions(code:js.lib.Uint8Array):Null<Array<flight.esm.types.abc.Types.AbcInstruction>>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
