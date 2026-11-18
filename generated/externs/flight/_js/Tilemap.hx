package flight._js;

abstract Tilemap(Dynamic) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> return untyped this.name;
	inline function set_name(value:Null<String>):Null<String> { untyped this.name = value; return value; }

	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float { untyped this.alpha = value; flight.Node.invalidateNodeAppearance(this); return value; }

	public var visible(get, set):Bool;
	inline function get_visible():Bool return untyped this.visible;
	inline function set_visible(value:Bool):Bool { untyped this.visible = value; flight.Node.invalidateNodeAppearance(this); return value; }

	public var blendMode(get, set):Null<String>;
	inline function get_blendMode():Null<String> return untyped this.blendMode;
	inline function set_blendMode(value:Null<String>):Null<String> { untyped this.blendMode = value; flight.Node.invalidateNodeAppearance(this); return value; }

	inline public function clear():Void {
		flight._js._fn.Tilemap.clearTilemap(cast this);
	}
	inline public function clone():Dynamic {
		return flight._js._fn.Tilemap.cloneTilemap(cast this);
	}
	inline public function enableSignals():flight._js.TilemapSignals {
		return flight._js._fn.Tilemap.enableTilemapSignals(cast this);
	}
	inline public function fillTiles(id:Int):Void {
		flight._js._fn.Tilemap.fillTilemapTiles(cast this, id);
	}
	inline public function getColumnAtX(x:Float):Int {
		return flight._js._fn.Tilemap.getTilemapColumnAtX(cast this, x);
	}
	inline public function getColumnRowAtPoint(out:flight._js.Vector2, x:Float, y:Float):Bool {
		return flight._js._fn.Tilemap.getTilemapColumnRowAtPoint(out, cast this, x, y);
	}
	inline public function getRowAtY(y:Float):Int {
		return flight._js._fn.Tilemap.getTilemapRowAtY(cast this, y);
	}
	inline public function getTile(column:Int, row:Int):Int {
		return flight._js._fn.Tilemap.getTilemapTile(cast this, column, row);
	}
	inline public function getTileAtPoint(point:flight._js.Vector2):Int {
		return flight._js._fn.Tilemap.getTilemapTileAtPoint(cast this, point);
	}
	inline public function getTileAtPointXy(x:Float, y:Float):Int {
		return flight._js._fn.Tilemap.getTilemapTileAtPointXy(cast this, x, y);
	}
	inline public function getTileRect(out:flight._js.Rectangle, column:Int, row:Int):Bool {
		return flight._js._fn.Tilemap.getTilemapTileRect(out, cast this, column, row);
	}
	inline public function resize(columns:Int, rows:Int):Void {
		flight._js._fn.Tilemap.resizeTilemap(cast this, columns, rows);
	}
	inline public function setTile(column:Int, row:Int, id:Int):Void {
		flight._js._fn.Tilemap.setTilemapTile(cast this, column, row, id);
	}
	inline public function setTileTint(column:Int, row:Int, rgba:Int):Void {
		flight._js._fn.Tilemap.setTilemapTileTint(cast this, column, row, rgba);
	}
	inline public function setTiles(ids:Dynamic, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
		flight._js._fn.Tilemap.setTilemapTiles(cast this, ids, offsetColumn, offsetRow, width, height);
	}
}
