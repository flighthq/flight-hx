package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/textbidi")
extern class Textbidi {
  public static final compactBidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel;
  public static function disableTextBidiGuards():Void;
  public static function enableTextBidiGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainBidiClassKernel(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel):flight.esm.types.textbidi.Types.BidiClassKernelExplanation;
  public static function getBidiRuns(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel, text:String, baseDirection:flight.esm.types.textbidi.Types.BidiDirection):Array<flight.esm.types.textbidi.Types.BidiRun>;
  public static function reorderBidiLine(levels:js.lib.Uint8Array, start:Float, end:Float, out:Array<Float>):Void;
  public static function resolveBidiLevels(bidiClassKernel:flight.esm.types.textbidi.Types.BidiClassKernel, text:String, baseDirection:flight.esm.types.textbidi.Types.BidiDirection):js.lib.Uint8Array;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
