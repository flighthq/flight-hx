package flight.esm.types.keyboard_contract;

#if (js && flight_esm)
typedef HostSoftKeyboardAccessoryBarCapability = { setAccessoryBarVisible:((visible:Bool) -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>) };

typedef HostSoftKeyboardChangeCapability = { subscribe:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardChangeSubscription>) };

typedef HostSoftKeyboardInfoCapability = { getInfo:((out:flight.esm.types.keyboard_contract.Types.SoftKeyboardInfo) -> Void) };

typedef HostSoftKeyboardResizeModeWriteCapability = { setResizeMode:((mode:String) -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>) };

typedef HostSoftKeyboardScrollAssistCapability = { setScrollAssistEnabled:((enabled:Bool) -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>) };

typedef HostSoftKeyboardStyleCapability = { setStyle:((style:String) -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>) };

typedef HostSoftKeyboardVisibilityCapability = { show:(() -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardVisibilityResult>), hide:(() -> js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardVisibilityResult>) };

typedef SoftKeyboard = { onShow:flight.esm.types.signals.Types.Signal<Float>, onHide:flight.esm.types.signals.Types.Signal<Void>, onResize:flight.esm.types.signals.Types.Signal<Float> };

typedef SoftKeyboardAttachResult = String;

typedef SoftKeyboardChangeSubscription = { result:flight.esm.types.keyboard_contract.Types.SoftKeyboardAttachResult, unsubscribe:Null<(() -> Void)> };

typedef SoftKeyboardInfo = { visible:Bool, height:Float, x:Float, y:Float, width:Float };

typedef SoftKeyboardResizeMode = String;

typedef SoftKeyboardSetterResult = String;

typedef SoftKeyboardStyleKind = String;

typedef SoftKeyboardVisibilityResult = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
