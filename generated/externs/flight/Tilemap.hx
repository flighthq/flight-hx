package flight;

#if hl

typedef Tilemap = flight._hl.Tilemap;

#elseif cpp

typedef Tilemap = flight._cpp.Tilemap;

#elseif (js && flight_esm)

typedef Tilemap = flight._js.Tilemap;

#elseif js

#error "flight.Tilemap on js requires flight_esm."

#else

#error "flight.Tilemap: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createTilemap():Dynamic {
	return flight._js._fn.Tilemap.createTilemap();
}
#else
extern inline function createTilemap():Dynamic {
#if hl
	return flight._hl._fn.Tilemap.createTilemap();
#elseif cpp
	return flight._cpp._fn.Tilemap.createTilemap();
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.createTilemap();
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTilemapData():TilemapData {
	return flight._js._fn.Tilemap.createTilemapData();
}
#else
extern inline function createTilemapData():TilemapData {
#if hl
	return flight._hl._fn.Tilemap.createTilemapData();
#elseif cpp
	return flight._cpp._fn.Tilemap.createTilemapData();
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.createTilemapData();
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTilemapRuntime():TilemapRuntime {
	return flight._js._fn.Tilemap.createTilemapRuntime();
}
#else
extern inline function createTilemapRuntime():TilemapRuntime {
#if hl
	return flight._hl._fn.Tilemap.createTilemapRuntime();
#elseif cpp
	return flight._cpp._fn.Tilemap.createTilemapRuntime();
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.createTilemapRuntime();
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createTilemapSignals():TilemapSignals {
	return flight._js._fn.Tilemap.createTilemapSignals();
}
#else
extern inline function createTilemapSignals():TilemapSignals {
#if hl
	return flight._hl._fn.Tilemap.createTilemapSignals();
#elseif cpp
	return flight._cpp._fn.Tilemap.createTilemapSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.createTilemapSignals();
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearTilemap(tilemap:Tilemap):Void {
	flight._js._fn.Tilemap.clearTilemap(tilemap);
}
#else
extern inline function clearTilemap(tilemap:Tilemap):Void {
#if hl
	flight._hl._fn.Tilemap.clearTilemap(tilemap);
#elseif cpp
	flight._cpp._fn.Tilemap.clearTilemap(tilemap);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.clearTilemap(tilemap);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function cloneTilemap(source:Tilemap):Dynamic {
	return flight._js._fn.Tilemap.cloneTilemap(source);
}
#else
extern inline function cloneTilemap(source:Tilemap):Dynamic {
#if hl
	return flight._hl._fn.Tilemap.cloneTilemap(source);
#elseif cpp
	return flight._cpp._fn.Tilemap.cloneTilemap(source);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.cloneTilemap(source);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeTilemapLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Tilemap.computeTilemapLocalBoundsRectangle(out, source);
}
#else
extern inline function computeTilemapLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Tilemap.computeTilemapLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Tilemap.computeTilemapLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.computeTilemapLocalBoundsRectangle(out, source);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableTilemapSignals(target:Tilemap):TilemapSignals {
	return flight._js._fn.Tilemap.enableTilemapSignals(target);
}
#else
extern inline function enableTilemapSignals(target:Tilemap):TilemapSignals {
#if hl
	return flight._hl._fn.Tilemap.enableTilemapSignals(target);
#elseif cpp
	return flight._cpp._fn.Tilemap.enableTilemapSignals(target);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.enableTilemapSignals(target);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function fillTilemapTiles(tilemap:Tilemap, id:Int):Void {
	flight._js._fn.Tilemap.fillTilemapTiles(tilemap, id);
}
#else
extern inline function fillTilemapTiles(tilemap:Tilemap, id:Int):Void {
#if hl
	flight._hl._fn.Tilemap.fillTilemapTiles(tilemap, id);
#elseif cpp
	flight._cpp._fn.Tilemap.fillTilemapTiles(tilemap, id);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.fillTilemapTiles(tilemap, id);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapColumnAtX(source:Tilemap, x:Float):Int {
	return flight._js._fn.Tilemap.getTilemapColumnAtX(source, x);
}
#else
extern inline function getTilemapColumnAtX(source:Tilemap, x:Float):Int {
#if hl
	return flight._hl._fn.Tilemap.getTilemapColumnAtX(source, x);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapColumnAtX(source, x);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapColumnAtX(source, x);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapColumnRowAtPoint(out:Vector2, source:Tilemap, x:Float, y:Float):Bool {
	return flight._js._fn.Tilemap.getTilemapColumnRowAtPoint(out, source, x, y);
}
#else
extern inline function getTilemapColumnRowAtPoint(out:Vector2, source:Tilemap, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Tilemap.getTilemapColumnRowAtPoint(out, source, x, y);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapColumnRowAtPoint(out, source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapColumnRowAtPoint(out, source, x, y);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapRowAtY(source:Tilemap, y:Float):Int {
	return flight._js._fn.Tilemap.getTilemapRowAtY(source, y);
}
#else
extern inline function getTilemapRowAtY(source:Tilemap, y:Float):Int {
#if hl
	return flight._hl._fn.Tilemap.getTilemapRowAtY(source, y);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapRowAtY(source, y);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapRowAtY(source, y);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapRuntime(source:Tilemap):TilemapRuntime {
	return flight._js._fn.Tilemap.getTilemapRuntime(source);
}
#else
extern inline function getTilemapRuntime(source:Tilemap):TilemapRuntime {
#if hl
	return flight._hl._fn.Tilemap.getTilemapRuntime(source);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapRuntime(source);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapTile(tilemap:Tilemap, column:Int, row:Int):Int {
	return flight._js._fn.Tilemap.getTilemapTile(tilemap, column, row);
}
#else
extern inline function getTilemapTile(tilemap:Tilemap, column:Int, row:Int):Int {
#if hl
	return flight._hl._fn.Tilemap.getTilemapTile(tilemap, column, row);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapTile(tilemap, column, row);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapTile(tilemap, column, row);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapTileAtPoint(source:Tilemap, point:Vector2):Int {
	return flight._js._fn.Tilemap.getTilemapTileAtPoint(source, point);
}
#else
extern inline function getTilemapTileAtPoint(source:Tilemap, point:Vector2):Int {
#if hl
	return flight._hl._fn.Tilemap.getTilemapTileAtPoint(source, point);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapTileAtPoint(source, point);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapTileAtPoint(source, point);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapTileAtPointXy(source:Tilemap, x:Float, y:Float):Int {
	return flight._js._fn.Tilemap.getTilemapTileAtPointXy(source, x, y);
}
#else
extern inline function getTilemapTileAtPointXy(source:Tilemap, x:Float, y:Float):Int {
#if hl
	return flight._hl._fn.Tilemap.getTilemapTileAtPointXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapTileAtPointXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapTileAtPointXy(source, x, y);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getTilemapTileRect(out:Rectangle, source:Tilemap, column:Int, row:Int):Bool {
	return flight._js._fn.Tilemap.getTilemapTileRect(out, source, column, row);
}
#else
extern inline function getTilemapTileRect(out:Rectangle, source:Tilemap, column:Int, row:Int):Bool {
#if hl
	return flight._hl._fn.Tilemap.getTilemapTileRect(out, source, column, row);
#elseif cpp
	return flight._cpp._fn.Tilemap.getTilemapTileRect(out, source, column, row);
#elseif (js && flight_esm)
	return flight._js._fn.Tilemap.getTilemapTileRect(out, source, column, row);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resizeTilemap(tilemap:Tilemap, columns:Int, rows:Int):Void {
	flight._js._fn.Tilemap.resizeTilemap(tilemap, columns, rows);
}
#else
extern inline function resizeTilemap(tilemap:Tilemap, columns:Int, rows:Int):Void {
#if hl
	flight._hl._fn.Tilemap.resizeTilemap(tilemap, columns, rows);
#elseif cpp
	flight._cpp._fn.Tilemap.resizeTilemap(tilemap, columns, rows);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.resizeTilemap(tilemap, columns, rows);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTilemapTile(tilemap:Tilemap, column:Int, row:Int, id:Int):Void {
	flight._js._fn.Tilemap.setTilemapTile(tilemap, column, row, id);
}
#else
extern inline function setTilemapTile(tilemap:Tilemap, column:Int, row:Int, id:Int):Void {
#if hl
	flight._hl._fn.Tilemap.setTilemapTile(tilemap, column, row, id);
#elseif cpp
	flight._cpp._fn.Tilemap.setTilemapTile(tilemap, column, row, id);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.setTilemapTile(tilemap, column, row, id);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTilemapTileTint(tilemap:Tilemap, column:Int, row:Int, rgba:Int):Void {
	flight._js._fn.Tilemap.setTilemapTileTint(tilemap, column, row, rgba);
}
#else
extern inline function setTilemapTileTint(tilemap:Tilemap, column:Int, row:Int, rgba:Int):Void {
#if hl
	flight._hl._fn.Tilemap.setTilemapTileTint(tilemap, column, row, rgba);
#elseif cpp
	flight._cpp._fn.Tilemap.setTilemapTileTint(tilemap, column, row, rgba);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.setTilemapTileTint(tilemap, column, row, rgba);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setTilemapTiles(tilemap:Tilemap, ids:Dynamic, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
	flight._js._fn.Tilemap.setTilemapTiles(tilemap, ids, offsetColumn, offsetRow, width, height);
}
#else
extern inline function setTilemapTiles(tilemap:Tilemap, ids:Dynamic, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
#if hl
	flight._hl._fn.Tilemap.setTilemapTiles(tilemap, ids, idsLen, offsetColumn, offsetRow, width, height);
#elseif cpp
	flight._cpp._fn.Tilemap.setTilemapTiles(tilemap, ids, idsLen, offsetColumn, offsetRow, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.setTilemapTiles(tilemap, ids, idsLen, offsetColumn, offsetRow, width, height);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTilemapData(ptr:TilemapData):Void {
	flight._js._fn.Tilemap.freeTilemapData(ptr);
}
#else
extern inline function freeTilemapData(ptr:TilemapData):Void {
#if hl
	flight._hl._fn.Tilemap.freeTilemapData(ptr);
#elseif cpp
	flight._cpp._fn.Tilemap.freeTilemapData(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.freeTilemapData(ptr);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTilemapRuntime(ptr:TilemapRuntime):Void {
	flight._js._fn.Tilemap.freeTilemapRuntime(ptr);
}
#else
extern inline function freeTilemapRuntime(ptr:TilemapRuntime):Void {
#if hl
	flight._hl._fn.Tilemap.freeTilemapRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Tilemap.freeTilemapRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.freeTilemapRuntime(ptr);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeTilemapSignals(ptr:TilemapSignals):Void {
	flight._js._fn.Tilemap.freeTilemapSignals(ptr);
}
#else
extern inline function freeTilemapSignals(ptr:TilemapSignals):Void {
#if hl
	flight._hl._fn.Tilemap.freeTilemapSignals(ptr);
#elseif cpp
	flight._cpp._fn.Tilemap.freeTilemapSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Tilemap.freeTilemapSignals(ptr);
#else
	#error "flight.Tilemap: no backend for this target."
#end
}
#end
