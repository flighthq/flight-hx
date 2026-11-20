package flight.esm.types.textbidi_contract;

#if (js && flight_esm)
typedef BidiClass = flight.esm.types.textbidi.Types.BidiClass;

typedef BidiClassKernel = flight.esm.types.textbidi.Types.BidiClassKernel;

typedef BidiClassKernelExplanation = flight.esm.types.textbidi.Types.BidiClassKernelExplanation;

typedef BidiClassKernelKind = flight.esm.types.textbidi.Types.BidiClassKernelKind;

typedef BidiCodePointRange = flight.esm.types.textbidi.Types.BidiCodePointRange;

typedef BidiDirection = flight.esm.types.textbidi.Types.BidiDirection;

typedef BidiRun = flight.esm.types.textbidi.Types.BidiRun;

typedef TextBidiGuard = flight.esm.types.textbidi.Types.TextBidiGuard;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
