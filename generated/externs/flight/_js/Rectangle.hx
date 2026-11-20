package flight._js;

abstract Rectangle(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	inline public function computeBitmapTextLocalBounds(source:flight._js.BitmapText):Void {
		flight._js._fn.BitmapText.computeBitmapTextLocalBoundsRectangle(cast this, source);
	}
	inline public function createClipRegionFrom():Dynamic {
		return flight._js._fn.Clip.createClipRegionFromRectangle(cast this);
	}
	inline public function clipRegionContains(clip:Dynamic):Bool {
		return flight._js._fn.Clip.clipRegionContainsRectangle(clip, cast this);
	}
	inline public function clipRegionIntersects(clip:Dynamic):Bool {
		return flight._js._fn.Clip.clipRegionIntersectsRectangle(clip, cast this);
	}
	inline public function setClipRegionTo(out:Dynamic):Void {
		flight._js._fn.Clip.setClipRegionToRectangle(out, cast this);
	}
	inline public function createClipRegionFromRounded(radius:Float, tolerance:Null<Float>):Dynamic {
		return flight._js._fn.Clip.createClipRegionFromRoundedRectangle(cast this, radius, tolerance);
	}
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
	inline public function equals(b:Null<flight._js.Rectangle>):Bool {
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
	inline public function getNode2dOverlap(source:Dynamic, other:Dynamic):Void {
		flight._js._fn.Interaction.getNode2dOverlapRectangle(cast this, source, other);
	}
	inline public function computeNodeBounds(source:Dynamic, targetCoordinateSpace:Null<Dynamic>):Void {
		flight._js._fn.Node.computeNodeBoundsRectangle(cast this, source, targetCoordinateSpace);
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
		flight._js._fn.QuadBatch.computeQuadBatchLocalBoundsRectangle(cast this, source);
	}
	inline public function setQuadBatchLocalBounds(target:Dynamic):Void {
		flight._js._fn.QuadBatch.setQuadBatchLocalBoundsRectangle(target, cast this);
	}
	inline public function computeHtmlViewLocalBounds(source:Dynamic):Void {
		flight._js._fn.Scene2D.computeHtmlViewLocalBoundsRectangle(cast this, source);
	}
	inline public function computeSpriteLocalBounds(source:Dynamic):Void {
		flight._js._fn.Scene2D.computeSpriteLocalBoundsRectangle(cast this, source);
	}
	inline public function computeShapeLocalBounds(source:Dynamic):Void {
		flight._js._fn.Shape.computeShapeLocalBoundsRectangle(cast this, source);
	}
	inline public function computeShapeBounds(source:Dynamic, mode:Null<Dynamic>):Bool {
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
	inline public function computeTextBounds(spec:flight._js.TextBoundsSpec, layout:flight._js.TextLayoutResult):Void {
		flight._js._fn.Textlayout.computeTextBoundsRectangle(cast this, spec, layout);
	}
	inline public function addTextureAtlasRegion(target:flight._js.TextureAtlas, pivot:Null<flight._js.Vector2>, name:Null<String>):Void {
		flight._js._fn.TextureAtlas.addTextureAtlasRegionRectangle(target, cast this, pivot, name);
	}
	inline public function computeTilemapLocalBounds(source:Dynamic):Void {
		flight._js._fn.Tilemap.computeTilemapLocalBoundsRectangle(cast this, source);
	}
}
