package flight;

#if hl

typedef Scene2D = flight._hl.Scene2D;

#elseif cpp

typedef Scene2D = flight._cpp.Scene2D;

#elseif (js && flight_esm)

typedef Scene2D = flight._js.Scene2D;

#elseif js

#error "flight.Scene2D on js requires flight_esm."

#else

#error "flight.Scene2D: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createDisplayObject():Dynamic {
	return flight._js._fn.Scene2D.createDisplayObject();
}
#else
extern inline function createDisplayObject():Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createDisplayObject();
#elseif cpp
	return flight._cpp._fn.Scene2D.createDisplayObject();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createDisplayObject();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNode2d(node:Dynamic):Bool {
	return flight._js._fn.Scene2D.isNode2d(node);
}
#else
extern inline function isNode2d(node:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene2D.isNode2d(node);
#elseif cpp
	return flight._cpp._fn.Scene2D.isNode2d(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.isNode2d(node);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNode2dClip(source:Dynamic, value:Null<Dynamic>):Void {
	flight._js._fn.Scene2D.setNode2dClip(source, value);
}
#else
extern inline function setNode2dClip(source:Dynamic, value:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2D.setNode2dClip(source, value);
#elseif cpp
	flight._cpp._fn.Scene2D.setNode2dClip(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.setNode2dClip(source, value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyAnimationClipToNode2d(clip:AnimationClip, time:Float):Void {
	flight._js._fn.Scene2D.applyAnimationClipToNode2d(clip, time);
}
#else
extern inline function applyAnimationClipToNode2d(clip:AnimationClip, time:Float):Void {
#if hl
	flight._hl._fn.Scene2D.applyAnimationClipToNode2d(clip, time);
#elseif cpp
	flight._cpp._fn.Scene2D.applyAnimationClipToNode2d(clip, time);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.applyAnimationClipToNode2d(clip, time);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHtmlView():Dynamic {
	return flight._js._fn.Scene2D.createHtmlView();
}
#else
extern inline function createHtmlView():Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createHtmlView();
#elseif cpp
	return flight._cpp._fn.Scene2D.createHtmlView();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createHtmlView();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeHtmlViewLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(out, source);
}
#else
extern inline function computeHtmlViewLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(out, source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void {
	flight._js._fn.Scene2D.setHtmlViewSize(source, width, height);
}
#else
extern inline function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Scene2D.setHtmlViewSize(source, width, height);
#elseif cpp
	flight._cpp._fn.Scene2D.setHtmlViewSize(source, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.setHtmlViewSize(source, width, height);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScale9Sprite(scale9Grid:Rectangle):Dynamic {
	return flight._js._fn.Scene2D.createScale9Sprite(scale9Grid);
}
#else
extern inline function createScale9Sprite(scale9Grid:Rectangle):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createScale9Sprite(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Scene2D.createScale9Sprite(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScale9Sprite(scale9Grid);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2d():Dynamic {
	return flight._js._fn.Scene2D.createScene2d();
}
#else
extern inline function createScene2d():Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createScene2d();
#elseif cpp
	return flight._cpp._fn.Scene2D.createScene2d();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScene2d();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableScene2dSignals(source:Scene2D):Dynamic {
	return flight._js._fn.Scene2D.enableScene2dSignals(source);
}
#else
extern inline function enableScene2dSignals(source:Scene2D):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.enableScene2dSignals(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.enableScene2dSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.enableScene2dSignals(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dRoot(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Scene2D.getScene2dRoot(source);
}
#else
extern inline function getScene2dRoot(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.getScene2dRoot(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getScene2dRoot(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getScene2dRoot(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dSignals(source:Scene2D):Null<Dynamic> {
	return flight._js._fn.Scene2D.getScene2dSignals(source);
}
#else
extern inline function getScene2dSignals(source:Scene2D):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.getScene2dSignals(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getScene2dSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getScene2dSignals(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setScene2dSize(source:Dynamic, width:Float, height:Float):Void {
	flight._js._fn.Scene2D.setScene2dSize(source, width, height);
}
#else
extern inline function setScene2dSize(source:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Scene2D.setScene2dSize(source, width, height);
#elseif cpp
	flight._cpp._fn.Scene2D.setScene2dSize(source, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.setScene2dSize(source, width, height);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dKindUsage():Scene2DKindUsage {
	return flight._js._fn.Scene2D.createScene2dKindUsage();
}
#else
extern inline function createScene2dKindUsage():Scene2DKindUsage {
#if hl
	return flight._hl._fn.Scene2D.createScene2dKindUsage();
#elseif cpp
	return flight._cpp._fn.Scene2D.createScene2dKindUsage();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScene2dKindUsage();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dKindUsage(out:Scene2DKindUsage, scene:Scene2D):Void {
	flight._js._fn.Scene2D.getScene2dKindUsage(out, scene);
}
#else
extern inline function getScene2dKindUsage(out:Scene2DKindUsage, scene:Scene2D):Void {
#if hl
	flight._hl._fn.Scene2D.getScene2dKindUsage(out, scene);
#elseif cpp
	flight._cpp._fn.Scene2D.getScene2dKindUsage(out, scene);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.getScene2dKindUsage(out, scene);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSprite():Dynamic {
	return flight._js._fn.Scene2D.createSprite();
}
#else
extern inline function createSprite():Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createSprite();
#elseif cpp
	return flight._cpp._fn.Scene2D.createSprite();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createSprite();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneSprite(source:Sprite):Dynamic {
	return flight._js._fn.Scene2D.cloneSprite(source);
}
#else
extern inline function cloneSprite(source:Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.cloneSprite(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.cloneSprite(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.cloneSprite(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeSpriteLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Scene2D.computeSpriteLocalBoundsRectangle(out, source);
}
#else
extern inline function computeSpriteLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2D.computeSpriteLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Scene2D.computeSpriteLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.computeSpriteLocalBoundsRectangle(out, source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene2DkindUsage(ptr:Scene2DKindUsage):Void {
	flight._js._fn.Scene2D.freeScene2DkindUsage(ptr);
}
#else
extern inline function freeScene2DkindUsage(ptr:Scene2DKindUsage):Void {
#if hl
	flight._hl._fn.Scene2D.freeScene2DkindUsage(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeScene2DkindUsage(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeScene2DkindUsage(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
