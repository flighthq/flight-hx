package flight._hl._fn;

extern class Input {
	@:hlNative("flight", "flight_attach_gamepad_input")
	public static function attachGamepadInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_keyboard_input")
	public static function attachKeyboardInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_pointer_input")
	public static function attachPointerInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_relative_pointer_input")
	public static function attachRelativePointerInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_text_input")
	public static function attachTextInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_wheel_input")
	public static function attachWheelInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:Dynamic, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_detach_gamepad_input")
	public static function detachGamepadInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_keyboard_input")
	public static function detachKeyboardInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_pointer_input")
	public static function detachPointerInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_relative_pointer_input")
	public static function detachRelativePointerInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_text_input")
	public static function detachTextInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_wheel_input")
	public static function detachWheelInput(manager:Dynamic, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_apply_gamepad_axis_dead_zone")
	public static function applyGamepadAxisDeadZone(value:Single, deadZone:Single):Single;
	@:hlNative("flight", "flight_apply_gamepad_stick_dead_zone")
	public static function applyGamepadStickDeadZone(out:flight._hl.GamepadStickOutput, x:Single, y:Single, deadZone:Single):Void;
	@:hlNative("flight", "flight_get_gamepad_axis_name")
	public static function getGamepadAxisName(mapping:Int, index:Int):Int;
	@:hlNative("flight", "flight_get_gamepad_button_name")
	public static function getGamepadButtonName(mapping:Int, index:Int):Int;
	@:hlNative("flight", "flight_create_input_manager")
	public static function createInputManager():Dynamic;
	@:hlNative("flight", "flight_create_input_state")
	public static function createInputState():Dynamic;
	@:hlNative("flight", "flight_connect_input_state_to_input_manager")
	public static function connectInputStateToInputManager(state:Dynamic, manager:Dynamic):flight._hl.InputDisposer;
	@:hlNative("flight", "flight_end_input_state_frame")
	public static function endInputStateFrame(state:Dynamic):Void;
	@:hlNative("flight", "flight_get_input_gamepad_axis")
	public static function getInputGamepadAxis(state:Dynamic, gamepad:Int, axis:Int):Single;
	@:hlNative("flight", "flight_is_input_gamepad_button_down")
	public static function isInputGamepadButtonDown(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_is_input_key_down")
	public static function isInputKeyDown(state:Dynamic, keyCode:Int):Bool;
	@:hlNative("flight", "flight_is_input_pointer_button_down")
	public static function isInputPointerButtonDown(state:Dynamic, pointerId:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_gamepad_button_pressed")
	public static function wasInputGamepadButtonPressed(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_gamepad_button_released")
	public static function wasInputGamepadButtonReleased(state:Dynamic, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_key_pressed")
	public static function wasInputKeyPressed(state:Dynamic, keyCode:Int):Bool;
	@:hlNative("flight", "flight_was_input_key_released")
	public static function wasInputKeyReleased(state:Dynamic, keyCode:Int):Bool;
	@:hlNative("flight", "flight_create_input_target_handle")
	public static function createInputTargetHandle():Dynamic;
	@:hlNative("flight", "flight_create_input_key_repeat_timer")
	public static function createInputKeyRepeatTimer(options:flight._hl.InputKeyRepeatOptions):Dynamic;
	@:hlNative("flight", "flight_advance_input_key_repeat_timer")
	public static function advanceInputKeyRepeatTimer(timer:Dynamic, nowMs:Float):Void;
	@:hlNative("flight", "flight_start_input_key_repeat_timer")
	public static function startInputKeyRepeatTimer(timer:Dynamic, callback_:flight._hl.InputRepeatCallback, nowMs:Float):Void;
	@:hlNative("flight", "flight_stop_input_key_repeat_timer")
	public static function stopInputKeyRepeatTimer(timer:Dynamic):Void;
	@:hlNative("flight", "flight_free_input_disposer")
	public static function freeInputDisposer(ptr:flight._hl.InputDisposer):Void;
}
