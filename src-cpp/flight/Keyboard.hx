// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function attachSoftKeyboard(hostSoftKeyboardChange:flight.HostSoftKeyboardChangeCapability, hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability, keyboard:flight.SoftKeyboard):flight._internal._Promise<flight.SoftKeyboardAttachResult> {
  return flight._cpp._attempt.Attempt_Keyboard_attachSoftKeyboard.attachSoftKeyboard(hostSoftKeyboardChange, hostSoftKeyboardInfo, keyboard);
}

extern inline function createSoftKeyboard():Dynamic {
  return flight._cpp._attempt.Attempt_Keyboard_createSoftKeyboard.createSoftKeyboard();
}

extern inline function detachSoftKeyboard(keyboard:flight.SoftKeyboard):Void {
  flight._cpp._attempt.Attempt_Keyboard_detachSoftKeyboard.detachSoftKeyboard(keyboard);
}

extern inline function disposeSoftKeyboard(keyboard:flight.SoftKeyboard):Void {
  flight._cpp._attempt.Attempt_Keyboard_disposeSoftKeyboard.disposeSoftKeyboard(keyboard);
}

extern inline function getSoftKeyboardHeight(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Float {
  return flight._cpp._attempt.Attempt_Keyboard_getSoftKeyboardHeight.getSoftKeyboardHeight(hostSoftKeyboardInfo);
}

extern inline function getSoftKeyboardInfo(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability, out:flight.SoftKeyboardInfo):flight.SoftKeyboardInfo {
  return flight._cpp._attempt.Attempt_Keyboard_getSoftKeyboardInfo.getSoftKeyboardInfo(hostSoftKeyboardInfo, out);
}

extern inline function hideSoftKeyboard(hostSoftKeyboardVisibility:flight.HostSoftKeyboardVisibilityCapability):flight._internal._Promise<flight.SoftKeyboardVisibilityResult> {
  return flight._cpp._attempt.Attempt_Keyboard_hideSoftKeyboard.hideSoftKeyboard(hostSoftKeyboardVisibility);
}

extern inline function initializeSoftKeyboard(out:flight.EntityConstruction<Dynamic>):Void {
  flight._cpp._attempt.Attempt_Keyboard_initializeSoftKeyboard.initializeSoftKeyboard(out);
}

extern inline function isSoftKeyboardVisible(hostSoftKeyboardInfo:flight.HostSoftKeyboardInfoCapability):Bool {
  return flight._cpp._attempt.Attempt_Keyboard_isSoftKeyboardVisible.isSoftKeyboardVisible(hostSoftKeyboardInfo);
}

extern inline function setSoftKeyboardAccessoryBarVisible(hostSoftKeyboardAccessoryBar:flight.HostSoftKeyboardAccessoryBarCapability, visible:Bool):flight._internal._Promise<flight.SoftKeyboardSetterResult> {
  return flight._cpp._attempt.Attempt_Keyboard_setSoftKeyboardAccessoryBarVisible.setSoftKeyboardAccessoryBarVisible(hostSoftKeyboardAccessoryBar, visible);
}

extern inline function setSoftKeyboardResizeMode(hostSoftKeyboardResizeModeWrite:flight.HostSoftKeyboardResizeModeWriteCapability, mode:flight.SoftKeyboardResizeMode):flight._internal._Promise<flight.SoftKeyboardSetterResult> {
  return flight._cpp._attempt.Attempt_Keyboard_setSoftKeyboardResizeMode.setSoftKeyboardResizeMode(hostSoftKeyboardResizeModeWrite, mode);
}

extern inline function setSoftKeyboardScrollAssistEnabled(hostSoftKeyboardScrollAssist:flight.HostSoftKeyboardScrollAssistCapability, enabled:Bool):flight._internal._Promise<flight.SoftKeyboardSetterResult> {
  return flight._cpp._attempt.Attempt_Keyboard_setSoftKeyboardScrollAssistEnabled.setSoftKeyboardScrollAssistEnabled(hostSoftKeyboardScrollAssist, enabled);
}

extern inline function setSoftKeyboardStyle(hostSoftKeyboardStyle:flight.HostSoftKeyboardStyleCapability, style:flight.SoftKeyboardStyleKind):flight._internal._Promise<flight.SoftKeyboardSetterResult> {
  return flight._cpp._attempt.Attempt_Keyboard_setSoftKeyboardStyle.setSoftKeyboardStyle(hostSoftKeyboardStyle, style);
}

extern inline function showSoftKeyboard(hostSoftKeyboardVisibility:flight.HostSoftKeyboardVisibilityCapability):flight._internal._Promise<flight.SoftKeyboardVisibilityResult> {
  return flight._cpp._attempt.Attempt_Keyboard_showSoftKeyboard.showSoftKeyboard(hostSoftKeyboardVisibility);
}
