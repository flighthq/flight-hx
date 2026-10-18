// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Clock = flight._cpp.Clock;

extern inline function addClockChild(parent:flight.Clock, child:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_addClockChild.addClockChild(parent, child);
}

extern inline function advanceClock(clock:flight.Clock, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_Clock_advanceClock.advanceClock(clock, deltaTime);
}

extern inline function createChildClock(parent:flight.Clock, ?options:flight.ClockOptions):flight.Clock {
  return flight._cpp._attempt.Attempt_Clock_createChildClock.createChildClock(parent, options);
}

extern inline function createClock(?options:flight.ClockOptions):flight.Clock {
  return flight._cpp._attempt.Attempt_Clock_createClock.createClock(options);
}

extern inline function disposeClock(clock:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_disposeClock.disposeClock(clock);
}

extern inline function enableClockSignals(clock:flight.Clock):flight.Signal<(Float)->Void> {
  return flight._cpp._attempt.Attempt_Clock_enableClockSignals.enableClockSignals(clock);
}

extern inline function getClockEffectiveScale(clock:flight.Clock):Float {
  return flight._cpp._attempt.Attempt_Clock_getClockEffectiveScale.getClockEffectiveScale(clock);
}

extern inline function getClockParent(clock:flight.Clock):Null<flight.Clock> {
  return flight._cpp._attempt.Attempt_Clock_getClockParent.getClockParent(clock);
}

extern inline function initializeClock(out:flight.EntityConstruction<flight.Clock>, ?options:flight.ClockOptions):Void {
  flight._cpp._attempt.Attempt_Clock_initializeClock.initializeClock(out, options);
}

extern inline function isClockEffectivelyPaused(clock:flight.Clock):Bool {
  return flight._cpp._attempt.Attempt_Clock_isClockEffectivelyPaused.isClockEffectivelyPaused(clock);
}

extern inline function pauseClock(clock:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_pauseClock.pauseClock(clock);
}

extern inline function removeClockChild(parent:flight.Clock, child:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_removeClockChild.removeClockChild(parent, child);
}

extern inline function resetClock(clock:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_resetClock.resetClock(clock);
}

extern inline function resumeClock(clock:flight.Clock):Void {
  flight._cpp._attempt.Attempt_Clock_resumeClock.resumeClock(clock);
}

extern inline function setClockScale(clock:flight.Clock, scale:Float):Void {
  flight._cpp._attempt.Attempt_Clock_setClockScale.setClockScale(clock, scale);
}
