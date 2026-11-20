package flight.esm.types.sdk_interaction;

#if (js && flight_esm)
typedef AnyInteractionSignalSlot = flight.esm.types.interaction.Types.AnyInteractionSignalSlot;

typedef Cursor = flight.esm.types.interaction.Types.Cursor;

typedef CursorBackend = flight.esm.types.interaction.Types.CursorBackend;

typedef FocusDirection = flight.esm.types.interaction.Types.FocusDirection;

typedef FocusEventData = flight.esm.types.interaction.Types.FocusEventData;

typedef FocusManager<N> = flight.esm.types.interaction.Types.FocusManager<N>;

typedef FocusManagerOptions = flight.esm.types.interaction.Types.FocusManagerOptions;

typedef FocusNavigationInput = flight.esm.types.interaction.Types.FocusNavigationInput;

typedef FocusNavigationOptions = flight.esm.types.interaction.Types.FocusNavigationOptions;

typedef HitArea = flight.esm.types.interaction.Types.HitArea;

typedef HitTestFunction = flight.esm.types.interaction.Types.HitTestFunction;

typedef HitTestPreciseFunction = flight.esm.types.interaction.Types.HitTestPreciseFunction;

typedef HitTestResult = flight.esm.types.interaction.Types.HitTestResult;

typedef InteractionConnectGuard = flight.esm.types.interaction.Types.InteractionConnectGuard;

typedef InteractionDispatchLayer<N> = flight.esm.types.interaction.Types.InteractionDispatchLayer<N>;

typedef InteractionDispatchLayerOptions = flight.esm.types.interaction.Types.InteractionDispatchLayerOptions;

typedef InteractionHitEligibility = flight.esm.types.interaction.Types.InteractionHitEligibility;

typedef InteractionInputSource = flight.esm.types.interaction.Types.InteractionInputSource;

typedef InteractionManager<N> = flight.esm.types.interaction.Types.InteractionManager<N>;

typedef InteractionManagerOptions = flight.esm.types.interaction.Types.InteractionManagerOptions;

typedef InteractionPointerOptions = flight.esm.types.interaction.Types.InteractionPointerOptions;

typedef InteractionPointerState<N> = flight.esm.types.interaction.Types.InteractionPointerState<N>;

typedef InteractionSignalName = flight.esm.types.interaction.Types.InteractionSignalName;

typedef InteractionSignals = flight.esm.types.interaction.Types.InteractionSignals;

typedef KeyboardEventData = flight.esm.types.interaction.Types.KeyboardEventData;

typedef Node2DInteractionSignals = flight.esm.types.interaction.Types.Node2DInteractionSignals;

typedef NodeInteractionState = flight.esm.types.interaction.Types.NodeInteractionState;

typedef PointerEventData = flight.esm.types.interaction.Types.PointerEventData;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
