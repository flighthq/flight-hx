package flight._js._fn;

@:jsRequire("@flighthq/input")
extern class Input {
	@:native("attachGamepadInput")
	public static function attachGamepadInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("attachKeyboardInput")
	public static function attachKeyboardInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("attachPointerInput")
	public static function attachPointerInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("attachRelativePointerInput")
	public static function attachRelativePointerInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("attachTextInput")
	public static function attachTextInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("attachWheelInput")
	public static function attachWheelInput(hostInputIngress:flight._js.HostInputIngressCapability, manager:Dynamic, source:flight._js.InputIngressSource, options:Null<flight._js.AttachInputOptions>):Void;
	@:native("detachGamepadInput")
	public static function detachGamepadInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("detachKeyboardInput")
	public static function detachKeyboardInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("detachPointerInput")
	public static function detachPointerInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("detachRelativePointerInput")
	public static function detachRelativePointerInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("detachTextInput")
	public static function detachTextInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("detachWheelInput")
	public static function detachWheelInput(manager:Dynamic, source:flight._js.InputIngressSource):Void;
	@:native("applyGamepadAxisDeadZone")
	public static function applyGamepadAxisDeadZone(value:Float, deadZone:Float):Float;
	@:native("applyGamepadStickDeadZone")
	public static function applyGamepadStickDeadZone(out:flight._js.GamepadStickOutput, x:Float, y:Float, deadZone:Float):Void;
	@:native("getGamepadAxisName")
	public static function getGamepadAxisName(mapping:Dynamic, index:Int):Null<Dynamic>;
	@:native("getGamepadButtonName")
	public static function getGamepadButtonName(mapping:Dynamic, index:Int):Null<Dynamic>;
	@:native("createInputManager")
	public static function createInputManager():Dynamic;
	@:native("createInputState")
	public static function createInputState():Dynamic;
	@:native("connectInputStateToInputManager")
	public static function connectInputStateToInputManager(state:Dynamic, manager:Dynamic):flight._js.InputDisposer;
	@:native("endInputStateFrame")
	public static function endInputStateFrame(state:Dynamic):Void;
	@:native("getInputGamepadAxis")
	public static function getInputGamepadAxis(state:Dynamic, gamepad:Int, axis:Int):Float;
	@:native("isInputGamepadButtonDown")
	public static function isInputGamepadButtonDown(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:native("isInputKeyDown")
	public static function isInputKeyDown(state:Dynamic, keyCode:Int):Bool;
	@:native("isInputPointerButtonDown")
	public static function isInputPointerButtonDown(state:Dynamic, pointerId:Int, button:Int):Bool;
	@:native("wasInputGamepadButtonPressed")
	public static function wasInputGamepadButtonPressed(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:native("wasInputGamepadButtonReleased")
	public static function wasInputGamepadButtonReleased(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:native("wasInputKeyPressed")
	public static function wasInputKeyPressed(state:Dynamic, keyCode:Int):Bool;
	@:native("wasInputKeyReleased")
	public static function wasInputKeyReleased(state:Dynamic, keyCode:Int):Bool;
	@:native("createInputTargetHandle")
	public static function createInputTargetHandle():Dynamic;
	@:native("createInputKeyRepeatTimer")
	public static function createInputKeyRepeatTimer(options:flight._js.InputKeyRepeatOptions):Dynamic;
	@:native("advanceInputKeyRepeatTimer")
	public static function advanceInputKeyRepeatTimer(timer:Dynamic, nowMs:Float):Void;
	@:native("startInputKeyRepeatTimer")
	public static function startInputKeyRepeatTimer(timer:Dynamic, callback_:flight._js.InputRepeatCallback, nowMs:Float):Void;
	@:native("stopInputKeyRepeatTimer")
	public static function stopInputKeyRepeatTimer(timer:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputManagerRef(ptr:flight._js.InputManager):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputStateRef(ptr:flight._js.InputState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputDisposer(ptr:flight._js.InputDisposer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputTargetHandleRef(ptr:flight._js.InputTargetHandle):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInputKeyRepeatTimerRef(ptr:flight._js.InputKeyRepeatTimer):Void {}
}
