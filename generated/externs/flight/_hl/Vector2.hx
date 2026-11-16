package flight._hl;

abstract Vector2(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }

	inline public function matrixTransformBounds(out:flight._hl.Rectangle, matrix:flight._hl.Matrix, b:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.matrixTransformBoundsVector2(out, matrix, cast this, b);
	}
	static inline public function create(x:Single, y:Single):flight._hl.Vector2 {
		return flight._hl._fn.Geometry.createVector2(x, y);
	}
	static inline public function createFromPolar(length:Single, angle:Single):flight._hl.Vector2 {
		return flight._hl._fn.Geometry.createVector2FromPolar(length, angle);
	}
	inline public function add(a:flight._hl.Vector2, b:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.addVector2(cast this, a, b);
	}
	inline public function clamp(value:flight._hl.Vector2, min:flight._hl.Vector2, max:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.clampVector2(cast this, value, min, max);
	}
	inline public function clone():flight._hl.Vector2 {
		return flight._hl._fn.Geometry.cloneVector2(cast this);
	}
	inline public function copy(source:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.copyVector2(cast this, source);
	}
	inline public function cross(b:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.crossVector2(cast this, b);
	}
	inline public function divide(source:flight._hl.Vector2, divisor:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.divideVector2(cast this, source, divisor);
	}
	inline public function equals(b:flight._hl.Vector2):Bool {
		return flight._hl._fn.Geometry.equalsVector2(cast this, b);
	}
	inline public function getAngle():Single {
		return flight._hl._fn.Geometry.getVector2Angle(cast this);
	}
	inline public function getAngleBetween(b:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.getVector2AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.getVector2Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.getVector2DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.getVector2Dot(cast this, b);
	}
	inline public function getLength():Single {
		return flight._hl._fn.Geometry.getVector2Length(cast this);
	}
	inline public function getLengthSquared():Single {
		return flight._hl._fn.Geometry.getVector2LengthSquared(cast this);
	}
	inline public function interpolate(a:flight._hl.Vector2, b:flight._hl.Vector2, t:Single):Void {
		flight._hl._fn.Geometry.interpolateVector2(cast this, a, b, t);
	}
	inline public function max(a:flight._hl.Vector2, b:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.maxVector2(cast this, a, b);
	}
	inline public function min(a:flight._hl.Vector2, b:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.minVector2(cast this, a, b);
	}
	inline public function multiply(a:flight._hl.Vector2, b:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.multiplyVector2(cast this, a, b);
	}
	inline public function nearEquals(b:flight._hl.Vector2, tolerance:Single):Bool {
		return flight._hl._fn.Geometry.nearEqualsVector2(cast this, b, tolerance);
	}
	inline public function negate(source:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.negateVector2(cast this, source);
	}
	inline public function normalize(source:flight._hl.Vector2):Single {
		return flight._hl._fn.Geometry.normalizeVector2(cast this, source);
	}
	inline public function offset(source:flight._hl.Vector2, dx:Single, dy:Single):Void {
		flight._hl._fn.Geometry.offsetVector2(cast this, source, dx, dy);
	}
	inline public function reflect(incident:flight._hl.Vector2, normal:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.reflectVector2(cast this, incident, normal);
	}
	inline public function rotate(source:flight._hl.Vector2, angle:Single):Void {
		flight._hl._fn.Geometry.rotateVector2(cast this, source, angle);
	}
	inline public function scale(source:flight._hl.Vector2, scalar:Single):Void {
		flight._hl._fn.Geometry.scaleVector2(cast this, source, scalar);
	}
	inline public function scaleToLength(source:flight._hl.Vector2, length:Single):Void {
		flight._hl._fn.Geometry.scaleVector2ToLength(cast this, source, length);
	}
	inline public function set(x:Single, y:Single):Void {
		flight._hl._fn.Geometry.setVector2(cast this, x, y);
	}
	inline public function setFromFloat32Array(offset:Int, source:hl.Bytes, sourceLen:Int):Void {
		flight._hl._fn.Geometry.setVector2FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromPolar(length:Single, angle:Single):Void {
		flight._hl._fn.Geometry.setVector2FromPolar(cast this, length, angle);
	}
	inline public function setFromVector3(source:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setVector2FromVector3(cast this, source);
	}
	inline public function subtract(source:flight._hl.Vector2, other:flight._hl.Vector2):Void {
		flight._hl._fn.Geometry.subtractVector2(cast this, source, other);
	}
	inline public function writeToFloat32Array(out:hl.Bytes, outLen:Int, offset:Int):Void {
		flight._hl._fn.Geometry.writeVector2ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._hl._fn.Geometry.releaseVector2(cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeVector2(cast this);
	}
	inline public function addTextureAtlasRegion(target:flight._hl.TextureAtlas, b:flight._hl.Vector2, pivot:flight._hl.Vector2, name:hl.Bytes):Void {
		flight._hl._fn.TextureAtlas.addTextureAtlasRegionVector2(target, cast this, b, pivot, name);
	}
}
