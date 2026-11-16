package flight;

extern inline function createDisplayObject():Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createDisplayObject();
#elseif cpp
	return flight._cpp._fn.Scene2d.createDisplayObject();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createDisplayObject();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createDisplayObjectRuntime():DisplayObjectRuntime {
#if hl
	return flight._hl._fn.Scene2d.createDisplayObjectRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2d.createDisplayObjectRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createDisplayObjectRuntime();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createNode2dRuntime(methods:Node2DRuntimeMethods):Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.createNode2dRuntime(methods);
#elseif cpp
	return flight._cpp._fn.Scene2d.createNode2dRuntime(methods);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createNode2dRuntime(methods);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function asNode2dRef(node:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.asNode2dRef(node);
#elseif cpp
	return flight._cpp._fn.Scene2d.asNode2dRef(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.asNode2dRef(node);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getDisplayObjectRuntime(source:DisplayObject):DisplayObjectRuntime {
#if hl
	return flight._hl._fn.Scene2d.getDisplayObjectRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getDisplayObjectRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getDisplayObjectRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getNode2dRuntime(source:Dynamic):Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.getNode2dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getNode2dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getNode2dRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function isNode2d(node:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene2d.isNode2d(node);
#elseif cpp
	return flight._cpp._fn.Scene2d.isNode2d(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.isNode2d(node);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function setNode2dClip(source:Dynamic, value:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2d.setNode2dClip(source, value);
#elseif cpp
	flight._cpp._fn.Scene2d.setNode2dClip(source, value);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.setNode2dClip(source, value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function applyAnimationClipToNode2d(clip:AnimationClip, time:Float):Void {
#if hl
	flight._hl._fn.Scene2d.applyAnimationClipToNode2d(clip, time);
#elseif cpp
	flight._cpp._fn.Scene2d.applyAnimationClipToNode2d(clip, time);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.applyAnimationClipToNode2d(clip, time);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getNode2dAnimationPathString(value:flight.Node2DAnimationPath):String {
#if hl
	return cast flight._hl._fn.Scene2d.getNode2dAnimationPathString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2d.getNode2dAnimationPathString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2d.getNode2dAnimationPathString(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function parseNode2dAnimationPath(value:String):Int {
#if hl
	return flight._hl._fn.Scene2d.parseNode2dAnimationPath(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2d.parseNode2dAnimationPath(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.parseNode2dAnimationPath(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createHtmlView():Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createHtmlView();
#elseif cpp
	return flight._cpp._fn.Scene2d.createHtmlView();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createHtmlView();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createHtmlViewData():HtmlViewData {
#if hl
	return flight._hl._fn.Scene2d.createHtmlViewData();
#elseif cpp
	return flight._cpp._fn.Scene2d.createHtmlViewData();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createHtmlViewData();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createHtmlViewRuntime():HtmlViewRuntime {
#if hl
	return flight._hl._fn.Scene2d.createHtmlViewRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2d.createHtmlViewRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createHtmlViewRuntime();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function computeHtmlViewLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2d.computeHtmlViewLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Scene2d.computeHtmlViewLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.computeHtmlViewLocalBoundsRectangle(out, source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getHtmlViewRuntime(source:HtmlView):HtmlViewRuntime {
#if hl
	return flight._hl._fn.Scene2d.getHtmlViewRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getHtmlViewRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getHtmlViewRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function setHtmlViewSize(source:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Scene2d.setHtmlViewSize(source, width, height);
#elseif cpp
	flight._cpp._fn.Scene2d.setHtmlViewSize(source, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.setHtmlViewSize(source, width, height);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScale9Sprite(scale9Grid:Rectangle):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createScale9Sprite(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Scene2d.createScale9Sprite(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScale9Sprite(scale9Grid);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScale9SpriteData(scale9Grid:Rectangle):Scale9SpriteData {
#if hl
	return flight._hl._fn.Scene2d.createScale9SpriteData(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Scene2d.createScale9SpriteData(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScale9SpriteData(scale9Grid);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScale9SpriteRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.createScale9SpriteRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2d.createScale9SpriteRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScale9SpriteRuntime();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScale9SpriteRuntime(source:Scale9Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.getScale9SpriteRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getScale9SpriteRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getScale9SpriteRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScene2d():Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createScene2d();
#elseif cpp
	return flight._cpp._fn.Scene2d.createScene2d();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScene2d();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScene2dRuntime():Scene2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.createScene2dRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2d.createScene2dRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScene2dRuntime();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScene2dSignals():Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createScene2dSignals();
#elseif cpp
	return flight._cpp._fn.Scene2d.createScene2dSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScene2dSignals();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function enableScene2dSignals(source:Scene2D):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.enableScene2dSignals(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.enableScene2dSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.enableScene2dSignals(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dAlignString(value:flight.Scene2DAlign):String {
#if hl
	return cast flight._hl._fn.Scene2d.getScene2dAlignString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2d.getScene2dAlignString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2d.getScene2dAlignString(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dDisplayStateString(value:flight.Scene2DDisplayState):String {
#if hl
	return cast flight._hl._fn.Scene2d.getScene2dDisplayStateString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2d.getScene2dDisplayStateString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2d.getScene2dDisplayStateString(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dQualityString(value:flight.Scene2DQuality):String {
#if hl
	return cast flight._hl._fn.Scene2d.getScene2dQualityString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2d.getScene2dQualityString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2d.getScene2dQualityString(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dRoot(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.getScene2dRoot(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getScene2dRoot(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getScene2dRoot(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dRuntime(source:Scene2D):Scene2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.getScene2dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getScene2dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getScene2dRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dScaleModeString(value:flight.Scene2DScaleMode):String {
#if hl
	return cast flight._hl._fn.Scene2d.getScene2dScaleModeString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2d.getScene2dScaleModeString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2d.getScene2dScaleModeString(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dSignals(source:Scene2D):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.getScene2dSignals(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getScene2dSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getScene2dSignals(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function parseScene2dAlign(value:String):Int {
#if hl
	return flight._hl._fn.Scene2d.parseScene2dAlign(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2d.parseScene2dAlign(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.parseScene2dAlign(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function parseScene2dDisplayState(value:String):Int {
#if hl
	return flight._hl._fn.Scene2d.parseScene2dDisplayState(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2d.parseScene2dDisplayState(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.parseScene2dDisplayState(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function parseScene2dQuality(value:String):Int {
#if hl
	return flight._hl._fn.Scene2d.parseScene2dQuality(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2d.parseScene2dQuality(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.parseScene2dQuality(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function parseScene2dScaleMode(value:String):Int {
#if hl
	return flight._hl._fn.Scene2d.parseScene2dScaleMode(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2d.parseScene2dScaleMode(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.parseScene2dScaleMode(value);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function setScene2dSize(source:Dynamic, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Scene2d.setScene2dSize(source, width, height);
#elseif cpp
	flight._cpp._fn.Scene2d.setScene2dSize(source, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.setScene2dSize(source, width, height);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createScene2dKindUsage():Scene2DKindUsage {
#if hl
	return flight._hl._fn.Scene2d.createScene2dKindUsage();
#elseif cpp
	return flight._cpp._fn.Scene2d.createScene2dKindUsage();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createScene2dKindUsage();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getScene2dKindUsage(out:Scene2DKindUsage, scene:Scene2D):Void {
#if hl
	flight._hl._fn.Scene2d.getScene2dKindUsage(out, scene);
#elseif cpp
	flight._cpp._fn.Scene2d.getScene2dKindUsage(out, scene);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.getScene2dKindUsage(out, scene);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createSprite():Dynamic {
#if hl
	return flight._hl._fn.Scene2d.createSprite();
#elseif cpp
	return flight._cpp._fn.Scene2d.createSprite();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createSprite();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createSpriteData():SpriteData {
#if hl
	return flight._hl._fn.Scene2d.createSpriteData();
#elseif cpp
	return flight._cpp._fn.Scene2d.createSpriteData();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createSpriteData();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createSpriteRendererData(source:Dynamic):SpriteIdentityRendererData {
#if hl
	return flight._hl._fn.Scene2d.createSpriteRendererData(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.createSpriteRendererData(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createSpriteRendererData(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function createSpriteRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2d.createSpriteRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2d.createSpriteRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.createSpriteRuntime();
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function cloneSprite(source:Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.cloneSprite(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.cloneSprite(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.cloneSprite(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function computeSpriteLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2d.computeSpriteLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Scene2d.computeSpriteLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.computeSpriteLocalBoundsRectangle(out, source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function getSpriteRuntime(source:Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2d.getSpriteRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2d.getSpriteRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2d.getSpriteRuntime(source);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeDisplayObjectRuntime(ptr:DisplayObjectRuntime):Void {
#if hl
	flight._hl._fn.Scene2d.freeDisplayObjectRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeDisplayObjectRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeDisplayObjectRuntime(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeHtmlViewData(ptr:HtmlViewData):Void {
#if hl
	flight._hl._fn.Scene2d.freeHtmlViewData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeHtmlViewData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeHtmlViewData(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeHtmlViewRuntime(ptr:HtmlViewRuntime):Void {
#if hl
	flight._hl._fn.Scene2d.freeHtmlViewRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeHtmlViewRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeHtmlViewRuntime(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeScale9SpriteData(ptr:Scale9SpriteData):Void {
#if hl
	flight._hl._fn.Scene2d.freeScale9SpriteData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeScale9SpriteData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeScale9SpriteData(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeScene2Druntime(ptr:Scene2DRuntime):Void {
#if hl
	flight._hl._fn.Scene2d.freeScene2Druntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeScene2Druntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeScene2Druntime(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeScene2DkindUsage(ptr:Scene2DKindUsage):Void {
#if hl
	flight._hl._fn.Scene2d.freeScene2DkindUsage(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeScene2DkindUsage(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeScene2DkindUsage(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeSpriteData(ptr:SpriteData):Void {
#if hl
	flight._hl._fn.Scene2d.freeSpriteData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeSpriteData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeSpriteData(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
extern inline function freeSpriteIdentityRendererData(ptr:SpriteIdentityRendererData):Void {
#if hl
	flight._hl._fn.Scene2d.freeSpriteIdentityRendererData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2d.freeSpriteIdentityRendererData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2d.freeSpriteIdentityRendererData(ptr);
#else
	#error "flight.Scene2d: no backend for this target."
#end
}
