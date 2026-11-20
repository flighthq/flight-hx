package flight._cpp._fn;

extern class Input {
	@:native("flight_attach_gamepad_input")
	public static function attachGamepadInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_attach_keyboard_input")
	public static function attachKeyboardInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_attach_pointer_input")
	public static function attachPointerInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_attach_relative_pointer_input")
	public static function attachRelativePointerInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_attach_text_input")
	public static function attachTextInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_attach_wheel_input")
	public static function attachWheelInput(hostInputIngress:flight._cpp.HostInputIngressCapability, manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource, options:flight._cpp.AttachInputOptions):Void;
	@:native("flight_detach_gamepad_input")
	public static function detachGamepadInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_detach_keyboard_input")
	public static function detachKeyboardInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_detach_pointer_input")
	public static function detachPointerInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_detach_relative_pointer_input")
	public static function detachRelativePointerInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_detach_text_input")
	public static function detachTextInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_detach_wheel_input")
	public static function detachWheelInput(manager:cpp.Star<cpp.Void>, source:flight._cpp.InputIngressSource):Void;
	@:native("flight_apply_gamepad_axis_dead_zone")
	public static function applyGamepadAxisDeadZone(value:Single, deadZone:Single):Single;
	@:native("flight_apply_gamepad_stick_dead_zone")
	public static function applyGamepadStickDeadZone(out:flight._cpp.GamepadStickOutput, x:Single, y:Single, deadZone:Single):Void;
	@:native("flight_get_gamepad_axis_name")
	public static function getGamepadAxisName(mapping:Int, index:Int):Int;
	@:native("flight_get_gamepad_button_name")
	public static function getGamepadButtonName(mapping:Int, index:Int):Int;
	@:native("flight_create_input_manager")
	public static function createInputManager():cpp.Star<cpp.Void>;
	@:native("flight_create_input_state")
	public static function createInputState():cpp.Star<cpp.Void>;
	@:native("flight_connect_input_state_to_input_manager")
	public static function connectInputStateToInputManager(state:cpp.Star<cpp.Void>, manager:cpp.Star<cpp.Void>):flight._cpp.InputDisposer;
	@:native("flight_end_input_state_frame")
	public static function endInputStateFrame(state:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_input_gamepad_axis")
	public static function getInputGamepadAxis(state:cpp.Star<cpp.Void>, gamepad:Int, axis:Int):Single;
	@:native("flight_is_input_gamepad_button_down")
	public static function isInputGamepadButtonDown(state:cpp.Star<cpp.Void>, gamepad:Int, button:Int):Bool;
	@:native("flight_is_input_key_down")
	public static function isInputKeyDown(state:cpp.Star<cpp.Void>, keyCode:Int):Bool;
	@:native("flight_is_input_pointer_button_down")
	public static function isInputPointerButtonDown(state:cpp.Star<cpp.Void>, pointerId:Int, button:Int):Bool;
	@:native("flight_was_input_gamepad_button_pressed")
	public static function wasInputGamepadButtonPressed(state:cpp.Star<cpp.Void>, gamepad:Int, button:Int):Bool;
	@:native("flight_was_input_gamepad_button_released")
	public static function wasInputGamepadButtonReleased(state:cpp.Star<cpp.Void>, gamepad:Int, button:Int):Bool;
	@:native("flight_was_input_key_pressed")
	public static function wasInputKeyPressed(state:cpp.Star<cpp.Void>, keyCode:Int):Bool;
	@:native("flight_was_input_key_released")
	public static function wasInputKeyReleased(state:cpp.Star<cpp.Void>, keyCode:Int):Bool;
	@:native("flight_create_input_target_handle")
	public static function createInputTargetHandle():cpp.Star<cpp.Void>;
	@:native("flight_create_input_key_repeat_timer")
	public static function createInputKeyRepeatTimer(options:flight._cpp.InputKeyRepeatOptions):cpp.Star<cpp.Void>;
	@:native("flight_advance_input_key_repeat_timer")
	public static function advanceInputKeyRepeatTimer(timer:cpp.Star<cpp.Void>, nowMs:Float):Void;
	@:native("flight_stop_input_key_repeat_timer")
	public static function stopInputKeyRepeatTimer(timer:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_input_manager_ref")
	public static function freeInputManagerRef(ptr:flight._cpp.InputManager):Void;
	@:native("flight_free_input_state_ref")
	public static function freeInputStateRef(ptr:flight._cpp.InputState):Void;
	@:native("flight_free_input_disposer")
	public static function freeInputDisposer(ptr:flight._cpp.InputDisposer):Void;
	@:native("flight_free_input_target_handle_ref")
	public static function freeInputTargetHandleRef(ptr:flight._cpp.InputTargetHandle):Void;
	@:native("flight_free_input_key_repeat_timer_ref")
	public static function freeInputKeyRepeatTimerRef(ptr:flight._cpp.InputKeyRepeatTimer):Void;
}
