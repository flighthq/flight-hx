package flight.esm.types.interaction;

#if (js && flight_esm)
typedef AnyInteractionSignalSlot = ((value:Dynamic) -> Void);

typedef Cursor = Dynamic;

typedef CursorBackend = { setCursor:((cursor:Dynamic) -> Void) };

typedef FocusDirection = String;

typedef FocusEventData = { currentTarget:Null<flight.esm.types.node.Types.NodeAny>, relatedTarget:Null<flight.esm.types.node.Types.NodeAny>, target:Null<flight.esm.types.node.Types.NodeAny> };

typedef FocusManager<N> = { focused:Null<N>, root:N, wrap:Bool };

typedef FocusManagerOptions = { ?wrap:Null<Bool> };

typedef FocusNavigationInput = { onKeyDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData> };

typedef FocusNavigationOptions = { ?arrowKeys:Null<Bool> };

typedef HitArea = Dynamic;

typedef HitTestFunction = ((source:flight.esm.types.node.Types.NodeAny, x:Float, y:Float) -> Bool);

typedef HitTestPreciseFunction = ((source:flight.esm.types.node.Types.NodeAny, x:Float, y:Float) -> Float);

typedef HitTestResult = { localX:Float, localY:Float, node:flight.esm.types.node.Types.NodeAny, subIndex:Float };

typedef InteractionConnectGuard = ((target:flight.esm.types.node.Types.NodeAny, name:flight.esm.types.interaction.Types.InteractionSignalName) -> Void);

typedef InteractionDispatchLayer<N> = ((target:N, name:flight.esm.types.interaction.Types.InteractionSignalName, data:Dynamic) -> Bool);

typedef InteractionDispatchLayerOptions = { ?priority:Null<Float> };

typedef InteractionHitEligibility = { eligible:Bool, hasEligibleInSubtree:Bool };

typedef InteractionInputSource = { onKeyDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onKeyUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputKeyboardData>, onPointerCancel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerDown:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerMove:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onPointerUp:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData>, onWheel:flight.esm.types.signals_contract.Types.SignalRaw<flight.esm.types.input.Types.InputPointerData> };

typedef InteractionManager<N> = { cursorBackend:Null<flight.esm.types.interaction.Types.CursorBackend>, cursorTarget:Null<N>, dispatchLayers:Null<Array<Dynamic>>, doubleClickDelay:Float, doubleClickDistance:Float, enabled:Bool, pointerCaptures:js.lib.Map<Float, N>, pointerStates:js.lib.Map<Float, flight.esm.types.interaction.Types.InteractionPointerState<N>>, precise:Bool, root:N, spatialIndex:Null<flight.esm.types.spatial.Types.SpatialIndex2D>, signalSubscriberCounts:js.lib.Map<flight.esm.types.interaction.Types.InteractionSignalName, Float>, suppressTouchHover:Bool, trackedSignalSlots:js.lib.Map<N, js.lib.Map<flight.esm.types.interaction.Types.InteractionSignalName, js.lib.Map<flight.esm.types.interaction.Types.AnyInteractionSignalSlot, flight.esm.types.signals_contract.Types.SlotId>>>, trackedSubscribersOnly:Bool };

typedef InteractionManagerOptions = { ?cursorBackend:Null<flight.esm.types.interaction.Types.CursorBackend>, ?doubleClickDelay:Null<Float>, ?doubleClickDistance:Null<Float>, ?enabled:Null<Bool>, ?precise:Null<Bool>, ?spatialIndex:Null<flight.esm.types.spatial.Types.SpatialIndex2D>, ?suppressTouchHover:Null<Bool>, ?trackedSubscribersOnly:Null<Bool> };

typedef InteractionPointerOptions = { ?altKey:Null<Bool>, ?buttons:Null<Float>, ?ctrlKey:Null<Bool>, ?metaKey:Null<Bool>, ?pointerId:Null<Float>, ?pointerType:Null<String>, ?shiftKey:Null<Bool>, ?timeStamp:Null<Float> };

typedef InteractionPointerState<N> = { lastClickTarget:Null<N>, lastClickTime:Float, lastPointerClickButton:Float, lastPointerClickInteractionState:Null<flight.esm.types.interaction.Types.NodeInteractionState>, lastPointerClickTarget:Null<N>, lastPointerClickTime:Float, lastPointerClickX:Float, lastPointerClickY:Float, pointerDownTarget:Null<N>, pointerOverTarget:Null<N> };

typedef InteractionSignalName = String;

typedef InteractionSignals = { onClick:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onContextMenu:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onDoubleClick:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onFocusIn:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.FocusEventData>, onFocusOut:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.FocusEventData>, onKeyDown:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.KeyboardEventData>, onKeyUp:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.KeyboardEventData>, onPointerCancel:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerDoubleClick:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerDown:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerMove:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerOut:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerOver:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerRollOut:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerRollOver:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onPointerUp:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onReleaseOutside:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData>, onWheel:flight.esm.types.signals.Types.Signal<flight.esm.types.interaction.Types.PointerEventData> };

typedef KeyboardEventData = { altKey:Bool, ctrlKey:Bool, key:String, keyCode:Float, metaKey:Bool, shiftKey:Bool };

typedef Node2DInteractionSignals = flight.esm.types.interaction.Types.InteractionSignals;

typedef NodeInteractionState = { hitTestEnabled:Bool, childrenHitTestEnabled:Bool, hitArea:Dynamic, cursor:Dynamic, focusable:Bool, pointerDoubleClickEnabled:Bool, tabIndex:Float };

typedef PointerEventData = { altKey:Bool, button:Float, buttons:Float, ctrlKey:Bool, currentTarget:Null<flight.esm.types.node.Types.NodeAny>, deltaX:Float, deltaY:Float, localX:Float, localY:Float, metaKey:Bool, pointerId:Float, pointerType:flight.esm.types.input.Types.PointerType, shiftKey:Bool, target:Null<flight.esm.types.node.Types.NodeAny>, worldX:Float, worldY:Float, x:Float, y:Float };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
