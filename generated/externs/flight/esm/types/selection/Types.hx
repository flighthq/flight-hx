package flight.esm.types.selection;

#if (js && flight_esm)
typedef LassoSelection = Dynamic;

typedef MarqueeSelection = Dynamic;

typedef MarqueeSelectionMode = String;

typedef SelectionModifierState = { altKey:Bool, ctrlKey:Bool, metaKey:Bool, shiftKey:Bool };

typedef SelectionSignals<NodeType> = { onActiveChange:flight.esm.types.signals.Types.Signal<Null<NodeType>>, onChange:flight.esm.types.signals.Types.Signal<Array<NodeType>> };

typedef SelectionState<NodeType> = Dynamic;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
