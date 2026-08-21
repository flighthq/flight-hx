// Maintained host-type declaration for the standard monotonic clock.
package flighthq._internal.dom;

#if js
@:native('Performance')
extern class Performance {
  function getEntriesByType(type:String):Array<PerformanceNavigationTiming>;
  function now():Float;
}
#else
typedef Performance = flighthq._internal._Performance;
#end
