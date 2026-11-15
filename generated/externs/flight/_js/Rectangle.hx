package flight._js;

@:jsRequire("flight")
private extern class Rectangle_Ffi {
	@:native("flight_get_rectangle_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_rectangle_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rectangle_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_rectangle_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rectangle_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_rectangle_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rectangle_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_rectangle_height") static function set_height(ptr:Dynamic, value:Float):Float;
}

abstract Rectangle(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return Rectangle_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Rectangle_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Rectangle_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Rectangle_Ffi.set_y(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return Rectangle_Ffi.get_width(this);

	inline function set_width(value:Float):Float return Rectangle_Ffi.set_width(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return Rectangle_Ffi.get_height(this);

	inline function set_height(value:Float):Float return Rectangle_Ffi.set_height(this, value);

	inline public function matrixTransform(matrix:flight._js.Matrix, source:flight._js.Rectangle):Void {
		flight._js._fn.Geometry.matrixTransformRectangle(cast this, matrix, source);
	}
	static inline public function create(x:Float, y:Float, width:Float, height:Float):flight._js.Rectangle {
		return flight._js._fn.Geometry.createRectangle(x, y, width, height);
	}
	inline public function clone():flight._js.Rectangle {
		return flight._js._fn.Geometry.cloneRectangle(cast this);
	}
	inline public function computeIntersection(a:flight._js.Rectangle, b:flight._js.Rectangle):Void {
		flight._js._fn.Geometry.computeRectangleIntersection(cast this, a, b);
	}
	inline public function containsPoint(vector:flight._js.Vector2):Bool {
		return flight._js._fn.Geometry.containsRectanglePoint(cast this, vector);
	}
	inline public function containsPointXy(x:Float, y:Float):Bool {
		return flight._js._fn.Geometry.containsRectanglePointXy(cast this, x, y);
	}
	inline public function copy(source:flight._js.Rectangle):Void {
		flight._js._fn.Geometry.copyRectangle(cast this, source);
	}
	inline public function encloses(other:flight._js.Rectangle):Bool {
		return flight._js._fn.Geometry.enclosesRectangle(cast this, other);
	}
	inline public function equals(b:flight._js.Rectangle):Bool {
		return flight._js._fn.Geometry.equalsRectangle(cast this, b);
	}
	inline public function expandToPoint(sourceRect:flight._js.Rectangle, sourceVec2:flight._js.Vector2):Void {
		flight._js._fn.Geometry.expandRectangleToPoint(cast this, sourceRect, sourceVec2);
	}
	inline public function getBottom():Float {
		return flight._js._fn.Geometry.getRectangleBottom(cast this);
	}
	inline public function getBottomRight(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.getRectangleBottomRight(out, cast this);
	}
	inline public function getLeft():Float {
		return flight._js._fn.Geometry.getRectangleLeft(cast this);
	}
	inline public function getMaxX():Float {
		return flight._js._fn.Geometry.getRectangleMaxX(cast this);
	}
	inline public function getMaxY():Float {
		return flight._js._fn.Geometry.getRectangleMaxY(cast this);
	}
	inline public function getMinX():Float {
		return flight._js._fn.Geometry.getRectangleMinX(cast this);
	}
	inline public function getMinY():Float {
		return flight._js._fn.Geometry.getRectangleMinY(cast this);
	}
	inline public function getNormalizedBottomRight(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.getRectangleNormalizedBottomRight(out, cast this);
	}
	inline public function getNormalizedTopLeft(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.getRectangleNormalizedTopLeft(out, cast this);
	}
	inline public function getRight():Float {
		return flight._js._fn.Geometry.getRectangleRight(cast this);
	}
	inline public function getSize(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.getRectangleSize(out, cast this);
	}
	inline public function getTop():Float {
		return flight._js._fn.Geometry.getRectangleTop(cast this);
	}
	inline public function getTopLeft(out:flight._js.Vector2):Void {
		flight._js._fn.Geometry.getRectangleTopLeft(out, cast this);
	}
	inline public function inflate(source:flight._js.Rectangle, dx:Float, dy:Float):Void {
		flight._js._fn.Geometry.inflateRectangle(cast this, source, dx, dy);
	}
	inline public function intersects(b:flight._js.Rectangle):Bool {
		return flight._js._fn.Geometry.intersectsRectangle(cast this, b);
	}
	inline public function isEmpty():Bool {
		return flight._js._fn.Geometry.isEmptyRectangle(cast this);
	}
	inline public function isFlippedX():Bool {
		return flight._js._fn.Geometry.isFlippedXRectangle(cast this);
	}
	inline public function isFlippedY():Bool {
		return flight._js._fn.Geometry.isFlippedYRectangle(cast this);
	}
	inline public function merge(source:flight._js.Rectangle, other:flight._js.Rectangle):Void {
		flight._js._fn.Geometry.mergeRectangle(cast this, source, other);
	}
	inline public function normalize(source:flight._js.Rectangle):Void {
		flight._js._fn.Geometry.normalizeRectangle(cast this, source);
	}
	inline public function offset(source:flight._js.Rectangle, dx:Float, dy:Float):Void {
		flight._js._fn.Geometry.offsetRectangle(cast this, source, dx, dy);
	}
	inline public function offsetByPoint(source:flight._js.Rectangle, point:flight._js.Vector2):Void {
		flight._js._fn.Geometry.offsetRectangleByPoint(cast this, source, point);
	}
	inline public function setEmpty():Void {
		flight._js._fn.Geometry.setEmptyRectangle(cast this);
	}
	inline public function set(x:Float, y:Float, width:Float, height:Float):Void {
		flight._js._fn.Geometry.setRectangle(cast this, x, y, width, height);
	}
	inline public function setBottom(value:Float):Void {
		flight._js._fn.Geometry.setRectangleBottom(cast this, value);
	}
	inline public function setBottomRight(point:flight._js.Vector2):Void {
		flight._js._fn.Geometry.setRectangleBottomRight(cast this, point);
	}
	inline public function setLeft(value:Float):Void {
		flight._js._fn.Geometry.setRectangleLeft(cast this, value);
	}
	inline public function setRight(value:Float):Void {
		flight._js._fn.Geometry.setRectangleRight(cast this, value);
	}
	inline public function setSize(size:flight._js.Vector2):Void {
		flight._js._fn.Geometry.setRectangleSize(cast this, size);
	}
	inline public function setTop(value:Float):Void {
		flight._js._fn.Geometry.setRectangleTop(cast this, value);
	}
	inline public function setTopLeft(point:flight._js.Vector2):Void {
		flight._js._fn.Geometry.setRectangleTopLeft(cast this, point);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseRectangle(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeRectangle(cast this);
	}
	inline public function computeNodeRootLocalBounds(root:Dynamic):Void {
		flight._js._fn.Node.computeNodeRootLocalBoundsRectangle(cast this, root);
	}
	inline public function defaultComputeLocalBounds(source:Dynamic):Void {
		flight._js._fn.Node.defaultComputeLocalBoundsRectangle(cast this, source);
	}
	inline public function computeParticleEmitter2dLocalBounds(source:flight._js.ParticleEmitter2D):Void {
		flight._js._fn.Particleemitter.computeParticleEmitter2dLocalBoundsRectangle(cast this, source);
	}
	inline public function setParticleEmitter2dLocalBounds(target:Dynamic):Void {
		flight._js._fn.Particleemitter.setParticleEmitter2dLocalBoundsRectangle(target, cast this);
	}
	inline public function computeQuadBatchLocalBounds(source:flight._js.QuadBatch):Void {
		flight._js._fn.Quadbatch.computeQuadBatchLocalBoundsRectangle(cast this, source);
	}
	inline public function setQuadBatchLocalBounds(target:Dynamic):Void {
		flight._js._fn.Quadbatch.setQuadBatchLocalBoundsRectangle(target, cast this);
	}
	inline public function computeHtmlViewLocalBounds(source:Dynamic):Void {
		flight._js._fn.Scene2d.computeHtmlViewLocalBoundsRectangle(cast this, source);
	}
	inline public function computeSpriteLocalBounds(source:Dynamic):Void {
		flight._js._fn.Scene2d.computeSpriteLocalBoundsRectangle(cast this, source);
	}
	inline public function computeShapeLocalBounds(source:Dynamic):Void {
		flight._js._fn.Shape.computeShapeLocalBoundsRectangle(cast this, source);
	}
	inline public function computeShapeBounds(source:Dynamic, mode:Int):Bool {
		return flight._js._fn.Shape.computeShapeBoundsRectangle(cast this, source, mode);
	}
	inline public function computeNativeTextLocalBounds(source:Dynamic):Void {
		flight._js._fn.Text.computeNativeTextLocalBoundsRectangle(cast this, source);
	}
	inline public function computeRichTextLocalBounds(source:Dynamic):Void {
		flight._js._fn.Text.computeRichTextLocalBoundsRectangle(cast this, source);
	}
	inline public function computeTextLabelLocalBounds(source:Dynamic):Void {
		flight._js._fn.Text.computeTextLabelLocalBoundsRectangle(cast this, source);
	}
	inline public function addTextureAtlasRegion(target:flight._js.TextureAtlas, pivot:flight._js.Vector2, name:String):Void {
		flight._js._fn.Textureatlas.addTextureAtlasRegionRectangle(target, cast this, pivot, name);
	}
	inline public function computeTilemapLocalBounds(source:Dynamic):Void {
		flight._js._fn.Tilemap.computeTilemapLocalBoundsRectangle(cast this, source);
	}
}
