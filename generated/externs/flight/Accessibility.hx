package flight;

#if (js && flight_esm)
extern inline function destroyAccessibility(hostAccessibility:HostAccessibilityCapability):Void {
	flight._js._fn.Accessibility.destroyAccessibility(hostAccessibility);
}
#else
extern inline function destroyAccessibility(hostAccessibility:HostAccessibilityCapability):Void {
#if hl
	flight._hl._fn.Accessibility.destroyAccessibility(hostAccessibility);
#elseif cpp
	flight._cpp._fn.Accessibility.destroyAccessibility(hostAccessibility);
#elseif (js && flight_esm)
	flight._js._fn.Accessibility.destroyAccessibility(hostAccessibility);
#else
	#error "flight.Accessibility: no backend for this target."
#end
}
#end
