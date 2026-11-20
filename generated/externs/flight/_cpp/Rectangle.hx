package flight._cpp;

private extern class Rectangle_Ffi {
	@:native("flight_get_rectangle_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rectangle_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rectangle_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rectangle_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rectangle_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rectangle_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_rectangle_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rectangle_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Rectangle(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Rectangle_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Rectangle_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Rectangle_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Rectangle_Ffi.set_y(this, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return Rectangle_Ffi.get_width(this);

	inline function set_width(value:Float):Float { Rectangle_Ffi.set_width(this, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return Rectangle_Ffi.get_height(this);

	inline function set_height(value:Float):Float { Rectangle_Ffi.set_height(this, value); return value; }

	extern inline public function createClipRegionFrom():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Clip.createClipRegionFromRectangle(cast this);
	}
	extern inline public function clipRegionContains(clip:cpp.Star<cpp.Void>):Bool {
		return flight._cpp._fn.Clip.clipRegionContainsRectangle(clip, cast this);
	}
	extern inline public function clipRegionIntersects(clip:cpp.Star<cpp.Void>):Bool {
		return flight._cpp._fn.Clip.clipRegionIntersectsRectangle(clip, cast this);
	}
	extern inline public function setClipRegionTo(out:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Clip.setClipRegionToRectangle(out, cast this);
	}
	extern inline public function createClipRegionFromRounded(radius:Float, tolerance:Float):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Clip.createClipRegionFromRoundedRectangle(cast this, radius, tolerance);
	}
	extern inline public function matrixTransform(matrix:flight._cpp.Matrix, source:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.matrixTransformRectangle(cast this, matrix, source);
	}
	static extern inline public function create(x:Float, y:Float, width:Float, height:Float):flight._cpp.Rectangle {
		return flight._cpp._fn.Geometry.createRectangle(x, y, width, height);
	}
	extern inline public function clone():flight._cpp.Rectangle {
		return flight._cpp._fn.Geometry.cloneRectangle(cast this);
	}
	extern inline public function computeIntersection(a:flight._cpp.Rectangle, b:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.computeRectangleIntersection(cast this, a, b);
	}
	extern inline public function containsPoint(vector:flight._cpp.Vector2):Bool {
		return flight._cpp._fn.Geometry.containsRectanglePoint(cast this, vector);
	}
	extern inline public function containsPointXy(x:Float, y:Float):Bool {
		return flight._cpp._fn.Geometry.containsRectanglePointXy(cast this, x, y);
	}
	extern inline public function copy(source:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.copyRectangle(cast this, source);
	}
	extern inline public function encloses(other:flight._cpp.Rectangle):Bool {
		return flight._cpp._fn.Geometry.enclosesRectangle(cast this, other);
	}
	extern inline public function equals(b:flight._cpp.Rectangle):Bool {
		return flight._cpp._fn.Geometry.equalsRectangle(cast this, b);
	}
	extern inline public function expandToPoint(sourceRect:flight._cpp.Rectangle, sourceVec2:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.expandRectangleToPoint(cast this, sourceRect, sourceVec2);
	}
	extern inline public function getBottom():Float {
		return flight._cpp._fn.Geometry.getRectangleBottom(cast this);
	}
	extern inline public function getBottomRight(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleBottomRight(out, cast this);
	}
	extern inline public function getLeft():Float {
		return flight._cpp._fn.Geometry.getRectangleLeft(cast this);
	}
	extern inline public function getMaxX():Float {
		return flight._cpp._fn.Geometry.getRectangleMaxX(cast this);
	}
	extern inline public function getMaxY():Float {
		return flight._cpp._fn.Geometry.getRectangleMaxY(cast this);
	}
	extern inline public function getMinX():Float {
		return flight._cpp._fn.Geometry.getRectangleMinX(cast this);
	}
	extern inline public function getMinY():Float {
		return flight._cpp._fn.Geometry.getRectangleMinY(cast this);
	}
	extern inline public function getNormalizedBottomRight(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleNormalizedBottomRight(out, cast this);
	}
	extern inline public function getNormalizedTopLeft(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleNormalizedTopLeft(out, cast this);
	}
	extern inline public function getRight():Float {
		return flight._cpp._fn.Geometry.getRectangleRight(cast this);
	}
	extern inline public function getSize(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleSize(out, cast this);
	}
	extern inline public function getTop():Float {
		return flight._cpp._fn.Geometry.getRectangleTop(cast this);
	}
	extern inline public function getTopLeft(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleTopLeft(out, cast this);
	}
	extern inline public function inflate(source:flight._cpp.Rectangle, dx:Float, dy:Float):Void {
		flight._cpp._fn.Geometry.inflateRectangle(cast this, source, dx, dy);
	}
	extern inline public function intersects(b:flight._cpp.Rectangle):Bool {
		return flight._cpp._fn.Geometry.intersectsRectangle(cast this, b);
	}
	extern inline public function isEmpty():Bool {
		return flight._cpp._fn.Geometry.isEmptyRectangle(cast this);
	}
	extern inline public function isFlippedX():Bool {
		return flight._cpp._fn.Geometry.isFlippedXRectangle(cast this);
	}
	extern inline public function isFlippedY():Bool {
		return flight._cpp._fn.Geometry.isFlippedYRectangle(cast this);
	}
	extern inline public function merge(source:flight._cpp.Rectangle, other:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.mergeRectangle(cast this, source, other);
	}
	extern inline public function normalize(source:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.normalizeRectangle(cast this, source);
	}
	extern inline public function offset(source:flight._cpp.Rectangle, dx:Float, dy:Float):Void {
		flight._cpp._fn.Geometry.offsetRectangle(cast this, source, dx, dy);
	}
	extern inline public function offsetByPoint(source:flight._cpp.Rectangle, point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.offsetRectangleByPoint(cast this, source, point);
	}
	extern inline public function setEmpty():Void {
		flight._cpp._fn.Geometry.setEmptyRectangle(cast this);
	}
	extern inline public function set(x:Float, y:Float, width:Float, height:Float):Void {
		flight._cpp._fn.Geometry.setRectangle(cast this, x, y, width, height);
	}
	extern inline public function setBottom(value:Float):Void {
		flight._cpp._fn.Geometry.setRectangleBottom(cast this, value);
	}
	extern inline public function setBottomRight(point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.setRectangleBottomRight(cast this, point);
	}
	extern inline public function setLeft(value:Float):Void {
		flight._cpp._fn.Geometry.setRectangleLeft(cast this, value);
	}
	extern inline public function setRight(value:Float):Void {
		flight._cpp._fn.Geometry.setRectangleRight(cast this, value);
	}
	extern inline public function setSize(size:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.setRectangleSize(cast this, size);
	}
	extern inline public function setTop(value:Float):Void {
		flight._cpp._fn.Geometry.setRectangleTop(cast this, value);
	}
	extern inline public function setTopLeft(point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.setRectangleTopLeft(cast this, point);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseRectangle(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeRectangle(cast this);
	}
	extern inline public function computeTextBounds(spec:flight._cpp.TextBoundsSpec, layout:flight._cpp.TextLayoutResult):Void {
		flight._cpp._fn.Textlayout.computeTextBoundsRectangle(cast this, spec, layout);
	}
	extern inline public function addTextureAtlasRegion(target:flight._cpp.TextureAtlas, pivot:flight._cpp.Vector2, name:cpp.ConstCharStar):Void {
		flight._cpp._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, cast this, pivot, name);
	}
}
