// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function cancelDeviceVibration(hostHaptics:flight.HostHapticsCapability):Bool {
  return flight._cpp._attempt.Attempt_Haptics_cancelDeviceVibration.cancelDeviceVibration(hostHaptics);
}

extern inline function getHapticsCapabilities(hostHaptics:flight.HostHapticsCapability, out:flight.HapticsCapabilities):flight.HapticsCapabilities {
  return flight._cpp._attempt.Attempt_Haptics_getHapticsCapabilities.getHapticsCapabilities(hostHaptics, out);
}

extern inline function isHapticsSupported(hostHaptics:flight.HostHapticsCapability):Bool {
  return flight._cpp._attempt.Attempt_Haptics_isHapticsSupported.isHapticsSupported(hostHaptics);
}

extern inline function prepareHaptics(hostHaptics:flight.HostHapticsCapability):Void {
  flight._cpp._attempt.Attempt_Haptics_prepareHaptics.prepareHaptics(hostHaptics);
}

extern inline function triggerHapticImpact(hostHaptics:flight.HostHapticsCapability, style:flight.HapticImpactStyle, ?intensity:Float):Bool {
  return flight._cpp._attempt.Attempt_Haptics_triggerHapticImpact.triggerHapticImpact(hostHaptics, style, intensity);
}

extern inline function triggerHapticNotification(hostHaptics:flight.HostHapticsCapability, type:flight.HapticNotificationType):Bool {
  return flight._cpp._attempt.Attempt_Haptics_triggerHapticNotification.triggerHapticNotification(hostHaptics, type);
}

extern inline function triggerHapticSelection(hostHaptics:flight.HostHapticsCapability):Bool {
  return flight._cpp._attempt.Attempt_Haptics_triggerHapticSelection.triggerHapticSelection(hostHaptics);
}

extern inline function vibrateDevice(hostHaptics:flight.HostHapticsCapability, durationMs:Float):Bool {
  return flight._cpp._attempt.Attempt_Haptics_vibrateDevice.vibrateDevice(hostHaptics, durationMs);
}

extern inline function vibrateDevicePattern(hostHaptics:flight.HostHapticsCapability, pattern:Array<Float>):Bool {
  return flight._cpp._attempt.Attempt_Haptics_vibrateDevicePattern.vibrateDevicePattern(hostHaptics, pattern);
}

extern inline function vibrateDeviceWaveform(hostHaptics:flight.HostHapticsCapability, timings:Array<Float>, amplitudes:Array<Float>, ?repeat:Float):Bool {
  return flight._cpp._attempt.Attempt_Haptics_vibrateDeviceWaveform.vibrateDeviceWaveform(hostHaptics, timings, amplitudes, repeat);
}
