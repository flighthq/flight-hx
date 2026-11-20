package flight.esm.types.sdk_selection;

#if (js && flight_esm)
typedef LassoSelection = flight.esm.types.selection.Types.LassoSelection;

typedef MarqueeSelection = flight.esm.types.selection.Types.MarqueeSelection;

typedef MarqueeSelectionMode = flight.esm.types.selection.Types.MarqueeSelectionMode;

typedef SelectionModifierState = flight.esm.types.selection.Types.SelectionModifierState;

typedef SelectionSignals<NodeType> = flight.esm.types.selection.Types.SelectionSignals<NodeType>;

typedef SelectionState<NodeType> = flight.esm.types.selection.Types.SelectionState<NodeType>;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
