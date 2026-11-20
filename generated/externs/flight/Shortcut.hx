package flight;

#if (js && flight_esm)
extern inline function equalsAccelerator(a:String, b:String):Bool {
	return flight._js._fn.Shortcut.equalsAccelerator(a, b);
}
#else
extern inline function equalsAccelerator(a:String, b:String):Bool {
#if hl
	return flight._hl._fn.Shortcut.equalsAccelerator(cast a, cast b);
#elseif cpp
	return flight._cpp._fn.Shortcut.equalsAccelerator(cast a, cast b);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.equalsAccelerator(a, b);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findAcceleratorConflict(accelerator:String, candidates:Dynamic):Null<String> {
	return flight._js._fn.Shortcut.findAcceleratorConflict(accelerator, candidates);
}
#else
extern inline function findAcceleratorConflict(accelerator:String, candidates:Dynamic, candidatesLen:Int):String {
#if hl
	return cast flight._hl._fn.Shortcut.findAcceleratorConflict(cast accelerator, candidates, candidatesLen);
#elseif cpp
	return cast flight._cpp._fn.Shortcut.findAcceleratorConflict(cast accelerator, candidates, candidatesLen);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shortcut.findAcceleratorConflict(accelerator, candidates, candidatesLen);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function formatAcceleratorForDisplay(accelerator:String, platform:Dynamic):String {
	return flight._js._fn.Shortcut.formatAcceleratorForDisplay(accelerator, platform);
}
#else
extern inline function formatAcceleratorForDisplay(accelerator:String, platform:flight.PlatformName):String {
#if hl
	return cast flight._hl._fn.Shortcut.formatAcceleratorForDisplay(cast accelerator, platform);
#elseif cpp
	return cast flight._cpp._fn.Shortcut.formatAcceleratorForDisplay(cast accelerator, platform);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shortcut.formatAcceleratorForDisplay(accelerator, platform);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcceleratorKey(accelerator:String):Null<Dynamic> {
	return flight._js._fn.Shortcut.getAcceleratorKey(accelerator);
}
#else
extern inline function getAcceleratorKey(accelerator:String):Int {
#if hl
	return flight._hl._fn.Shortcut.getAcceleratorKey(cast accelerator);
#elseif cpp
	return flight._cpp._fn.Shortcut.getAcceleratorKey(cast accelerator);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.getAcceleratorKey(accelerator);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcceleratorKeyLabel(key:Dynamic):String {
	return flight._js._fn.Shortcut.getAcceleratorKeyLabel(key);
}
#else
extern inline function getAcceleratorKeyLabel(key:flight.ShortcutKeyName):String {
#if hl
	return cast flight._hl._fn.Shortcut.getAcceleratorKeyLabel(key);
#elseif cpp
	return cast flight._cpp._fn.Shortcut.getAcceleratorKeyLabel(key);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shortcut.getAcceleratorKeyLabel(key);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcceleratorModifierLabel(modifier:Dynamic, platform:Dynamic):String {
	return flight._js._fn.Shortcut.getAcceleratorModifierLabel(modifier, platform);
}
#else
extern inline function getAcceleratorModifierLabel(modifier:flight.ShortcutModifier, platform:flight.PlatformName):String {
#if hl
	return cast flight._hl._fn.Shortcut.getAcceleratorModifierLabel(modifier, platform);
#elseif cpp
	return cast flight._cpp._fn.Shortcut.getAcceleratorModifierLabel(modifier, platform);
#elseif (js && flight_esm)
	return cast flight._js._fn.Shortcut.getAcceleratorModifierLabel(modifier, platform);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getAcceleratorModifiers(out:Dynamic, accelerator:String):Bool {
	return flight._js._fn.Shortcut.getAcceleratorModifiers(out, accelerator);
}
#else
extern inline function getAcceleratorModifiers(out:Dynamic, accelerator:String):Bool {
#if hl
	return flight._hl._fn.Shortcut.getAcceleratorModifiers(out, cast accelerator);
#elseif cpp
	return flight._cpp._fn.Shortcut.getAcceleratorModifiers(out, cast accelerator);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.getAcceleratorModifiers(out, accelerator);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isAcceleratorValid(input:String):Bool {
	return flight._js._fn.Shortcut.isAcceleratorValid(input);
}
#else
extern inline function isAcceleratorValid(input:String):Bool {
#if hl
	return flight._hl._fn.Shortcut.isAcceleratorValid(cast input);
#elseif cpp
	return flight._cpp._fn.Shortcut.isAcceleratorValid(cast input);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.isAcceleratorValid(input);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function makeParsedAccelerator():ParsedAccelerator {
	return flight._js._fn.Shortcut.makeParsedAccelerator();
}
#else
extern inline function makeParsedAccelerator():ParsedAccelerator {
#if hl
	return flight._hl._fn.Shortcut.makeParsedAccelerator();
#elseif cpp
	return flight._cpp._fn.Shortcut.makeParsedAccelerator();
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.makeParsedAccelerator();
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function normalizeAccelerator(input:String):Null<Accelerator> {
	return flight._js._fn.Shortcut.normalizeAccelerator(input);
}
#else
extern inline function normalizeAccelerator(input:String):Accelerator {
#if hl
	return flight._hl._fn.Shortcut.normalizeAccelerator(cast input);
#elseif cpp
	return flight._cpp._fn.Shortcut.normalizeAccelerator(cast input);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.normalizeAccelerator(input);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseAccelerator(out:ParsedAccelerator, input:String):Bool {
	return flight._js._fn.Shortcut.parseAccelerator(out, input);
}
#else
extern inline function parseAccelerator(out:ParsedAccelerator, input:String):Bool {
#if hl
	return flight._hl._fn.Shortcut.parseAccelerator(out, cast input);
#elseif cpp
	return flight._cpp._fn.Shortcut.parseAccelerator(out, cast input);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.parseAccelerator(out, input);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseAcceleratorDetailed(out:ParsedAccelerator, input:String):Null<AcceleratorParseError> {
	return flight._js._fn.Shortcut.parseAcceleratorDetailed(out, input);
}
#else
extern inline function parseAcceleratorDetailed(out:ParsedAccelerator, input:String):AcceleratorParseError {
#if hl
	return flight._hl._fn.Shortcut.parseAcceleratorDetailed(out, cast input);
#elseif cpp
	return flight._cpp._fn.Shortcut.parseAcceleratorDetailed(out, cast input);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.parseAcceleratorDetailed(out, input);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resolveCommandOrControlModifier(platform:Dynamic):Dynamic {
	return flight._js._fn.Shortcut.resolveCommandOrControlModifier(platform);
}
#else
extern inline function resolveCommandOrControlModifier(platform:flight.PlatformName):flight.ShortcutModifier {
#if hl
	return flight._hl._fn.Shortcut.resolveCommandOrControlModifier(platform);
#elseif cpp
	return flight._cpp._fn.Shortcut.resolveCommandOrControlModifier(platform);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.resolveCommandOrControlModifier(platform);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createGlobalShortcut(accelerator:String):CreateGlobalShortcutOutcome {
	return flight._js._fn.Shortcut.createGlobalShortcut(accelerator);
}
#else
extern inline function createGlobalShortcut(accelerator:String):CreateGlobalShortcutOutcome {
#if hl
	return flight._hl._fn.Shortcut.createGlobalShortcut(cast accelerator);
#elseif cpp
	return flight._cpp._fn.Shortcut.createGlobalShortcut(cast accelerator);
#elseif (js && flight_esm)
	return flight._js._fn.Shortcut.createGlobalShortcut(accelerator);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeParsedAccelerator(ptr:ParsedAccelerator):Void {
	flight._js._fn.Shortcut.freeParsedAccelerator(ptr);
}
#else
extern inline function freeParsedAccelerator(ptr:ParsedAccelerator):Void {
#if hl
	flight._hl._fn.Shortcut.freeParsedAccelerator(ptr);
#elseif cpp
	flight._cpp._fn.Shortcut.freeParsedAccelerator(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shortcut.freeParsedAccelerator(ptr);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAccelerator(ptr:Accelerator):Void {
	flight._js._fn.Shortcut.freeAccelerator(ptr);
}
#else
extern inline function freeAccelerator(ptr:Accelerator):Void {
#if hl
	flight._hl._fn.Shortcut.freeAccelerator(ptr);
#elseif cpp
	flight._cpp._fn.Shortcut.freeAccelerator(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shortcut.freeAccelerator(ptr);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeAcceleratorParseError(ptr:AcceleratorParseError):Void {
	flight._js._fn.Shortcut.freeAcceleratorParseError(ptr);
}
#else
extern inline function freeAcceleratorParseError(ptr:AcceleratorParseError):Void {
#if hl
	flight._hl._fn.Shortcut.freeAcceleratorParseError(ptr);
#elseif cpp
	flight._cpp._fn.Shortcut.freeAcceleratorParseError(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shortcut.freeAcceleratorParseError(ptr);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCreateGlobalShortcutOutcome(ptr:CreateGlobalShortcutOutcome):Void {
	flight._js._fn.Shortcut.freeCreateGlobalShortcutOutcome(ptr);
}
#else
extern inline function freeCreateGlobalShortcutOutcome(ptr:CreateGlobalShortcutOutcome):Void {
#if hl
	flight._hl._fn.Shortcut.freeCreateGlobalShortcutOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Shortcut.freeCreateGlobalShortcutOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Shortcut.freeCreateGlobalShortcutOutcome(ptr);
#else
	#error "flight.Shortcut: no backend for this target."
#end
}
#end
