package flight.esm.types.textbidi;

#if (js && flight_esm)
typedef BidiClass = String;

typedef BidiClassKernel = { getBidiClass:((codepoint:Float) -> flight.esm.types.textbidi.Types.BidiClass) };

typedef BidiClassKernelExplanation = { kernel:flight.esm.types.textbidi.Types.BidiClassKernelKind, coverage:String, coveredCodePointRanges:Array<flight.esm.types.textbidi.Types.BidiCodePointRange>, fallbackClass:Null<String>, tableValid:Null<Bool> };

typedef BidiClassKernelKind = String;

typedef BidiCodePointRange = { end:Float, start:Float };

typedef BidiDirection = String;

typedef BidiRun = { start:Float, end:Float, level:Float, direction:String };

typedef TextBidiGuard = ((codepoint:Float) -> Void);

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
