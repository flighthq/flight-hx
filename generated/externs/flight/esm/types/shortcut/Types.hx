package flight.esm.types.shortcut;

#if (js && flight_esm)
typedef Accelerator = String;

typedef AcceleratorParseError = { token:String, reason:flight.esm.types.shortcut.Types.AcceleratorParseErrorReason };

typedef AcceleratorParseErrorReason = String;

typedef CreateGlobalShortcutOutcome = { reason:String };

typedef GlobalShortcut = { accelerator:String, onTrigger:flight.esm.types.signals.Types.Signal<Void> };

typedef GlobalShortcutAttachOutcome = Dynamic;

typedef GlobalShortcutDetachOutcome = Dynamic;

typedef GlobalShortcutQueryOutcome = Dynamic;

typedef HostShortcutCapabilities = { ?query:Null<flight.esm.types.shortcut.Types.HostShortcutQueryCapability>, ?trigger:Null<flight.esm.types.shortcut.Types.HostShortcutTriggerCapability> };

typedef HostShortcutQueryCapability = { isRegistered:((accelerator:String) -> js.lib.Promise<Bool>) };

typedef HostShortcutTriggerCapability = { destroy:(() -> js.lib.Promise<Void>), subscribe:((accelerator:String, trigger:Dynamic) -> js.lib.Promise<flight.esm.types.shortcut.Types.ShortcutTriggerSubscribeOutcome>), unsubscribe:((subscription:flight.esm.types.shortcut.Types.ShortcutTriggerSubscription) -> js.lib.Promise<flight.esm.types.shortcut.Types.ShortcutTriggerUnsubscribeOutcome>) };

typedef ParsedAccelerator = { key:String, modifiers:Array<flight.esm.types.shortcut.Types.ShortcutModifier> };

typedef ShortcutDigitKeyName = String;

typedef ShortcutEditingKeyName = String;

typedef ShortcutFunctionKeyName = String;

typedef ShortcutKeyName = String;

typedef ShortcutLetterKeyName = String;

typedef ShortcutLockKeyName = String;

typedef ShortcutMediaKeyName = String;

typedef ShortcutModifier = String;

typedef ShortcutNavigationKeyName = String;

typedef ShortcutNumpadKeyName = String;

typedef ShortcutPunctuationKeyName = String;

typedef ShortcutTriggerSubscribeOutcome = { reason:String };

typedef ShortcutTriggerSubscription = Dynamic;

typedef ShortcutTriggerUnsubscribeOutcome = { reason:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
