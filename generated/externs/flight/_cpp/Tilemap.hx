package flight._cpp;

private extern class Tilemap_NodeProperties {
	@:native("flight_node_property_get_tilemap_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):Null<NativeByteBuffer>;
	@:native("flight_node_property_set_tilemap_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int, present:Bool):Void;
	@:native("flight_node_property_get_tilemap_alpha")
	static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_node_property_set_tilemap_alpha")
	static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_node_property_get_tilemap_visible")
	static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_node_property_set_tilemap_visible")
	static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_node_property_get_tilemap_blend_mode")
	static function get_blendMode(ptr:cpp.Star<cpp.Void>):Null<NativeByteBuffer>;
	@:native("flight_node_property_set_tilemap_blend_mode")
	static function set_blendMode(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int, present:Bool):Void;
}

abstract Tilemap(cpp.Star<cpp.Void>) {
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
			Tilemap_NodeProperties.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length, true);
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
			Tilemap_NodeProperties.set_blendMode(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length, true);
		}
		return value;
	}

	extern inline public function clear():Void {
		flight._cpp._fn.Tilemap.clearTilemap(cast this);
	}
	extern inline public function clone():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Tilemap.cloneTilemap(cast this);
	}
	extern inline public function enableSignals():flight._cpp.TilemapSignals {
		return flight._cpp._fn.Tilemap.enableTilemapSignals(cast this);
	}
	extern inline public function fillTiles(id:Int):Void {
		flight._cpp._fn.Tilemap.fillTilemapTiles(cast this, id);
	}
	extern inline public function getColumnAtX(x:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapColumnAtX(cast this, x);
	}
	extern inline public function getColumnRowAtPoint(out:flight._cpp.Vector2, x:Single, y:Single):Bool {
		return flight._cpp._fn.Tilemap.getTilemapColumnRowAtPoint(out, cast this, x, y);
	}
	extern inline public function getRowAtY(y:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapRowAtY(cast this, y);
	}
	extern inline public function getTile(column:Int, row:Int):Int {
		return flight._cpp._fn.Tilemap.getTilemapTile(cast this, column, row);
	}
	extern inline public function getTileAtPoint(point:flight._cpp.Vector2):Int {
		return flight._cpp._fn.Tilemap.getTilemapTileAtPoint(cast this, point);
	}
	extern inline public function getTileAtPointXy(x:Single, y:Single):Int {
		return flight._cpp._fn.Tilemap.getTilemapTileAtPointXy(cast this, x, y);
	}
	extern inline public function getTileRect(out:flight._cpp.Rectangle, column:Int, row:Int):Bool {
		return flight._cpp._fn.Tilemap.getTilemapTileRect(out, cast this, column, row);
	}
	extern inline public function resize(columns:Int, rows:Int):Void {
		flight._cpp._fn.Tilemap.resizeTilemap(cast this, columns, rows);
	}
	extern inline public function setTile(column:Int, row:Int, id:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTile(cast this, column, row, id);
	}
	extern inline public function setTileTint(column:Int, row:Int, rgba:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTileTint(cast this, column, row, rgba);
	}
	extern inline public function setTiles(ids:cpp.Star<cpp.Void>, idsLen:Int, offsetColumn:Int, offsetRow:Int, width:Int, height:Int):Void {
		flight._cpp._fn.Tilemap.setTilemapTiles(cast this, ids, idsLen, offsetColumn, offsetRow, width, height);
	}
}
