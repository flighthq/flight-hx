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
extern inline function createDisplayObjectRuntime():DisplayObjectRuntime {
	return flight._js._fn.Scene2D.createDisplayObjectRuntime();
}
#else
extern inline function createDisplayObjectRuntime():DisplayObjectRuntime {
#if hl
	return flight._hl._fn.Scene2D.createDisplayObjectRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2D.createDisplayObjectRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createDisplayObjectRuntime();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNode2dRuntime(methods:Null<Node2DRuntimeMethods>):Node2DRuntime {
	return flight._js._fn.Scene2D.createNode2dRuntime(methods);
}
#else
extern inline function createNode2dRuntime(methods:Node2DRuntimeMethods):Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.createNode2dRuntime(methods);
#elseif cpp
	return flight._cpp._fn.Scene2D.createNode2dRuntime(methods);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createNode2dRuntime(methods);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function asNode2dRef(node:Dynamic):Null<Dynamic> {
	return flight._js._fn.Scene2D.asNode2dRef(node);
}
#else
extern inline function asNode2dRef(node:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.asNode2dRef(node);
#elseif cpp
	return flight._cpp._fn.Scene2D.asNode2dRef(node);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.asNode2dRef(node);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getDisplayObjectRuntime(source:DisplayObject):DisplayObjectRuntime {
	return flight._js._fn.Scene2D.getDisplayObjectRuntime(source);
}
#else
extern inline function getDisplayObjectRuntime(source:DisplayObject):DisplayObjectRuntime {
#if hl
	return flight._hl._fn.Scene2D.getDisplayObjectRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getDisplayObjectRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getDisplayObjectRuntime(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNode2dRuntime(source:Dynamic):Node2DRuntime {
	return flight._js._fn.Scene2D.getNode2dRuntime(source);
}
#else
extern inline function getNode2dRuntime(source:Dynamic):Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.getNode2dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getNode2dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getNode2dRuntime(source);
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
extern inline function getNode2dAnimationPathString(value:Dynamic):String {
	return flight._js._fn.Scene2D.getNode2dAnimationPathString(value);
}
#else
extern inline function getNode2dAnimationPathString(value:flight.Node2DAnimationPath):String {
#if hl
	return cast flight._hl._fn.Scene2D.getNode2dAnimationPathString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2D.getNode2dAnimationPathString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2D.getNode2dAnimationPathString(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseNode2dAnimationPath(value:String):Null<Dynamic> {
	return flight._js._fn.Scene2D.parseNode2dAnimationPath(value);
}
#else
extern inline function parseNode2dAnimationPath(value:String):Int {
#if hl
	return flight._hl._fn.Scene2D.parseNode2dAnimationPath(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2D.parseNode2dAnimationPath(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.parseNode2dAnimationPath(value);
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
extern inline function createHtmlViewData():HtmlViewData {
	return flight._js._fn.Scene2D.createHtmlViewData();
}
#else
extern inline function createHtmlViewData():HtmlViewData {
#if hl
	return flight._hl._fn.Scene2D.createHtmlViewData();
#elseif cpp
	return flight._cpp._fn.Scene2D.createHtmlViewData();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createHtmlViewData();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createHtmlViewRuntime():HtmlViewRuntime {
	return flight._js._fn.Scene2D.createHtmlViewRuntime();
}
#else
extern inline function createHtmlViewRuntime():HtmlViewRuntime {
#if hl
	return flight._hl._fn.Scene2D.createHtmlViewRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2D.createHtmlViewRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createHtmlViewRuntime();
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
extern inline function getHtmlViewRuntime(source:HtmlView):HtmlViewRuntime {
	return flight._js._fn.Scene2D.getHtmlViewRuntime(source);
}
#else
extern inline function getHtmlViewRuntime(source:HtmlView):HtmlViewRuntime {
#if hl
	return flight._hl._fn.Scene2D.getHtmlViewRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getHtmlViewRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getHtmlViewRuntime(source);
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
extern inline function createScale9SpriteData(scale9Grid:Rectangle):Scale9SpriteData {
	return flight._js._fn.Scene2D.createScale9SpriteData(scale9Grid);
}
#else
extern inline function createScale9SpriteData(scale9Grid:Rectangle):Scale9SpriteData {
#if hl
	return flight._hl._fn.Scene2D.createScale9SpriteData(scale9Grid);
#elseif cpp
	return flight._cpp._fn.Scene2D.createScale9SpriteData(scale9Grid);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScale9SpriteData(scale9Grid);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScale9SpriteRuntime():Node2DRuntime {
	return flight._js._fn.Scene2D.createScale9SpriteRuntime();
}
#else
extern inline function createScale9SpriteRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.createScale9SpriteRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2D.createScale9SpriteRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScale9SpriteRuntime();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScale9SpriteRuntime(source:Scale9Sprite):Dynamic {
	return flight._js._fn.Scene2D.getScale9SpriteRuntime(source);
}
#else
extern inline function getScale9SpriteRuntime(source:Scale9Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.getScale9SpriteRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getScale9SpriteRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getScale9SpriteRuntime(source);
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
extern inline function createScene2dRuntime():Scene2DRuntime {
	return flight._js._fn.Scene2D.createScene2dRuntime();
}
#else
extern inline function createScene2dRuntime():Scene2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.createScene2dRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2D.createScene2dRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScene2dRuntime();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dSignals():Dynamic {
	return flight._js._fn.Scene2D.createScene2dSignals();
}
#else
extern inline function createScene2dSignals():Dynamic {
#if hl
	return flight._hl._fn.Scene2D.createScene2dSignals();
#elseif cpp
	return flight._cpp._fn.Scene2D.createScene2dSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createScene2dSignals();
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
extern inline function getScene2dAlignString(value:Dynamic):String {
	return flight._js._fn.Scene2D.getScene2dAlignString(value);
}
#else
extern inline function getScene2dAlignString(value:flight.Scene2DAlign):String {
#if hl
	return cast flight._hl._fn.Scene2D.getScene2dAlignString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2D.getScene2dAlignString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2D.getScene2dAlignString(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dDisplayStateString(value:Dynamic):String {
	return flight._js._fn.Scene2D.getScene2dDisplayStateString(value);
}
#else
extern inline function getScene2dDisplayStateString(value:flight.Scene2DDisplayState):String {
#if hl
	return cast flight._hl._fn.Scene2D.getScene2dDisplayStateString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2D.getScene2dDisplayStateString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2D.getScene2dDisplayStateString(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dQualityString(value:Dynamic):String {
	return flight._js._fn.Scene2D.getScene2dQualityString(value);
}
#else
extern inline function getScene2dQualityString(value:flight.Scene2DQuality):String {
#if hl
	return cast flight._hl._fn.Scene2D.getScene2dQualityString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2D.getScene2dQualityString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2D.getScene2dQualityString(value);
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
extern inline function getScene2dRuntime(source:Scene2D):Scene2DRuntime {
	return flight._js._fn.Scene2D.getScene2dRuntime(source);
}
#else
extern inline function getScene2dRuntime(source:Scene2D):Scene2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.getScene2dRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getScene2dRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getScene2dRuntime(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getScene2dScaleModeString(value:Dynamic):String {
	return flight._js._fn.Scene2D.getScene2dScaleModeString(value);
}
#else
extern inline function getScene2dScaleModeString(value:flight.Scene2DScaleMode):String {
#if hl
	return cast flight._hl._fn.Scene2D.getScene2dScaleModeString(value);
#elseif cpp
	return cast flight._cpp._fn.Scene2D.getScene2dScaleModeString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Scene2D.getScene2dScaleModeString(value);
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
extern inline function parseScene2dAlign(value:String):Null<Dynamic> {
	return flight._js._fn.Scene2D.parseScene2dAlign(value);
}
#else
extern inline function parseScene2dAlign(value:String):Int {
#if hl
	return flight._hl._fn.Scene2D.parseScene2dAlign(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2D.parseScene2dAlign(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.parseScene2dAlign(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseScene2dDisplayState(value:String):Null<Dynamic> {
	return flight._js._fn.Scene2D.parseScene2dDisplayState(value);
}
#else
extern inline function parseScene2dDisplayState(value:String):Int {
#if hl
	return flight._hl._fn.Scene2D.parseScene2dDisplayState(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2D.parseScene2dDisplayState(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.parseScene2dDisplayState(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseScene2dQuality(value:String):Null<Dynamic> {
	return flight._js._fn.Scene2D.parseScene2dQuality(value);
}
#else
extern inline function parseScene2dQuality(value:String):Int {
#if hl
	return flight._hl._fn.Scene2D.parseScene2dQuality(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2D.parseScene2dQuality(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.parseScene2dQuality(value);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function parseScene2dScaleMode(value:String):Null<Dynamic> {
	return flight._js._fn.Scene2D.parseScene2dScaleMode(value);
}
#else
extern inline function parseScene2dScaleMode(value:String):Int {
#if hl
	return flight._hl._fn.Scene2D.parseScene2dScaleMode(cast value);
#elseif cpp
	return flight._cpp._fn.Scene2D.parseScene2dScaleMode(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.parseScene2dScaleMode(value);
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
extern inline function createSpriteData():SpriteData {
	return flight._js._fn.Scene2D.createSpriteData();
}
#else
extern inline function createSpriteData():SpriteData {
#if hl
	return flight._hl._fn.Scene2D.createSpriteData();
#elseif cpp
	return flight._cpp._fn.Scene2D.createSpriteData();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createSpriteData();
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpriteRendererData(source:Dynamic):SpriteIdentityRendererData {
	return flight._js._fn.Scene2D.createSpriteRendererData(source);
}
#else
extern inline function createSpriteRendererData(source:Dynamic):SpriteIdentityRendererData {
#if hl
	return flight._hl._fn.Scene2D.createSpriteRendererData(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.createSpriteRendererData(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createSpriteRendererData(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpriteRuntime():Node2DRuntime {
	return flight._js._fn.Scene2D.createSpriteRuntime();
}
#else
extern inline function createSpriteRuntime():Node2DRuntime {
#if hl
	return flight._hl._fn.Scene2D.createSpriteRuntime();
#elseif cpp
	return flight._cpp._fn.Scene2D.createSpriteRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.createSpriteRuntime();
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
extern inline function getSpriteRuntime(source:Sprite):Dynamic {
	return flight._js._fn.Scene2D.getSpriteRuntime(source);
}
#else
extern inline function getSpriteRuntime(source:Sprite):Dynamic {
#if hl
	return flight._hl._fn.Scene2D.getSpriteRuntime(source);
#elseif cpp
	return flight._cpp._fn.Scene2D.getSpriteRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2D.getSpriteRuntime(source);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeDisplayObjectRuntime(ptr:DisplayObjectRuntime):Void {
	flight._js._fn.Scene2D.freeDisplayObjectRuntime(ptr);
}
#else
extern inline function freeDisplayObjectRuntime(ptr:DisplayObjectRuntime):Void {
#if hl
	flight._hl._fn.Scene2D.freeDisplayObjectRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeDisplayObjectRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeDisplayObjectRuntime(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHtmlViewData(ptr:HtmlViewData):Void {
	flight._js._fn.Scene2D.freeHtmlViewData(ptr);
}
#else
extern inline function freeHtmlViewData(ptr:HtmlViewData):Void {
#if hl
	flight._hl._fn.Scene2D.freeHtmlViewData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeHtmlViewData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeHtmlViewData(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeHtmlViewRuntime(ptr:HtmlViewRuntime):Void {
	flight._js._fn.Scene2D.freeHtmlViewRuntime(ptr);
}
#else
extern inline function freeHtmlViewRuntime(ptr:HtmlViewRuntime):Void {
#if hl
	flight._hl._fn.Scene2D.freeHtmlViewRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeHtmlViewRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeHtmlViewRuntime(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScale9SpriteData(ptr:Scale9SpriteData):Void {
	flight._js._fn.Scene2D.freeScale9SpriteData(ptr);
}
#else
extern inline function freeScale9SpriteData(ptr:Scale9SpriteData):Void {
#if hl
	flight._hl._fn.Scene2D.freeScale9SpriteData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeScale9SpriteData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeScale9SpriteData(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene2Druntime(ptr:Scene2DRuntime):Void {
	flight._js._fn.Scene2D.freeScene2Druntime(ptr);
}
#else
extern inline function freeScene2Druntime(ptr:Scene2DRuntime):Void {
#if hl
	flight._hl._fn.Scene2D.freeScene2Druntime(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeScene2Druntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeScene2Druntime(ptr);
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
#if (js && flight_esm)
extern inline function freeSpriteData(ptr:SpriteData):Void {
	flight._js._fn.Scene2D.freeSpriteData(ptr);
}
#else
extern inline function freeSpriteData(ptr:SpriteData):Void {
#if hl
	flight._hl._fn.Scene2D.freeSpriteData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeSpriteData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeSpriteData(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpriteIdentityRendererData(ptr:SpriteIdentityRendererData):Void {
	flight._js._fn.Scene2D.freeSpriteIdentityRendererData(ptr);
}
#else
extern inline function freeSpriteIdentityRendererData(ptr:SpriteIdentityRendererData):Void {
#if hl
	flight._hl._fn.Scene2D.freeSpriteIdentityRendererData(ptr);
#elseif cpp
	flight._cpp._fn.Scene2D.freeSpriteIdentityRendererData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2D.freeSpriteIdentityRendererData(ptr);
#else
	#error "flight.Scene2D: no backend for this target."
#end
}
#end
