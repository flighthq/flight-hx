// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef Clock = flight._cpp.Clock;

extern inline function addClockChild(parent:flight.Clock, child:flight.Clock):Void {
  flight._cpp._fn.Clock.addClockChild(parent, child);
}

extern inline function advanceClock(clock:flight.Clock, deltaTime:Float):Void {
  flight._cpp._fn.Clock.advanceClock(clock, deltaTime);
}

extern inline function createChildClock(parent:flight.Clock, ?options:flight.ClockOptions):flight.Clock {
  return flight._cpp._fn.Clock.createChildClock(parent, options);
}

extern inline function createClock(?options:flight.ClockOptions):flight.Clock {
  return flight._cpp._fn.Clock.createClock(options);
}

extern inline function disposeClock(clock:flight.Clock):Void {
  flight._cpp._fn.Clock.disposeClock(clock);
}

extern inline function getClockEffectiveScale(clock:flight.Clock):Float {
  return flight._cpp._fn.Clock.getClockEffectiveScale(clock);
}

extern inline function getClockParent(clock:flight.Clock):Null<flight.Clock> {
  return flight._cpp._fn.Clock.getClockParent(clock);
}

extern inline function isClockEffectivelyPaused(clock:flight.Clock):Bool {
  return flight._cpp._fn.Clock.isClockEffectivelyPaused(clock);
}

extern inline function pauseClock(clock:flight.Clock):Void {
  flight._cpp._fn.Clock.pauseClock(clock);
}

extern inline function removeClockChild(parent:flight.Clock, child:flight.Clock):Void {
  flight._cpp._fn.Clock.removeClockChild(parent, child);
}

extern inline function resetClock(clock:flight.Clock):Void {
  flight._cpp._fn.Clock.resetClock(clock);
}

extern inline function resumeClock(clock:flight.Clock):Void {
  flight._cpp._fn.Clock.resumeClock(clock);
}

extern inline function setClockScale(clock:flight.Clock, scale:Float):Void {
  flight._cpp._fn.Clock.setClockScale(clock, scale);
}

extern inline function enableClockSignals(clock:flight.Clock):flight.Signal<(Float)->Void> {
  return flight._cpp._attempt.Attempt_Clock_enableClockSignals.enableClockSignals(clock);
}

extern inline function initializeClock(out:flight.EntityConstruction<flight.Clock>, ?options:flight.ClockOptions):Void {
  flight._cpp._attempt.Attempt_Clock_initializeClock.initializeClock(out, options);
}
