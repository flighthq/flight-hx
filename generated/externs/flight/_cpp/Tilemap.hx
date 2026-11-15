package flight._cpp;

abstract Tilemap(cpp.Star<cpp.Void>) {
	inline public function clear():Void {
		flight._cpp._fn.Tilemap.clearTilemap(cast this);
	}
	inline public function clone():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Tilemap.cloneTilemap(cast this);
	}
	inline public function enableSignals():flight._cpp.TilemapSignals {
		return flight._cpp._fn.Tilemap.enableTilemapSignals(cast this);
	}
	inline public function fillTiles(id:Int):Void {
		flight._cpp._fn.Tilemap.fillTilemapTiles(cast this, id);
	}
	inline public function getColumnAtX(x:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapColumnAtX(cast this, x);
	}
	inline public function getColumnRowAtPoint(out:flight._cpp.Vector2, x:Single, y:Single):Bool {
		return flight._cpp._fn.Tilemap.getTilemapColumnRowAtPoint(out, cast this, x, y);
	}
	inline public function getRowAtY(y:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapRowAtY(cast this, y);
	}
	inline public function getRuntime():flight._cpp.TilemapRuntime {
		return flight._cpp._fn.Tilemap.getTilemapRuntime(cast this);
	}
	inline public function getTile(column:Int, row:Int):Int {
		return flight._cpp._fn.Tilemap.getTilemapTile(cast this, column, row);
	}
	inline public function getTileAtPoint(point:flight._cpp.Vector2):Int {
		return flight._cpp._fn.Tilemap.getTilemapTileAtPoint(cast this, point);
	}
	inline public function getTileAtPointXy(x:Single, y:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapTileAtPointXy(cast this, x, y);
	}
	inline public function getTileRect(out:flight._cpp.Rectangle, column:Int, row:Int):Bool {
		return flight._cpp._fn.Tilemap.getTilemapTileRect(out, cast this, column, row);
	}
	inline public function resize(columns:Int, rows:Int):Void {
		flight._cpp._fn.Tilemap.resizeTilemap(cast this, columns, rows);
	}
	inline public function setTile(column:Int, row:Int, id:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTile(cast this, column, row, id);
	}
	inline public function setTileTint(column:Int, row:Int, rgba:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTileTint(cast this, column, row, rgba);
	}
	inline public function setTiles(ids:cpp.Star<cpp.Void>, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTiles(cast this, ids, idsLen, offsetColumn, offsetRow, width, height);
	}
}
