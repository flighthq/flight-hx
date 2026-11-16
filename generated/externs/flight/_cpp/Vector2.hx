package flight._cpp;

private extern class Vector2_Ffi {
	@:native("flight_get_vector2_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vector2_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_vector2_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_vector2_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Vector2(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return Vector2_Ffi.get_x(this);

	inline function set_x(value:Single):Single { Vector2_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return Vector2_Ffi.get_y(this);

	inline function set_y(value:Single):Single { Vector2_Ffi.set_y(this, value); return value; }

	extern inline public function matrixTransformBounds(out:flight._cpp.Rectangle, matrix:flight._cpp.Matrix, b:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.matrixTransformBoundsVector2(out, matrix, cast this, b);
	}
	static extern inline public function create(x:Single, y:Single):flight._cpp.Vector2 {
		return flight._cpp._fn.Geometry.createVector2(x, y);
	}
	static extern inline public function createFromPolar(length:Single, angle:Single):flight._cpp.Vector2 {
		return flight._cpp._fn.Geometry.createVector2FromPolar(length, angle);
	}
	extern inline public function add(a:flight._cpp.Vector2, b:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.addVector2(cast this, a, b);
	}
	extern inline public function clamp(value:flight._cpp.Vector2, min:flight._cpp.Vector2, max:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.clampVector2(cast this, value, min, max);
	}
	extern inline public function clone():flight._cpp.Vector2 {
		return flight._cpp._fn.Geometry.cloneVector2(cast this);
	}
	extern inline public function copy(source:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.copyVector2(cast this, source);
	}
	extern inline public function cross(b:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.crossVector2(cast this, b);
	}
	extern inline public function divide(source:flight._cpp.Vector2, divisor:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.divideVector2(cast this, source, divisor);
	}
	extern inline public function equals(b:flight._cpp.Vector2):Bool {
		return flight._cpp._fn.Geometry.equalsVector2(cast this, b);
	}
	extern inline public function getAngle():Single {
		return flight._cpp._fn.Geometry.getVector2Angle(cast this);
	}
	extern inline public function getAngleBetween(b:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.getVector2AngleBetween(cast this, b);
	}
	extern inline public function getDistance(b:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.getVector2Distance(cast this, b);
	}
	extern inline public function getDistanceSquared(b:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.getVector2DistanceSquared(cast this, b);
	}
	extern inline public function getDot(b:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.getVector2Dot(cast this, b);
	}
	extern inline public function getLength():Single {
		return flight._cpp._fn.Geometry.getVector2Length(cast this);
	}
	extern inline public function getLengthSquared():Single {
		return flight._cpp._fn.Geometry.getVector2LengthSquared(cast this);
	}
	extern inline public function interpolate(a:flight._cpp.Vector2, b:flight._cpp.Vector2, t:Single):Void {
		flight._cpp._fn.Geometry.interpolateVector2(cast this, a, b, t);
	}
	extern inline public function max(a:flight._cpp.Vector2, b:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.maxVector2(cast this, a, b);
	}
	extern inline public function min(a:flight._cpp.Vector2, b:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.minVector2(cast this, a, b);
	}
	extern inline public function multiply(a:flight._cpp.Vector2, b:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.multiplyVector2(cast this, a, b);
	}
	extern inline public function nearEquals(b:flight._cpp.Vector2, tolerance:Single):Bool {
		return flight._cpp._fn.Geometry.nearEqualsVector2(cast this, b, tolerance);
	}
	extern inline public function negate(source:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.negateVector2(cast this, source);
	}
	extern inline public function normalize(source:flight._cpp.Vector2):Single {
		return flight._cpp._fn.Geometry.normalizeVector2(cast this, source);
	}
	extern inline public function offset(source:flight._cpp.Vector2, dx:Single, dy:Single):Void {
		flight._cpp._fn.Geometry.offsetVector2(cast this, source, dx, dy);
	}
	extern inline public function reflect(incident:flight._cpp.Vector2, normal:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.reflectVector2(cast this, incident, normal);
	}
	extern inline public function rotate(source:flight._cpp.Vector2, angle:Single):Void {
		flight._cpp._fn.Geometry.rotateVector2(cast this, source, angle);
	}
	extern inline public function scale(source:flight._cpp.Vector2, scalar:Single):Void {
		flight._cpp._fn.Geometry.scaleVector2(cast this, source, scalar);
	}
	extern inline public function scaleToLength(source:flight._cpp.Vector2, length:Single):Void {
		flight._cpp._fn.Geometry.scaleVector2ToLength(cast this, source, length);
	}
	extern inline public function set(x:Single, y:Single):Void {
		flight._cpp._fn.Geometry.setVector2(cast this, x, y);
	}
	extern inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setVector2FromFloat32Array(cast this, offset, source, sourceLen);
	}
	extern inline public function setFromPolar(length:Single, angle:Single):Void {
		flight._cpp._fn.Geometry.setVector2FromPolar(cast this, length, angle);
	}
	extern inline public function setFromVector3(source:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setVector2FromVector3(cast this, source);
	}
	extern inline public function subtract(source:flight._cpp.Vector2, other:flight._cpp.Vector2):Void {
		flight._cpp._fn.Geometry.subtractVector2(cast this, source, other);
	}
	extern inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeVector2ToFloat32Array(out, outLen, offset, cast this);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseVector2(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeVector2(cast this);
	}
	extern inline public function addTextureAtlasRegion(target:flight._cpp.TextureAtlas, b:flight._cpp.Vector2, pivot:flight._cpp.Vector2, name:cpp.ConstCharStar):Void {
		flight._cpp._fn.TextureAtlas.addTextureAtlasRegionVector2(target, cast this, b, pivot, name);
	}
}
