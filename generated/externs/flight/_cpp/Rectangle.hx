package flight._cpp;

private extern class Rectangle_Ffi {
	@:native("flight_get_rectangle_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rectangle_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rectangle_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rectangle_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rectangle_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rectangle_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rectangle_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rectangle_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Rectangle(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Rectangle_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Rectangle_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Rectangle_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Rectangle_Ffi.set_y(this, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return Rectangle_Ffi.get_width(this);

	inline function set_width(value:Single):Single { Rectangle_Ffi.set_width(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return Rectangle_Ffi.get_height(this);

	inline function set_height(value:Single):Single { Rectangle_Ffi.set_height(this, value); return value; }

	extern inline public function matrixTransform(matrix:flight._cpp.Matrix, source:flight._cpp.Rectangle):Void {
		flight._cpp._fn.Geometry.matrixTransformRectangle(cast this, matrix, source);
	}
	static extern inline public function create(x:Single, y:Single, width:Single, height:Single):flight._cpp.Rectangle {
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
	extern inline public function containsPointXy(x:Single, y:Single):Bool {
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
	extern inline public function getBottom():Single {
		return flight._cpp._fn.Geometry.getRectangleBottom(cast this);
	}
	extern inline public function getBottomRight(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleBottomRight(out, cast this);
	}
	extern inline public function getLeft():Single {
		return flight._cpp._fn.Geometry.getRectangleLeft(cast this);
	}
	extern inline public function getMaxX():Single {
		return flight._cpp._fn.Geometry.getRectangleMaxX(cast this);
	}
	extern inline public function getMaxY():Single {
		return flight._cpp._fn.Geometry.getRectangleMaxY(cast this);
	}
	extern inline public function getMinX():Single {
		return flight._cpp._fn.Geometry.getRectangleMinX(cast this);
	}
	extern inline public function getMinY():Single {
		return flight._cpp._fn.Geometry.getRectangleMinY(cast this);
	}
	extern inline public function getNormalizedBottomRight(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleNormalizedBottomRight(out, cast this);
	}
	extern inline public function getNormalizedTopLeft(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleNormalizedTopLeft(out, cast this);
	}
	extern inline public function getRight():Single {
		return flight._cpp._fn.Geometry.getRectangleRight(cast this);
	}
	extern inline public function getSize(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleSize(out, cast this);
	}
	extern inline public function getTop():Single {
		return flight._cpp._fn.Geometry.getRectangleTop(cast this);
	}
	extern inline public function getTopLeft(out:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.getRectangleTopLeft(out, cast this);
	}
	extern inline public function inflate(source:flight._cpp.Rectangle, dx:Single, dy:Single):Void {
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
	extern inline public function offset(source:flight._cpp.Rectangle, dx:Single, dy:Single):Void {
		flight._cpp._fn.Geometry.offsetRectangle(cast this, source, dx, dy);
	}
	extern inline public function offsetByPoint(source:flight._cpp.Rectangle, point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.offsetRectangleByPoint(cast this, source, point);
	}
	extern inline public function setEmpty():Void {
		flight._cpp._fn.Geometry.setEmptyRectangle(cast this);
	}
	extern inline public function set(x:Single, y:Single, width:Single, height:Single):Void {
		flight._cpp._fn.Geometry.setRectangle(cast this, x, y, width, height);
	}
	extern inline public function setBottom(value:Single):Void {
		flight._cpp._fn.Geometry.setRectangleBottom(cast this, value);
	}
	extern inline public function setBottomRight(point:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.setRectangleBottomRight(cast this, point);
	}
	extern inline public function setLeft(value:Single):Void {
		flight._cpp._fn.Geometry.setRectangleLeft(cast this, value);
	}
	extern inline public function setRight(value:Single):Void {
		flight._cpp._fn.Geometry.setRectangleRight(cast this, value);
	}
	extern inline public function setSize(size:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.setRectangleSize(cast this, size);
	}
	extern inline public function setTop(value:Single):Void {
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
	extern inline public function computeNodeRootLocalBounds(root:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Node.computeNodeRootLocalBoundsRectangle(cast this, root);
	}
	extern inline public function defaultComputeLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Node.defaultComputeLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeParticleEmitter2dLocalBounds(source:flight._cpp.ParticleEmitter2D):Void {
		flight._cpp._fn.Particleemitter.computeParticleEmitter2dLocalBoundsRectangle(cast this, source);
	}
	extern inline public function setParticleEmitter2dLocalBounds(target:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Particleemitter.setParticleEmitter2dLocalBoundsRectangle(target, cast this);
	}
	extern inline public function computeQuadBatchLocalBounds(source:flight._cpp.QuadBatch):Void {
		flight._cpp._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(cast this, source);
	}
	extern inline public function setQuadBatchLocalBounds(target:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, cast this);
	}
	extern inline public function computeHtmlViewLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeSpriteLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Scene2D.computeSpriteLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeShapeLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Shape.computeShapeLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeShapeBounds(source:cpp.Star<cpp.Void>, mode:Int):Bool {
		return flight._cpp._fn.Shape.computeShapeBoundsRectangle(cast this, source, mode);
	}
	extern inline public function computeNativeTextLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Text.computeNativeTextLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeRichTextLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Text.computeRichTextLocalBoundsRectangle(cast this, source);
	}
	extern inline public function computeTextLabelLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Text.computeTextLabelLocalBoundsRectangle(cast this, source);
	}
	extern inline public function addTextureAtlasRegion(target:flight._cpp.TextureAtlas, pivot:flight._cpp.Vector2, name:cpp.ConstCharStar):Void {
		flight._cpp._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, cast this, pivot, name);
	}
	extern inline public function computeTilemapLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Tilemap.computeTilemapLocalBoundsRectangle(cast this, source);
	}
}
