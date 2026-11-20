package flight.esm.types.input_contract;

#if (js && flight_esm)
typedef AttachInputOptions = flight.esm.types.input.Types.AttachInputOptions;

typedef GamepadAxisKind = flight.esm.types.input.Types.GamepadAxisKind;

typedef GamepadButtonKind = flight.esm.types.input.Types.GamepadButtonKind;

typedef GamepadMapping = flight.esm.types.input.Types.GamepadMapping;

typedef GamepadStickOutput = flight.esm.types.input.Types.GamepadStickOutput;

typedef HostInputCapabilities = flight.esm.types.input.Types.HostInputCapabilities;

typedef HostInputDropFileCapability = flight.esm.types.input.Types.HostInputDropFileCapability;

typedef HostInputFocusCapability = flight.esm.types.input.Types.HostInputFocusCapability;

typedef HostInputIngressCapability = flight.esm.types.input.Types.HostInputIngressCapability;

typedef HostInputPointerLockCapability = flight.esm.types.input.Types.HostInputPointerLockCapability;

typedef HostInputTargetCapability = flight.esm.types.input.Types.HostInputTargetCapability;

typedef InputDisposer = flight.esm.types.input.Types.InputDisposer;

typedef InputGamepadAxisData = flight.esm.types.input.Types.InputGamepadAxisData;

typedef InputGamepadButtonData = flight.esm.types.input.Types.InputGamepadButtonData;

typedef InputGamepadConnectData = flight.esm.types.input.Types.InputGamepadConnectData;

typedef InputIngressAttach = flight.esm.types.input.Types.InputIngressAttach;

typedef InputIngressRelease = flight.esm.types.input.Types.InputIngressRelease;

typedef InputIngressSink = flight.esm.types.input.Types.InputIngressSink;

typedef InputKeyRepeatOptions = flight.esm.types.input.Types.InputKeyRepeatOptions;

typedef InputKeyRepeatTimerRaw = flight.esm.types.input.Types.InputKeyRepeatTimerRaw;

typedef InputKeyboardData = flight.esm.types.input.Types.InputKeyboardData;

typedef InputManagerRaw = flight.esm.types.input.Types.InputManagerRaw;

typedef InputPointerData = flight.esm.types.input.Types.InputPointerData;

typedef InputPointerLockExitFuture = flight.esm.types.input.Types.InputPointerLockExitFuture;

typedef InputPointerLockExitOutcome = flight.esm.types.input.Types.InputPointerLockExitOutcome;

typedef InputPointerLockExitReason = flight.esm.types.input.Types.InputPointerLockExitReason;

typedef InputPointerLockRequestFuture = flight.esm.types.input.Types.InputPointerLockRequestFuture;

typedef InputPointerLockRequestOutcome = flight.esm.types.input.Types.InputPointerLockRequestOutcome;

typedef InputPointerLockRequestReason = flight.esm.types.input.Types.InputPointerLockRequestReason;

typedef InputRepeatCallback = flight.esm.types.input.Types.InputRepeatCallback;

typedef InputSignalsRaw = flight.esm.types.input.Types.InputSignalsRaw;

typedef InputStateRaw = flight.esm.types.input.Types.InputStateRaw;

typedef InputTargetHandleRaw = flight.esm.types.input.Types.InputTargetHandleRaw;

typedef InputTextData = flight.esm.types.input.Types.InputTextData;

typedef KeyCode = flight.esm.types.input.Types.KeyCode;

typedef KeyModifier = flight.esm.types.input.Types.KeyModifier;

typedef MouseWheelMode = flight.esm.types.input.Types.MouseWheelMode;

typedef PointerType = flight.esm.types.input.Types.PointerType;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
