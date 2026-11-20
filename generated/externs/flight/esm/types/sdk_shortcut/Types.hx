package flight.esm.types.sdk_shortcut;

#if (js && flight_esm)
typedef Accelerator = flight.esm.types.shortcut.Types.Accelerator;

typedef AcceleratorParseError = flight.esm.types.shortcut.Types.AcceleratorParseError;

typedef AcceleratorParseErrorReason = flight.esm.types.shortcut.Types.AcceleratorParseErrorReason;

typedef CreateGlobalShortcutOutcome = flight.esm.types.shortcut.Types.CreateGlobalShortcutOutcome;

typedef GlobalShortcut = flight.esm.types.shortcut.Types.GlobalShortcut;

typedef GlobalShortcutAttachOutcome = flight.esm.types.shortcut.Types.GlobalShortcutAttachOutcome;

typedef GlobalShortcutDetachOutcome = flight.esm.types.shortcut.Types.GlobalShortcutDetachOutcome;

typedef GlobalShortcutQueryOutcome = flight.esm.types.shortcut.Types.GlobalShortcutQueryOutcome;

typedef HostShortcutCapabilities = flight.esm.types.shortcut.Types.HostShortcutCapabilities;

typedef HostShortcutQueryCapability = flight.esm.types.shortcut.Types.HostShortcutQueryCapability;

typedef HostShortcutTriggerCapability = flight.esm.types.shortcut.Types.HostShortcutTriggerCapability;

typedef ParsedAccelerator = flight.esm.types.shortcut.Types.ParsedAccelerator;

typedef ShortcutDigitKeyName = flight.esm.types.shortcut.Types.ShortcutDigitKeyName;

typedef ShortcutEditingKeyName = flight.esm.types.shortcut.Types.ShortcutEditingKeyName;

typedef ShortcutFunctionKeyName = flight.esm.types.shortcut.Types.ShortcutFunctionKeyName;

typedef ShortcutKeyName = flight.esm.types.shortcut.Types.ShortcutKeyName;

typedef ShortcutLetterKeyName = flight.esm.types.shortcut.Types.ShortcutLetterKeyName;

typedef ShortcutLockKeyName = flight.esm.types.shortcut.Types.ShortcutLockKeyName;

typedef ShortcutMediaKeyName = flight.esm.types.shortcut.Types.ShortcutMediaKeyName;

typedef ShortcutModifier = flight.esm.types.shortcut.Types.ShortcutModifier;

typedef ShortcutNavigationKeyName = flight.esm.types.shortcut.Types.ShortcutNavigationKeyName;

typedef ShortcutNumpadKeyName = flight.esm.types.shortcut.Types.ShortcutNumpadKeyName;

typedef ShortcutPunctuationKeyName = flight.esm.types.shortcut.Types.ShortcutPunctuationKeyName;

typedef ShortcutTriggerSubscribeOutcome = flight.esm.types.shortcut.Types.ShortcutTriggerSubscribeOutcome;

typedef ShortcutTriggerSubscription = flight.esm.types.shortcut.Types.ShortcutTriggerSubscription;

typedef ShortcutTriggerUnsubscribeOutcome = flight.esm.types.shortcut.Types.ShortcutTriggerUnsubscribeOutcome;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
