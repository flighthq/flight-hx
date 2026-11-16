package flight._hl;

abstract Tilemap(hl.Bytes) {
	inline public function clear():Void {
		flight._hl._fn.Tilemap.clearTilemap(cast this);
	}
	inline public function clone():hl.Bytes {
		return flight._hl._fn.Tilemap.cloneTilemap(cast this);
	}
	inline public function enableSignals():flight._hl.TilemapSignals {
		return flight._hl._fn.Tilemap.enableTilemapSignals(cast this);
	}
	inline public function fillTiles(id:Int):Void {
		flight._hl._fn.Tilemap.fillTilemapTiles(cast this, id);
	}
	inline public function getColumnAtX(x:Single):Int {
		return flight._hl._fn.Tilemap.getTilemapColumnAtX(cast this, x);
	}
	inline public function getColumnRowAtPoint(out:flight._hl.Vector2, x:Single, y:Single):Bool {
		return flight._hl._fn.Tilemap.getTilemapColumnRowAtPoint(out, cast this, x, y);
	}
	inline public function getRowAtY(y:Single):Int {
		return flight._hl._fn.Tilemap.getTilemapRowAtY(cast this, y);
	}
	inline public function getRuntime():flight._hl.TilemapRuntime {
		return flight._hl._fn.Tilemap.getTilemapRuntime(cast this);
	}
	inline public function getTile(column:Int, row:Int):Int {
		return flight._hl._fn.Tilemap.getTilemapTile(cast this, column, row);
	}
	inline public function getTileAtPoint(point:flight._hl.Vector2):Int {
		return flight._hl._fn.Tilemap.getTilemapTileAtPoint(cast this, point);
	}
	inline public function getTileAtPointXy(x:Single, y:Single):Int {
		return flight._hl._fn.Tilemap.getTilemapTileAtPointXy(cast this, x, y);
	}
	inline public function getTileRect(out:flight._hl.Rectangle, column:Int, row:Int):Bool {
		return flight._hl._fn.Tilemap.getTilemapTileRect(out, cast this, column, row);
	}
	inline public function resize(columns:Int, rows:Int):Void {
		flight._hl._fn.Tilemap.resizeTilemap(cast this, columns, rows);
	}
	inline public function setTile(column:Int, row:Int, id:Int):Void {
		flight._hl._fn.Tilemap.setTilemapTile(cast this, column, row, id);
	}
	inline public function setTileTint(column:Int, row:Int, rgba:Int):Void {
		flight._hl._fn.Tilemap.setTilemapTileTint(cast this, column, row, rgba);
	}
	inline public function setTiles(ids:hl.Bytes, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
		flight._hl._fn.Tilemap.setTilemapTiles(cast this, ids, idsLen, offsetColumn, offsetRow, width, height);
	}
}
