package flight._js;

abstract Vector2(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	inline public function matrixTransformBounds(out:flight._js.Rectangle, matrix:flight._js.Matrix, b:flight._js.Vector2):Void {
		flight._js._fn.Geometry.matrixTransformBoundsVector2(out, matrix, cast this, b);
	}
	static inline public function create(x:Float, y:Float):flight._js.Vector2 {
		return flight._js._fn.Geometry.createVector2(x, y);
	}
	static inline public function createFromPolar(length:Float, angle:Float):flight._js.Vector2 {
		return flight._js._fn.Geometry.createVector2FromPolar(length, angle);
	}
	inline public function add(a:flight._js.Vector2, b:flight._js.Vector2):Void {
		flight._js._fn.Geometry.addVector2(cast this, a, b);
	}
	inline public function clamp(value:flight._js.Vector2, min:flight._js.Vector2, max:flight._js.Vector2):Void {
		flight._js._fn.Geometry.clampVector2(cast this, value, min, max);
	}
	inline public function clone():flight._js.Vector2 {
		return flight._js._fn.Geometry.cloneVector2(cast this);
	}
	inline public function copy(source:flight._js.Vector2):Void {
		flight._js._fn.Geometry.copyVector2(cast this, source);
	}
	inline public function cross(b:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.crossVector2(cast this, b);
	}
	inline public function divide(source:flight._js.Vector2, divisor:flight._js.Vector2):Void {
		flight._js._fn.Geometry.divideVector2(cast this, source, divisor);
	}
	inline public function equals(b:Null<flight._js.Vector2>):Bool {
		return flight._js._fn.Geometry.equalsVector2(cast this, b);
	}
	inline public function getAngle():Float {
		return flight._js._fn.Geometry.getVector2Angle(cast this);
	}
	inline public function getAngleBetween(b:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.getVector2AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.getVector2Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.getVector2DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.getVector2Dot(cast this, b);
	}
	inline public function getLength():Float {
		return flight._js._fn.Geometry.getVector2Length(cast this);
	}
	inline public function getLengthSquared():Float {
		return flight._js._fn.Geometry.getVector2LengthSquared(cast this);
	}
	inline public function interpolate(a:flight._js.Vector2, b:flight._js.Vector2, t:Float):Void {
		flight._js._fn.Geometry.interpolateVector2(cast this, a, b, t);
	}
	inline public function max(a:flight._js.Vector2, b:flight._js.Vector2):Void {
		flight._js._fn.Geometry.maxVector2(cast this, a, b);
	}
	inline public function min(a:flight._js.Vector2, b:flight._js.Vector2):Void {
		flight._js._fn.Geometry.minVector2(cast this, a, b);
	}
	inline public function multiply(a:flight._js.Vector2, b:flight._js.Vector2):Void {
		flight._js._fn.Geometry.multiplyVector2(cast this, a, b);
	}
	inline public function nearEquals(b:flight._js.Vector2, tolerance:Float):Bool {
		return flight._js._fn.Geometry.nearEqualsVector2(cast this, b, tolerance);
	}
	inline public function negate(source:flight._js.Vector2):Void {
		flight._js._fn.Geometry.negateVector2(cast this, source);
	}
	inline public function normalize(source:flight._js.Vector2):Float {
		return flight._js._fn.Geometry.normalizeVector2(cast this, source);
	}
	inline public function offset(source:flight._js.Vector2, dx:Float, dy:Float):Void {
		flight._js._fn.Geometry.offsetVector2(cast this, source, dx, dy);
	}
	inline public function reflect(incident:flight._js.Vector2, normal:flight._js.Vector2):Void {
		flight._js._fn.Geometry.reflectVector2(cast this, incident, normal);
	}
	inline public function rotate(source:flight._js.Vector2, angle:Float):Void {
		flight._js._fn.Geometry.rotateVector2(cast this, source, angle);
	}
	inline public function scale(source:flight._js.Vector2, scalar:Float):Void {
		flight._js._fn.Geometry.scaleVector2(cast this, source, scalar);
	}
	inline public function scaleToLength(source:flight._js.Vector2, length:Float):Void {
		flight._js._fn.Geometry.scaleVector2ToLength(cast this, source, length);
	}
	inline public function set(x:Float, y:Float):Void {
		flight._js._fn.Geometry.setVector2(cast this, x, y);
	}
	inline public function setFromFloat32Array(offset:Int, source:Dynamic):Void {
		flight._js._fn.Geometry.setVector2FromFloat32Array(cast this, offset, source);
	}
	inline public function setFromPolar(length:Float, angle:Float):Void {
		flight._js._fn.Geometry.setVector2FromPolar(cast this, length, angle);
	}
	inline public function setFromVector3(source:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setVector2FromVector3(cast this, source);
	}
	inline public function subtract(source:flight._js.Vector2, other:flight._js.Vector2):Void {
		flight._js._fn.Geometry.subtractVector2(cast this, source, other);
	}
	inline public function writeToFloat32Array(out:Dynamic, offset:Int):Void {
		flight._js._fn.Geometry.writeVector2ToFloat32Array(out, offset, cast this);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseVector2(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeVector2(cast this);
	}
	inline public function addTextureAtlasRegion(target:flight._js.TextureAtlas, b:flight._js.Vector2, pivot:Null<flight._js.Vector2>, name:Null<String>):Void {
		flight._js._fn.TextureAtlas.addTextureAtlasRegionVector2(target, cast this, b, pivot, name);
	}
}
