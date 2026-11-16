package flight;

extern inline function areTextureAtlasGuardsEnabled(state:TextureAtlasGuardState):Bool {
#if hl
	return flight._hl._fn.Textureatlas.areTextureAtlasGuardsEnabled(state);
#elseif cpp
	return flight._cpp._fn.Textureatlas.areTextureAtlasGuardsEnabled(state);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.areTextureAtlasGuardsEnabled(state);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function disableTextureAtlasGuards(state:TextureAtlasGuardState):Void {
#if hl
	flight._hl._fn.Textureatlas.disableTextureAtlasGuards(state);
#elseif cpp
	flight._cpp._fn.Textureatlas.disableTextureAtlasGuards(state);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.disableTextureAtlasGuards(state);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function enableTextureAtlasGuards(state:TextureAtlasGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Textureatlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Textureatlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function createTextureAtlas():Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.createTextureAtlas();
#elseif cpp
	return flight._cpp._fn.Textureatlas.createTextureAtlas();
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.createTextureAtlas();
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function disposeTextureAtlas(atlas:TextureAtlas):Void {
#if hl
	flight._hl._fn.Textureatlas.disposeTextureAtlas(atlas);
#elseif cpp
	flight._cpp._fn.Textureatlas.disposeTextureAtlas(atlas);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.disposeTextureAtlas(atlas);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasByteSize(atlas:TextureAtlas):Int {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasByteSize(atlas);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasByteSize(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasByteSize(atlas);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.createTextureAtlasFromImageResource(resource);
#elseif cpp
	return flight._cpp._fn.Textureatlas.createTextureAtlasFromImageResource(resource);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.createTextureAtlasFromImageResource(resource);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function createTextureAtlasFromGrid(options:GridSliceOptions, texture:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.createTextureAtlasFromGrid(options, texture);
#elseif cpp
	return flight._cpp._fn.Textureatlas.createTextureAtlasFromGrid(options, texture);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.createTextureAtlasFromGrid(options, texture);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function createTextureAtlasRegion():Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.createTextureAtlasRegion();
#elseif cpp
	return flight._cpp._fn.Textureatlas.createTextureAtlasRegion();
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.createTextureAtlasRegion();
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function addTextureAtlasRegion(target:TextureAtlas, x:Float, y:Float, width:Float, height:Float, pivotX:Float, pivotY:Float, name:String):Void {
#if hl
	flight._hl._fn.Textureatlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, cast name);
#elseif cpp
	flight._cpp._fn.Textureatlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, cast name);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function addTextureAtlasRegionCorners(target:TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, pivotX:Float, pivotY:Float, name:String):Void {
#if hl
	flight._hl._fn.Textureatlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, cast name);
#elseif cpp
	flight._cpp._fn.Textureatlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, cast name);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function addTextureAtlasRegionRectangle(target:TextureAtlas, rect:Rectangle, pivot:Vector2, name:String):Void {
#if hl
	flight._hl._fn.Textureatlas.addTextureAtlasRegionRectangle(target, rect, pivot, cast name);
#elseif cpp
	flight._cpp._fn.Textureatlas.addTextureAtlasRegionRectangle(target, rect, pivot, cast name);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.addTextureAtlasRegionRectangle(target, rect, pivot, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function addTextureAtlasRegionVector2(target:TextureAtlas, a:Vector2, b:Vector2, pivot:Vector2, name:String):Void {
#if hl
	flight._hl._fn.Textureatlas.addTextureAtlasRegionVector2(target, a, b, pivot, cast name);
#elseif cpp
	flight._cpp._fn.Textureatlas.addTextureAtlasRegionVector2(target, a, b, pivot, cast name);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.addTextureAtlasRegionVector2(target, a, b, pivot, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function clearTextureAtlasRegions(target:TextureAtlas):Void {
#if hl
	flight._hl._fn.Textureatlas.clearTextureAtlasRegions(target);
#elseif cpp
	flight._cpp._fn.Textureatlas.clearTextureAtlasRegions(target);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.clearTextureAtlasRegions(target);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function explainTextureAtlasRegionTexture(atlas:TextureAtlas, regionId:Int):TextureAtlasRegionTextureExplanation {
#if hl
	return flight._hl._fn.Textureatlas.explainTextureAtlasRegionTexture(atlas, regionId);
#elseif cpp
	return flight._cpp._fn.Textureatlas.explainTextureAtlasRegionTexture(atlas, regionId);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.explainTextureAtlasRegionTexture(atlas, regionId);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionById(atlas:TextureAtlas, id:Int):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionById(atlas, id);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionById(atlas, id);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionById(atlas, id);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionByName(atlas:TextureAtlas, name:String):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionByName(atlas, cast name);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionByName(atlas, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionByName(atlas, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionByOrdinal(atlas:TextureAtlas, prefix:String, ordinal:Float):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionByOrdinal(atlas, cast prefix, ordinal);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionByOrdinal(atlas, cast prefix, ordinal);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionByOrdinal(atlas, prefix, ordinal);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionCount(atlas:TextureAtlas):Int {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionCount(atlas);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionCount(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionCount(atlas);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionFrame(out:Rectangle, region:TextureAtlasRegion):Void {
#if hl
	flight._hl._fn.Textureatlas.getTextureAtlasRegionFrame(out, region);
#elseif cpp
	flight._cpp._fn.Textureatlas.getTextureAtlasRegionFrame(out, region);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.getTextureAtlasRegionFrame(out, region);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionOrdinal(region:TextureAtlasRegion):Float {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionOrdinal(region);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionOrdinal(region);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionOrdinal(region);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:TextureAtlasGuardState):Dynamic {
#if hl
	return flight._hl._fn.Textureatlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#elseif cpp
	return flight._cpp._fn.Textureatlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionTextureStatusString(value:flight.TextureAtlasRegionTextureStatus):String {
#if hl
	return cast flight._hl._fn.Textureatlas.getTextureAtlasRegionTextureStatusString(value);
#elseif cpp
	return cast flight._cpp._fn.Textureatlas.getTextureAtlasRegionTextureStatusString(value);
#elseif (js && flight_esm)
	return cast flight._js._fn.Textureatlas.getTextureAtlasRegionTextureStatusString(value);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionUv(out:Rectangle, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
#if hl
	flight._hl._fn.Textureatlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#elseif cpp
	flight._cpp._fn.Textureatlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function getTextureAtlasRegionUvQuad(out:Dynamic, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
#if hl
	flight._hl._fn.Textureatlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#elseif cpp
	flight._cpp._fn.Textureatlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function hasTextureAtlasRegion(atlas:TextureAtlas, name:String):Bool {
#if hl
	return flight._hl._fn.Textureatlas.hasTextureAtlasRegion(atlas, cast name);
#elseif cpp
	return flight._cpp._fn.Textureatlas.hasTextureAtlasRegion(atlas, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.hasTextureAtlasRegion(atlas, name);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function parseTextureAtlasRegionTextureStatus(value:String):Int {
#if hl
	return flight._hl._fn.Textureatlas.parseTextureAtlasRegionTextureStatus(cast value);
#elseif cpp
	return flight._cpp._fn.Textureatlas.parseTextureAtlasRegionTextureStatus(cast value);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.parseTextureAtlasRegionTextureStatus(value);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function removeTextureAtlasRegion(target:TextureAtlas, id:Int):Bool {
#if hl
	return flight._hl._fn.Textureatlas.removeTextureAtlasRegion(target, id);
#elseif cpp
	return flight._cpp._fn.Textureatlas.removeTextureAtlasRegion(target, id);
#elseif (js && flight_esm)
	return flight._js._fn.Textureatlas.removeTextureAtlasRegion(target, id);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function setTextureAtlasRegion(out:TextureAtlasRegion, source:TextureAtlasRegionOptions):Void {
#if hl
	flight._hl._fn.Textureatlas.setTextureAtlasRegion(out, source);
#elseif cpp
	flight._cpp._fn.Textureatlas.setTextureAtlasRegion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.setTextureAtlasRegion(out, source);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
extern inline function freeTextureAtlasRegionTextureExplanation(ptr:TextureAtlasRegionTextureExplanation):Void {
#if hl
	flight._hl._fn.Textureatlas.freeTextureAtlasRegionTextureExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Textureatlas.freeTextureAtlasRegionTextureExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Textureatlas.freeTextureAtlasRegionTextureExplanation(ptr);
#else
	#error "flight.Textureatlas: no backend for this target."
#end
}
