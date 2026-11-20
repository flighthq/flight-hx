package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/clock")
extern class Clock {
  public static function addClockChild(parent:flight.esm.types.clock.Types.Clock, child:flight.esm.types.clock.Types.Clock):Void;
  public static function advanceClock(clock:flight.esm.types.clock.Types.Clock, deltaTime:Float):Void;
  public static function createChildClock(parent:flight.esm.types.clock.Types.Clock, ?options:Null<flight.esm.types.clock.Types.ClockOptions>):flight.esm.types.clock.Types.Clock;
  public static function createClock():flight.esm.types.clock.Types.Clock;
  public static function disposeClock(clock:flight.esm.types.clock.Types.Clock):Void;
  public static function enableClockSignals(clock:flight.esm.types.clock.Types.Clock):flight.esm.types.signals.Types.Signal<Float>;
  public static function getClockEffectiveScale(clock:flight.esm.types.clock.Types.Clock):Float;
  public static function getClockParent(clock:flight.esm.types.clock.Types.Clock):Null<flight.esm.types.clock.Types.Clock>;
  public static function isClockEffectivelyPaused(clock:flight.esm.types.clock.Types.Clock):Bool;
  public static function pauseClock(clock:flight.esm.types.clock.Types.Clock):Void;
  public static function removeClockChild(parent:flight.esm.types.clock.Types.Clock, child:flight.esm.types.clock.Types.Clock):Void;
  public static function resetClock(clock:flight.esm.types.clock.Types.Clock):Void;
  public static function resumeClock(clock:flight.esm.types.clock.Types.Clock):Void;
  public static function setClockScale(clock:flight.esm.types.clock.Types.Clock, scale:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
