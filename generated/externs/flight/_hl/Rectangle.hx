package flight._hl;

abstract Rectangle(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(16);

	inline function set_x(value:Float):Float { this.setF64(16, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(24);

	inline function set_y(value:Float):Float { this.setF64(24, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(32);

	inline function set_width(value:Float):Float { this.setF64(32, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(40);

	inline function set_height(value:Float):Float { this.setF64(40, value); return value; }

	inline public function createClipRegionFrom():hl.Bytes {
		return flight._hl._fn.Clip.createClipRegionFromRectangle(cast this);
	}
	inline public function clipRegionContains(clip:hl.Bytes):Bool {
		return flight._hl._fn.Clip.clipRegionContainsRectangle(clip, cast this);
	}
	inline public function clipRegionIntersects(clip:hl.Bytes):Bool {
		return flight._hl._fn.Clip.clipRegionIntersectsRectangle(clip, cast this);
	}
	inline public function setClipRegionTo(out:hl.Bytes):Void {
		flight._hl._fn.Clip.setClipRegionToRectangle(out, cast this);
	}
	inline public function createClipRegionFromRounded(radius:Float, tolerance:Float):hl.Bytes {
		return flight._hl._fn.Clip.createClipRegionFromRoundedRectangle(cast this, radius, tolerance);
	}
	inline public function matrixTransform(matrix:flight._hl.Matrix, source:flight._hl.Rectangle):Void {
		flight._hl._fn.Geometry.matrixTransformRectangle(cast this, matrix, source);
	}
	static inline public function create(x:Float, y:Float, width:Float, height:Float):flight._hl.Rectangle {
		return flight._hl._fn.Geometry.createRectangle(x, y, width, height);
	}
	inline public function clone():flight._hl.Rectangle {
		return flight._hl._fn.Geometry.cloneRectangle(cast this);
	}
	inline public function computeIntersection(a:flight._hl.Rectangle, b:flight._hl.Rectangle):Void {
		flight._hl._fn.Geometry.computeRectangleIntersection(cast this, a, b);
	}
	inline public function containsPoint(vector:flight._hl.Vector2):Bool {
		return flight._hl._fn.Geometry.containsRectanglePoint(cast this, vector);
	}
	inline public function containsPointXy(x:Float, y:Float):Bool {
		return flight._hl._fn.Geometry.containsRectanglePointXy(cast this, x, y);
	}
	inline public function copy(source:flight._hl.Rectangle):Void {
		flight._hl._fn.Geometry.copyRectangle(cast this, source);
	}
	inline public function encloses(other:flight._hl.Rectangle):Bool {
		return flight._hl._fn.Geometry.enclosesRectangle(cast this, other);
	}
	inline public function equals(b:flight._hl.Rectangle):Bool {
		return flight._hl._fn.Geometry.equalsRectangle(cast this, b);
	}
	inline public function expandToPoint(sourceRect:flight._hl.Rectangle, sourceVec2:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.expandRectangleToPoint(cast this, sourceRect, sourceVec2);
	}
	inline public function getBottom():Float {
		return flight._hl._fn.Geometry.getRectangleBottom(cast this);
	}
	inline public function getBottomRight(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.getRectangleBottomRight(out, cast this);
	}
	inline public function getLeft():Float {
		return flight._hl._fn.Geometry.getRectangleLeft(cast this);
	}
	inline public function getMaxX():Float {
		return flight._hl._fn.Geometry.getRectangleMaxX(cast this);
	}
	inline public function getMaxY():Float {
		return flight._hl._fn.Geometry.getRectangleMaxY(cast this);
	}
	inline public function getMinX():Float {
		return flight._hl._fn.Geometry.getRectangleMinX(cast this);
	}
	inline public function getMinY():Float {
		return flight._hl._fn.Geometry.getRectangleMinY(cast this);
	}
	inline public function getNormalizedBottomRight(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.getRectangleNormalizedBottomRight(out, cast this);
	}
	inline public function getNormalizedTopLeft(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.getRectangleNormalizedTopLeft(out, cast this);
	}
	inline public function getRight():Float {
		return flight._hl._fn.Geometry.getRectangleRight(cast this);
	}
	inline public function getSize(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.getRectangleSize(out, cast this);
	}
	inline public function getTop():Float {
		return flight._hl._fn.Geometry.getRectangleTop(cast this);
	}
	inline public function getTopLeft(out:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.getRectangleTopLeft(out, cast this);
	}
	inline public function inflate(source:flight._hl.Rectangle, dx:Float, dy:Float):Void {
		flight._hl._fn.Geometry.inflateRectangle(cast this, source, dx, dy);
	}
	inline public function intersects(b:flight._hl.Rectangle):Bool {
		return flight._hl._fn.Geometry.intersectsRectangle(cast this, b);
	}
	inline public function isEmpty():Bool {
		return flight._hl._fn.Geometry.isEmptyRectangle(cast this);
	}
	inline public function isFlippedX():Bool {
		return flight._hl._fn.Geometry.isFlippedXRectangle(cast this);
	}
	inline public function isFlippedY():Bool {
		return flight._hl._fn.Geometry.isFlippedYRectangle(cast this);
	}
	inline public function merge(source:flight._hl.Rectangle, other:flight._hl.Rectangle):Void {
		flight._hl._fn.Geometry.mergeRectangle(cast this, source, other);
	}
	inline public function normalize(source:flight._hl.Rectangle):Void {
		flight._hl._fn.Geometry.normalizeRectangle(cast this, source);
	}
	inline public function offset(source:flight._hl.Rectangle, dx:Float, dy:Float):Void {
		flight._hl._fn.Geometry.offsetRectangle(cast this, source, dx, dy);
	}
	inline public function offsetByPoint(source:flight._hl.Rectangle, point:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.offsetRectangleByPoint(cast this, source, point);
	}
	inline public function setEmpty():Void {
		flight._hl._fn.Geometry.setEmptyRectangle(cast this);
	}
	inline public function set(x:Float, y:Float, width:Float, height:Float):Void {
		flight._hl._fn.Geometry.setRectangle(cast this, x, y, width, height);
	}
	inline public function setBottom(value:Float):Void {
		flight._hl._fn.Geometry.setRectangleBottom(cast this, value);
	}
	inline public function setBottomRight(point:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.setRectangleBottomRight(cast this, point);
	}
	inline public function setLeft(value:Float):Void {
		flight._hl._fn.Geometry.setRectangleLeft(cast this, value);
	}
	inline public function setRight(value:Float):Void {
		flight._hl._fn.Geometry.setRectangleRight(cast this, value);
	}
	inline public function setSize(size:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.setRectangleSize(cast this, size);
	}
	inline public function setTop(value:Float):Void {
		flight._hl._fn.Geometry.setRectangleTop(cast this, value);
	}
	inline public function setTopLeft(point:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.setRectangleTopLeft(cast this, point);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseRectangle(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeRectangle(cast this);
	}
	inline public function computeTextBounds(spec:flight._hl.TextBoundsSpec, layout:flight._hl.TextLayoutResult):Void {
		flight._hl._fn.Textlayout.computeTextBoundsRectangle(cast this, spec, layout);
	}
	inline public function addTextureAtlasRegion(target:flight._hl.TextureAtlas, pivot:flight._hl.Vector2, name:hl.Bytes):Void {
		flight._hl._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, cast this, pivot, name);
	}
}
