// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Portable monotonic clock and native launch-entry sentinel. */
@:keep
class _Performance {
  public function new() {}

  public function getEntriesByType(_type:String):Array<flighthq._internal.dom.PerformanceNavigationTiming> return [];

  public function now():Float return haxe.Timer.stamp() * 1000.0;
}
