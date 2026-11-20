package flight.esm.types.sdk_statechart;

#if (js && flight_esm)
typedef Statechart = flight.esm.types.statechart.Types.Statechart;

typedef StatechartComparison = flight.esm.types.statechart.Types.StatechartComparison;

typedef StatechartCondition = flight.esm.types.statechart.Types.StatechartCondition;

typedef StatechartDurationGuard = flight.esm.types.statechart.Types.StatechartDurationGuard;

typedef StatechartInput = flight.esm.types.statechart.Types.StatechartInput;

typedef StatechartInputKind = flight.esm.types.statechart.Types.StatechartInputKind;

typedef StatechartInstance = flight.esm.types.statechart.Types.StatechartInstance;

typedef StatechartInstanceRaw = flight.esm.types.statechart.Types.StatechartInstanceRaw;

typedef StatechartRaw = flight.esm.types.statechart.Types.StatechartRaw;

typedef StatechartRegion = flight.esm.types.statechart.Types.StatechartRegion;

typedef StatechartSignals = flight.esm.types.statechart.Types.StatechartSignals;

typedef StatechartState = flight.esm.types.statechart.Types.StatechartState;

typedef StatechartTransition = flight.esm.types.statechart.Types.StatechartTransition;

typedef StatechartTransitionExplanation = flight.esm.types.statechart.Types.StatechartTransitionExplanation;

typedef StatechartTransitionStatus = flight.esm.types.statechart.Types.StatechartTransitionStatus;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
