package flight;

#if hl

typedef Clock = flight._hl.Clock;

#elseif cpp

typedef Clock = flight._cpp.Clock;

#elseif (js && flight_esm)

typedef Clock = flight._js.Clock;

#elseif js

#error "flight.Clock on js requires flight_esm."

#else

#error "flight.Clock: no backend for this target."

#end

extern inline function createChildClock(parent:Dynamic, options:ClockOptions):Dynamic {
#if hl
	return flight._hl._fn.Clock.createChildClock(parent, options);
#elseif cpp
	return flight._cpp._fn.Clock.createChildClock(parent, options);
#elseif (js && flight_esm)
	return flight._js._fn.Clock.createChildClock(parent, options);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function createClock():Dynamic {
#if hl
	return flight._hl._fn.Clock.createClock();
#elseif cpp
	return flight._cpp._fn.Clock.createClock();
#elseif (js && flight_esm)
	return flight._js._fn.Clock.createClock();
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function addClockChild(parent:Dynamic, child:Dynamic):Void {
#if hl
	flight._hl._fn.Clock.addClockChild(parent, child);
#elseif cpp
	flight._cpp._fn.Clock.addClockChild(parent, child);
#elseif (js && flight_esm)
	flight._js._fn.Clock.addClockChild(parent, child);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function advanceClock(clock:Dynamic, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Clock.advanceClock(clock, deltaTime);
#elseif cpp
	flight._cpp._fn.Clock.advanceClock(clock, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Clock.advanceClock(clock, deltaTime);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function disposeClock(clock:Dynamic):Void {
#if hl
	flight._hl._fn.Clock.disposeClock(clock);
#elseif cpp
	flight._cpp._fn.Clock.disposeClock(clock);
#elseif (js && flight_esm)
	flight._js._fn.Clock.disposeClock(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function getClockEffectiveScale(clock:Clock):Float {
#if hl
	return flight._hl._fn.Clock.getClockEffectiveScale(clock);
#elseif cpp
	return flight._cpp._fn.Clock.getClockEffectiveScale(clock);
#elseif (js && flight_esm)
	return flight._js._fn.Clock.getClockEffectiveScale(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function getClockParent(clock:Clock):Dynamic {
#if hl
	return flight._hl._fn.Clock.getClockParent(clock);
#elseif cpp
	return flight._cpp._fn.Clock.getClockParent(clock);
#elseif (js && flight_esm)
	return flight._js._fn.Clock.getClockParent(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function isClockEffectivelyPaused(clock:Clock):Bool {
#if hl
	return flight._hl._fn.Clock.isClockEffectivelyPaused(clock);
#elseif cpp
	return flight._cpp._fn.Clock.isClockEffectivelyPaused(clock);
#elseif (js && flight_esm)
	return flight._js._fn.Clock.isClockEffectivelyPaused(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function pauseClock(clock:Clock):Void {
#if hl
	flight._hl._fn.Clock.pauseClock(clock);
#elseif cpp
	flight._cpp._fn.Clock.pauseClock(clock);
#elseif (js && flight_esm)
	flight._js._fn.Clock.pauseClock(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function removeClockChild(parent:Dynamic, child:Dynamic):Void {
#if hl
	flight._hl._fn.Clock.removeClockChild(parent, child);
#elseif cpp
	flight._cpp._fn.Clock.removeClockChild(parent, child);
#elseif (js && flight_esm)
	flight._js._fn.Clock.removeClockChild(parent, child);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function resetClock(clock:Clock):Void {
#if hl
	flight._hl._fn.Clock.resetClock(clock);
#elseif cpp
	flight._cpp._fn.Clock.resetClock(clock);
#elseif (js && flight_esm)
	flight._js._fn.Clock.resetClock(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function resumeClock(clock:Clock):Void {
#if hl
	flight._hl._fn.Clock.resumeClock(clock);
#elseif cpp
	flight._cpp._fn.Clock.resumeClock(clock);
#elseif (js && flight_esm)
	flight._js._fn.Clock.resumeClock(clock);
#else
	#error "flight.Clock: no backend for this target."
#end
}
extern inline function setClockScale(clock:Clock, scale:Float):Void {
#if hl
	flight._hl._fn.Clock.setClockScale(clock, scale);
#elseif cpp
	flight._cpp._fn.Clock.setClockScale(clock, scale);
#elseif (js && flight_esm)
	flight._js._fn.Clock.setClockScale(clock, scale);
#else
	#error "flight.Clock: no backend for this target."
#end
}
