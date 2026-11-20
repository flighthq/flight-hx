package flight.esm.textbidi;

#if (js && flight_esm)
@:jsRequire("@flighthq/textbidi/contract")
extern class Contract {
  public static final compactBidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel;
  public static function createCompactBidiClassKernel():flight.esm.types.textbidi.Types.BidiClassKernel;
  public static function disableTextBidiGuards():Void;
  public static function enableTextBidiGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainBidiClassKernel(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel):flight.esm.types.textbidi.Types.BidiClassKernelExplanation;
  public static function getBidiRuns(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel, text:String, baseDirection:flight.esm.types.textbidi.Types.BidiDirection):Array<flight.esm.types.textbidi.Types.BidiRun>;
  public static function initializeCompactBidiClassKernel(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.textbidi.Types.BidiClassKernel>):Void;
  public static function reorderBidiLine(levels:js.lib.Uint8Array, start:Float, end:Float, out:Array<Float>):Void;
  public static function reportTextBidiCompactTableMiss(codepoint:Float):Void;
  public static function resolveBidiLevels(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel, text:String, baseDirection:flight.esm.types.textbidi.Types.BidiDirection):js.lib.Uint8Array;
  public static function setTextBidiGuard(guard:Null<((arg0:Float) -> Void)>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
