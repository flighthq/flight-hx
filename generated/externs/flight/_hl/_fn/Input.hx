package flight._hl._fn;

extern class Input {
	@:hlNative("flight", "flight_attach_gamepad_input")
	public static function attachGamepadInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_keyboard_input")
	public static function attachKeyboardInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_pointer_input")
	public static function attachPointerInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_relative_pointer_input")
	public static function attachRelativePointerInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_text_input")
	public static function attachTextInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_attach_wheel_input")
	public static function attachWheelInput(hostInputIngress:flight._hl.HostInputIngressCapability, manager:hl.Bytes, source:flight._hl.InputIngressSource, options:flight._hl.AttachInputOptions):Void;
	@:hlNative("flight", "flight_detach_gamepad_input")
	public static function detachGamepadInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_keyboard_input")
	public static function detachKeyboardInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_pointer_input")
	public static function detachPointerInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_relative_pointer_input")
	public static function detachRelativePointerInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_text_input")
	public static function detachTextInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_detach_wheel_input")
	public static function detachWheelInput(manager:hl.Bytes, source:flight._hl.InputIngressSource):Void;
	@:hlNative("flight", "flight_apply_gamepad_axis_dead_zone")
	public static function applyGamepadAxisDeadZone(value:Single, deadZone:Single):Single;
	@:hlNative("flight", "flight_apply_gamepad_stick_dead_zone")
	public static function applyGamepadStickDeadZone(out:flight._hl.GamepadStickOutput, x:Single, y:Single, deadZone:Single):Void;
	@:hlNative("flight", "flight_get_gamepad_axis_name")
	public static function getGamepadAxisName(mapping:Int, index:Int):Int;
	@:hlNative("flight", "flight_get_gamepad_button_name")
	public static function getGamepadButtonName(mapping:Int, index:Int):Int;
	@:hlNative("flight", "flight_create_input_manager")
	public static function createInputManager():hl.Bytes;
	@:hlNative("flight", "flight_create_input_state")
	public static function createInputState():hl.Bytes;
	@:hlNative("flight", "flight_connect_input_state_to_input_manager")
	public static function connectInputStateToInputManager(state:hl.Bytes, manager:hl.Bytes):flight._hl.InputDisposer;
	@:hlNative("flight", "flight_end_input_state_frame")
	public static function endInputStateFrame(state:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_input_gamepad_axis")
	public static function getInputGamepadAxis(state:hl.Bytes, gamepad:Int, axis:Int):Single;
	@:hlNative("flight", "flight_is_input_gamepad_button_down")
	public static function isInputGamepadButtonDown(state:hl.Bytes, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_is_input_key_down")
	public static function isInputKeyDown(state:hl.Bytes, keyCode:Int):Bool;
	@:hlNative("flight", "flight_is_input_pointer_button_down")
	public static function isInputPointerButtonDown(state:hl.Bytes, pointerId:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_gamepad_button_pressed")
	public static function wasInputGamepadButtonPressed(state:hl.Bytes, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_gamepad_button_released")
	public static function wasInputGamepadButtonReleased(state:hl.Bytes, gamepad:Int, button:Int):Bool;
	@:hlNative("flight", "flight_was_input_key_pressed")
	public static function wasInputKeyPressed(state:hl.Bytes, keyCode:Int):Bool;
	@:hlNative("flight", "flight_was_input_key_released")
	public static function wasInputKeyReleased(state:hl.Bytes, keyCode:Int):Bool;
	@:hlNative("flight", "flight_create_input_target_handle")
	public static function createInputTargetHandle():hl.Bytes;
	@:hlNative("flight", "flight_create_input_key_repeat_timer")
	public static function createInputKeyRepeatTimer(options:flight._hl.InputKeyRepeatOptions):hl.Bytes;
	@:hlNative("flight", "flight_advance_input_key_repeat_timer")
	public static function advanceInputKeyRepeatTimer(timer:hl.Bytes, nowMs:Float):Void;
	@:hlNative("flight", "flight_stop_input_key_repeat_timer")
	public static function stopInputKeyRepeatTimer(timer:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_input_manager_ref")
	public static function freeInputManagerRef(ptr:flight._hl.InputManager):Void;
	@:hlNative("flight", "flight_free_input_state_ref")
	public static function freeInputStateRef(ptr:flight._hl.InputState):Void;
	@:hlNative("flight", "flight_free_input_disposer")
	public static function freeInputDisposer(ptr:flight._hl.InputDisposer):Void;
	@:hlNative("flight", "flight_free_input_target_handle_ref")
	public static function freeInputTargetHandleRef(ptr:flight._hl.InputTargetHandle):Void;
	@:hlNative("flight", "flight_free_input_key_repeat_timer_ref")
	public static function freeInputKeyRepeatTimerRef(ptr:flight._hl.InputKeyRepeatTimer):Void;
}
