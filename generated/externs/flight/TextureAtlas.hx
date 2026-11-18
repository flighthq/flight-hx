package flight;

#if hl

typedef TextureAtlas = flight._hl.TextureAtlas;

#elseif cpp

typedef TextureAtlas = flight._cpp.TextureAtlas;

#elseif (js && flight_esm)

typedef TextureAtlas = flight._js.TextureAtlas;

#elseif js

#error "flight.TextureAtlas on js requires flight_esm."

#else

#error "flight.TextureAtlas: no backend for this target."

#end

#if (js && flight_esm)
extern inline function areTextureAtlasGuardsEnabled(state:TextureAtlasGuardState):Bool {
	return flight._js._fn.TextureAtlas.areTextureAtlasGuardsEnabled(state);
}
#else
extern inline function areTextureAtlasGuardsEnabled(state:TextureAtlasGuardState):Bool {
#if hl
	return flight._hl._fn.TextureAtlas.areTextureAtlasGuardsEnabled(state);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.areTextureAtlasGuardsEnabled(state);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.areTextureAtlasGuardsEnabled(state);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableTextureAtlasGuards(state:TextureAtlasGuardState):Void {
	flight._js._fn.TextureAtlas.disableTextureAtlasGuards(state);
}
#else
extern inline function disableTextureAtlasGuards(state:TextureAtlasGuardState):Void {
#if hl
	flight._hl._fn.TextureAtlas.disableTextureAtlasGuards(state);
#elseif cpp
	flight._cpp._fn.TextureAtlas.disableTextureAtlasGuards(state);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.disableTextureAtlasGuards(state);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTextureAtlasGuards(state:TextureAtlasGuardState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.TextureAtlas.enableTextureAtlasGuards(state, logState, clock);
}
#else
extern inline function enableTextureAtlasGuards(state:TextureAtlasGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.TextureAtlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.TextureAtlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.enableTextureAtlasGuards(state, logState, clockFn, clockCtx);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextureAtlas():Dynamic {
	return flight._js._fn.TextureAtlas.createTextureAtlas();
}
#else
extern inline function createTextureAtlas():Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.createTextureAtlas();
#elseif cpp
	return flight._cpp._fn.TextureAtlas.createTextureAtlas();
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.createTextureAtlas();
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeTextureAtlas(atlas:TextureAtlas):Void {
	flight._js._fn.TextureAtlas.disposeTextureAtlas(atlas);
}
#else
extern inline function disposeTextureAtlas(atlas:TextureAtlas):Void {
#if hl
	flight._hl._fn.TextureAtlas.disposeTextureAtlas(atlas);
#elseif cpp
	flight._cpp._fn.TextureAtlas.disposeTextureAtlas(atlas);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.disposeTextureAtlas(atlas);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasByteSize(atlas:TextureAtlas):Int {
	return flight._js._fn.TextureAtlas.getTextureAtlasByteSize(atlas);
}
#else
extern inline function getTextureAtlasByteSize(atlas:TextureAtlas):Int {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasByteSize(atlas);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasByteSize(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasByteSize(atlas);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic {
	return flight._js._fn.TextureAtlas.createTextureAtlasFromImageResource(resource);
}
#else
extern inline function createTextureAtlasFromImageResource(resource:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.createTextureAtlasFromImageResource(resource);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.createTextureAtlasFromImageResource(resource);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.createTextureAtlasFromImageResource(resource);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextureAtlasFromGrid(options:GridSliceOptions, texture:Null<Dynamic>):Dynamic {
	return flight._js._fn.TextureAtlas.createTextureAtlasFromGrid(options, texture);
}
#else
extern inline function createTextureAtlasFromGrid(options:GridSliceOptions, texture:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.createTextureAtlasFromGrid(options, texture);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.createTextureAtlasFromGrid(options, texture);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.createTextureAtlasFromGrid(options, texture);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTextureAtlasRegion():Dynamic {
	return flight._js._fn.TextureAtlas.createTextureAtlasRegion();
}
#else
extern inline function createTextureAtlasRegion():Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.createTextureAtlasRegion();
#elseif cpp
	return flight._cpp._fn.TextureAtlas.createTextureAtlasRegion();
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.createTextureAtlasRegion();
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addTextureAtlasRegion(target:TextureAtlas, x:Float, y:Float, width:Float, height:Float, pivotX:Null<Float>, pivotY:Null<Float>, name:Null<String>):Void {
	flight._js._fn.TextureAtlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, name);
}
#else
extern inline function addTextureAtlasRegion(target:TextureAtlas, x:Float, y:Float, width:Float, height:Float, pivotX:Float, pivotY:Float, name:String):Void {
#if hl
	flight._hl._fn.TextureAtlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, cast name);
#elseif cpp
	flight._cpp._fn.TextureAtlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, cast name);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.addTextureAtlasRegion(target, x, y, width, height, pivotX, pivotY, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addTextureAtlasRegionCorners(target:TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, pivotX:Null<Float>, pivotY:Null<Float>, name:Null<String>):Void {
	flight._js._fn.TextureAtlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, name);
}
#else
extern inline function addTextureAtlasRegionCorners(target:TextureAtlas, ax:Float, ay:Float, bx:Float, by:Float, pivotX:Float, pivotY:Float, name:String):Void {
#if hl
	flight._hl._fn.TextureAtlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, cast name);
#elseif cpp
	flight._cpp._fn.TextureAtlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, cast name);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.addTextureAtlasRegionCorners(target, ax, ay, bx, by, pivotX, pivotY, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addTextureAtlasRegionRectangle(target:TextureAtlas, rect:Rectangle, pivot:Null<Vector2>, name:Null<String>):Void {
	flight._js._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, rect, pivot, name);
}
#else
extern inline function addTextureAtlasRegionRectangle(target:TextureAtlas, rect:Rectangle, pivot:Vector2, name:String):Void {
#if hl
	flight._hl._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, rect, pivot, cast name);
#elseif cpp
	flight._cpp._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, rect, pivot, cast name);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, rect, pivot, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addTextureAtlasRegionVector2(target:TextureAtlas, a:Vector2, b:Vector2, pivot:Null<Vector2>, name:Null<String>):Void {
	flight._js._fn.TextureAtlas.addTextureAtlasRegionVector2(target, a, b, pivot, name);
}
#else
extern inline function addTextureAtlasRegionVector2(target:TextureAtlas, a:Vector2, b:Vector2, pivot:Vector2, name:String):Void {
#if hl
	flight._hl._fn.TextureAtlas.addTextureAtlasRegionVector2(target, a, b, pivot, cast name);
#elseif cpp
	flight._cpp._fn.TextureAtlas.addTextureAtlasRegionVector2(target, a, b, pivot, cast name);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.addTextureAtlasRegionVector2(target, a, b, pivot, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearTextureAtlasRegions(target:TextureAtlas):Void {
	flight._js._fn.TextureAtlas.clearTextureAtlasRegions(target);
}
#else
extern inline function clearTextureAtlasRegions(target:TextureAtlas):Void {
#if hl
	flight._hl._fn.TextureAtlas.clearTextureAtlasRegions(target);
#elseif cpp
	flight._cpp._fn.TextureAtlas.clearTextureAtlasRegions(target);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.clearTextureAtlasRegions(target);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainTextureAtlasRegionTexture(atlas:TextureAtlas, regionId:Int):TextureAtlasRegionTextureExplanation {
	return flight._js._fn.TextureAtlas.explainTextureAtlasRegionTexture(atlas, regionId);
}
#else
extern inline function explainTextureAtlasRegionTexture(atlas:TextureAtlas, regionId:Int):TextureAtlasRegionTextureExplanation {
#if hl
	return flight._hl._fn.TextureAtlas.explainTextureAtlasRegionTexture(atlas, regionId);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.explainTextureAtlasRegionTexture(atlas, regionId);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.explainTextureAtlasRegionTexture(atlas, regionId);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionById(atlas:TextureAtlas, id:Int):Null<Dynamic> {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionById(atlas, id);
}
#else
extern inline function getTextureAtlasRegionById(atlas:TextureAtlas, id:Int):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionById(atlas, id);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionById(atlas, id);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionById(atlas, id);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionByName(atlas:TextureAtlas, name:String):Null<Dynamic> {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionByName(atlas, name);
}
#else
extern inline function getTextureAtlasRegionByName(atlas:TextureAtlas, name:String):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionByName(atlas, cast name);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionByName(atlas, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionByName(atlas, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionByOrdinal(atlas:TextureAtlas, prefix:String, ordinal:Float):Null<Dynamic> {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionByOrdinal(atlas, prefix, ordinal);
}
#else
extern inline function getTextureAtlasRegionByOrdinal(atlas:TextureAtlas, prefix:String, ordinal:Float):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionByOrdinal(atlas, cast prefix, ordinal);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionByOrdinal(atlas, cast prefix, ordinal);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionByOrdinal(atlas, prefix, ordinal);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionCount(atlas:TextureAtlas):Int {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionCount(atlas);
}
#else
extern inline function getTextureAtlasRegionCount(atlas:TextureAtlas):Int {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionCount(atlas);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionCount(atlas);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionCount(atlas);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionFrame(out:Rectangle, region:TextureAtlasRegion):Void {
	flight._js._fn.TextureAtlas.getTextureAtlasRegionFrame(out, region);
}
#else
extern inline function getTextureAtlasRegionFrame(out:Rectangle, region:TextureAtlasRegion):Void {
#if hl
	flight._hl._fn.TextureAtlas.getTextureAtlasRegionFrame(out, region);
#elseif cpp
	flight._cpp._fn.TextureAtlas.getTextureAtlasRegionFrame(out, region);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.getTextureAtlasRegionFrame(out, region);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionOrdinal(region:TextureAtlasRegion):Float {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionOrdinal(region);
}
#else
extern inline function getTextureAtlasRegionOrdinal(region:TextureAtlasRegion):Float {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionOrdinal(region);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionOrdinal(region);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionOrdinal(region);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:Null<TextureAtlasGuardState>):Null<Dynamic> {
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
}
#else
extern inline function getTextureAtlasRegionTexture(atlas:Dynamic, regionId:Int, guards:TextureAtlasGuardState):Dynamic {
#if hl
	return flight._hl._fn.TextureAtlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.getTextureAtlasRegionTexture(atlas, regionId, guards);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionUv(out:Rectangle, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
	flight._js._fn.TextureAtlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
}
#else
extern inline function getTextureAtlasRegionUv(out:Rectangle, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
#if hl
	flight._hl._fn.TextureAtlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#elseif cpp
	flight._cpp._fn.TextureAtlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.getTextureAtlasRegionUv(out, region, imageWidth, imageHeight);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTextureAtlasRegionUvQuad(out:Dynamic, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
	flight._js._fn.TextureAtlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
}
#else
extern inline function getTextureAtlasRegionUvQuad(out:Dynamic, region:TextureAtlasRegion, imageWidth:Float, imageHeight:Float):Void {
#if hl
	flight._hl._fn.TextureAtlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#elseif cpp
	flight._cpp._fn.TextureAtlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.getTextureAtlasRegionUvQuad(out, region, imageWidth, imageHeight);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasTextureAtlasRegion(atlas:TextureAtlas, name:String):Bool {
	return flight._js._fn.TextureAtlas.hasTextureAtlasRegion(atlas, name);
}
#else
extern inline function hasTextureAtlasRegion(atlas:TextureAtlas, name:String):Bool {
#if hl
	return flight._hl._fn.TextureAtlas.hasTextureAtlasRegion(atlas, cast name);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.hasTextureAtlasRegion(atlas, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.hasTextureAtlasRegion(atlas, name);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeTextureAtlasRegion(target:TextureAtlas, id:Int):Bool {
	return flight._js._fn.TextureAtlas.removeTextureAtlasRegion(target, id);
}
#else
extern inline function removeTextureAtlasRegion(target:TextureAtlas, id:Int):Bool {
#if hl
	return flight._hl._fn.TextureAtlas.removeTextureAtlasRegion(target, id);
#elseif cpp
	return flight._cpp._fn.TextureAtlas.removeTextureAtlasRegion(target, id);
#elseif (js && flight_esm)
	return flight._js._fn.TextureAtlas.removeTextureAtlasRegion(target, id);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTextureAtlasRegion(out:TextureAtlasRegion, source:TextureAtlasRegionOptions):Void {
	flight._js._fn.TextureAtlas.setTextureAtlasRegion(out, source);
}
#else
extern inline function setTextureAtlasRegion(out:TextureAtlasRegion, source:TextureAtlasRegionOptions):Void {
#if hl
	flight._hl._fn.TextureAtlas.setTextureAtlasRegion(out, source);
#elseif cpp
	flight._cpp._fn.TextureAtlas.setTextureAtlasRegion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.setTextureAtlasRegion(out, source);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTextureAtlasRegionTextureExplanation(ptr:TextureAtlasRegionTextureExplanation):Void {
	flight._js._fn.TextureAtlas.freeTextureAtlasRegionTextureExplanation(ptr);
}
#else
extern inline function freeTextureAtlasRegionTextureExplanation(ptr:TextureAtlasRegionTextureExplanation):Void {
#if hl
	flight._hl._fn.TextureAtlas.freeTextureAtlasRegionTextureExplanation(ptr);
#elseif cpp
	flight._cpp._fn.TextureAtlas.freeTextureAtlasRegionTextureExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.TextureAtlas.freeTextureAtlasRegionTextureExplanation(ptr);
#else
	#error "flight.TextureAtlas: no backend for this target."
#end
}
#end
