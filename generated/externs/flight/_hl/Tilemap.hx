package flight._hl;

private extern class Tilemap_NodeProperties {
	@:hlNative("flight", "flight_node_property_get_tilemap_name")
	static function get_name(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_tilemap_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
	@:hlNative("flight", "flight_node_property_get_tilemap_alpha")
	static function get_alpha(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_node_property_set_tilemap_alpha")
	static function set_alpha(ptr:hl.Bytes, value:Single):Void;
	@:hlNative("flight", "flight_node_property_get_tilemap_visible")
	static function get_visible(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_node_property_set_tilemap_visible")
	static function set_visible(ptr:hl.Bytes, value:Bool):Void;
	@:hlNative("flight", "flight_node_property_get_tilemap_blend_mode")
	static function get_blendMode(ptr:hl.Bytes):Null<NativeByteBuffer>;
	@:hlNative("flight", "flight_node_property_set_tilemap_blend_mode")
	static function set_blendMode(ptr:hl.Bytes, data:hl.Bytes, length:Int, present:Bool):Void;
}

abstract Tilemap(hl.Bytes) {
	public var name(get, set):Null<String>;
	inline function get_name():Null<String> {
		final buffer = Tilemap_NodeProperties.get_name(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_name(value:Null<String>):Null<String> {
		if (value == null) {
			Tilemap_NodeProperties.set_name(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			Tilemap_NodeProperties.set_name(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

	public var alpha(get, set):Single;
	inline function get_alpha():Single return Tilemap_NodeProperties.get_alpha(this);
	inline function set_alpha(value:Single):Single { Tilemap_NodeProperties.set_alpha(this, value); return value; }

	public var visible(get, set):Bool;
	inline function get_visible():Bool return Tilemap_NodeProperties.get_visible(this);
	inline function set_visible(value:Bool):Bool { Tilemap_NodeProperties.set_visible(this, value); return value; }

	public var blendMode(get, set):Null<String>;
	inline function get_blendMode():Null<String> {
		final buffer = Tilemap_NodeProperties.get_blendMode(this);
		if (buffer == null) return null;
		try {
			final value = buffer.toBytes().toString();
			buffer.dispose();
			return value;
		} catch (error:Dynamic) { buffer.dispose(); throw error; }
	}
	inline function set_blendMode(value:Null<String>):Null<String> {
		if (value == null) {
			Tilemap_NodeProperties.set_blendMode(this, null, 0, false);
		} else {
			final bytes = haxe.io.Bytes.ofString(value);
			Tilemap_NodeProperties.set_blendMode(this, bytes.getData().bytes, bytes.length, true);
		}
		return value;
	}

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
