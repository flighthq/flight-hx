package flight;

extern inline function getActiveTweenCount(manager:TweenManager):Int {
#if hl
	return flight._hl._fn.Tween.getActiveTweenCount(manager);
#elseif cpp
	return flight._cpp._fn.Tween.getActiveTweenCount(manager);
#elseif (js && flight_esm)
	return flight._js._fn.Tween.getActiveTweenCount(manager);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function killTweensOfProperty(manager:TweenManager, key:String):Void {
#if hl
	flight._hl._fn.Tween.killTweensOfProperty(manager, cast key);
#elseif cpp
	flight._cpp._fn.Tween.killTweensOfProperty(manager, cast key);
#elseif (js && flight_esm)
	flight._js._fn.Tween.killTweensOfProperty(manager, key);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function pauseAllTweens(manager:TweenManager):Void {
#if hl
	flight._hl._fn.Tween.pauseAllTweens(manager);
#elseif cpp
	flight._cpp._fn.Tween.pauseAllTweens(manager);
#elseif (js && flight_esm)
	flight._js._fn.Tween.pauseAllTweens(manager);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function resetAllTweens(manager:TweenManager):Void {
#if hl
	flight._hl._fn.Tween.resetAllTweens(manager);
#elseif cpp
	flight._cpp._fn.Tween.resetAllTweens(manager);
#elseif (js && flight_esm)
	flight._js._fn.Tween.resetAllTweens(manager);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function resumeAllTweens(manager:TweenManager):Void {
#if hl
	flight._hl._fn.Tween.resumeAllTweens(manager);
#elseif cpp
	flight._cpp._fn.Tween.resumeAllTweens(manager);
#elseif (js && flight_esm)
	flight._js._fn.Tween.resumeAllTweens(manager);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function stopAllTweens(manager:TweenManager, options:StopTweenOptions):Void {
#if hl
	flight._hl._fn.Tween.stopAllTweens(manager, options);
#elseif cpp
	flight._cpp._fn.Tween.stopAllTweens(manager, options);
#elseif (js && flight_esm)
	flight._js._fn.Tween.stopAllTweens(manager, options);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function createTweenManager(options:TweenManagerOptions):TweenManager {
#if hl
	return flight._hl._fn.Tween.createTweenManager(options);
#elseif cpp
	return flight._cpp._fn.Tween.createTweenManager(options);
#elseif (js && flight_esm)
	return flight._js._fn.Tween.createTweenManager(options);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function defaultManager(context:TweenContext):TweenManager {
#if hl
	return flight._hl._fn.Tween.defaultManager(context);
#elseif cpp
	return flight._cpp._fn.Tween.defaultManager(context);
#elseif (js && flight_esm)
	return flight._js._fn.Tween.defaultManager(context);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function createTweenContext():TweenContext {
#if hl
	return flight._hl._fn.Tween.createTweenContext();
#elseif cpp
	return flight._cpp._fn.Tween.createTweenContext();
#elseif (js && flight_esm)
	return flight._js._fn.Tween.createTweenContext();
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function updateTweens(manager:TweenManager, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Tween.updateTweens(manager, deltaTime);
#elseif cpp
	flight._cpp._fn.Tween.updateTweens(manager, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Tween.updateTweens(manager, deltaTime);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function freeTweenManager(ptr:TweenManager):Void {
#if hl
	flight._hl._fn.Tween.freeTweenManager(ptr);
#elseif cpp
	flight._cpp._fn.Tween.freeTweenManager(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tween.freeTweenManager(ptr);
#else
	#error "flight.Tween: no backend for this target."
#end
}
extern inline function freeTweenContext(ptr:TweenContext):Void {
#if hl
	flight._hl._fn.Tween.freeTweenContext(ptr);
#elseif cpp
	flight._cpp._fn.Tween.freeTweenContext(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tween.freeTweenContext(ptr);
#else
	#error "flight.Tween: no backend for this target."
#end
}
