package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/keyboard")
extern class Keyboard {
  public static function attachSoftKeyboard(hostSoftKeyboardChange:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardChangeCapability, hostSoftKeyboardInfo:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability, keyboard:flight.esm.types.keyboard_contract.Types.SoftKeyboard):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardAttachResult>;
  public static function createSoftKeyboard():flight.esm.types.keyboard_contract.Types.SoftKeyboard;
  public static function detachSoftKeyboard(keyboard:flight.esm.types.keyboard_contract.Types.SoftKeyboard):Void;
  public static function disposeSoftKeyboard(keyboard:flight.esm.types.keyboard_contract.Types.SoftKeyboard):Void;
  public static function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability):Float;
  public static function getSoftKeyboardInfo(hostSoftKeyboardInfo:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability, out:flight.esm.types.keyboard_contract.Types.SoftKeyboardInfo):Void;
  public static function hideSoftKeyboard(hostSoftKeyboardVisibility:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardVisibilityCapability):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardVisibilityResult>;
  public static function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability):Bool;
  public static function setSoftKeyboardAccessoryBarVisible(hostSoftKeyboardAccessoryBar:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardAccessoryBarCapability, visible:Bool):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>;
  public static function setSoftKeyboardResizeMode(hostSoftKeyboardResizeModeWrite:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardResizeModeWriteCapability, mode:String):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>;
  public static function setSoftKeyboardScrollAssistEnabled(hostSoftKeyboardScrollAssist:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardScrollAssistCapability, enabled:Bool):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>;
  public static function setSoftKeyboardStyle(hostSoftKeyboardStyle:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardStyleCapability, style:String):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardSetterResult>;
  public static function showSoftKeyboard(hostSoftKeyboardVisibility:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardVisibilityCapability):js.lib.Promise<flight.esm.types.keyboard_contract.Types.SoftKeyboardVisibilityResult>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
