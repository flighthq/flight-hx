package flight._cpp;

private extern class Vector4_Ffi {
	@:native("flight_get_vector4_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector4_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_vector4_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector4_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_vector4_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector4_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_vector4_w") static function get_w(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_vector4_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Vector4(cpp.Star<cpp.Void>) {
	public var x(get, set):Float;

	inline function get_x():Float return Vector4_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Vector4_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Vector4_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Vector4_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return Vector4_Ffi.get_z(this);

	inline function set_z(value:Float):Float { Vector4_Ffi.set_z(this, value); return value; }
	public var w(get, set):Float;

	inline function get_w():Float return Vector4_Ffi.get_w(this);

	inline function set_w(value:Float):Float { Vector4_Ffi.set_w(this, value); return value; }

	extern inline public function copyMatrix4ColumnTo(column:Int, source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.copyMatrix4ColumnToVector4(cast this, column, source);
	}
	extern inline public function copyMatrix4RowTo(row:Int, source:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.copyMatrix4RowToVector4(cast this, row, source);
	}
	static extern inline public function create(x:Float, y:Float, z:Float, w:Float):flight._cpp.Vector4 {
		return flight._cpp._fn.Geometry.createVector4(x, y, z, w);
	}
	extern inline public function add(a:flight._cpp.Vector4, b:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.addVector4(cast this, a, b);
	}
	extern inline public function clamp(value:flight._cpp.Vector4, min:flight._cpp.Vector4, max:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.clampVector4(cast this, value, min, max);
	}
	extern inline public function clone():flight._cpp.Vector4 {
		return flight._cpp._fn.Geometry.cloneVector4(cast this);
	}
	extern inline public function copy(source:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.copyVector4(cast this, source);
	}
	extern inline public function divide(source:flight._cpp.Vector4, divisor:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.divideVector4(cast this, source, divisor);
	}
	extern inline public function equals(b:flight._cpp.Vector4):Bool {
		return flight._cpp._fn.Geometry.equalsVector4(cast this, b);
	}
	extern inline public function getAngleBetween(b:flight._cpp.Vector4):Float {
		return flight._cpp._fn.Geometry.getVector4AngleBetween(cast this, b);
	}
	extern inline public function getDistance(b:flight._cpp.Vector4):Float {
		return flight._cpp._fn.Geometry.getVector4Distance(cast this, b);
	}
	extern inline public function getDistanceSquared(b:flight._cpp.Vector4):Float {
		return flight._cpp._fn.Geometry.getVector4DistanceSquared(cast this, b);
	}
	extern inline public function getDot(b:flight._cpp.Vector4):Float {
		return flight._cpp._fn.Geometry.getVector4Dot(cast this, b);
	}
	extern inline public function getLength():Float {
		return flight._cpp._fn.Geometry.getVector4Length(cast this);
	}
	extern inline public function getLengthSquared():Float {
		return flight._cpp._fn.Geometry.getVector4LengthSquared(cast this);
	}
	extern inline public function interpolate(a:flight._cpp.Vector4, b:flight._cpp.Vector4, t:Float):Void {
		flight._cpp._fn.Geometry.interpolateVector4(cast this, a, b, t);
	}
	extern inline public function max(a:flight._cpp.Vector4, b:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.maxVector4(cast this, a, b);
	}
	extern inline public function min(a:flight._cpp.Vector4, b:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.minVector4(cast this, a, b);
	}
	extern inline public function multiply(a:flight._cpp.Vector4, b:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.multiplyVector4(cast this, a, b);
	}
	extern inline public function nearEquals(b:flight._cpp.Vector4, tolerance:Float):Bool {
		return flight._cpp._fn.Geometry.nearEqualsVector4(cast this, b, tolerance);
	}
	extern inline public function negate(source:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.negateVector4(cast this, source);
	}
	extern inline public function normalize(source:flight._cpp.Vector4):Float {
		return flight._cpp._fn.Geometry.normalizeVector4(cast this, source);
	}
	extern inline public function offset(source:flight._cpp.Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void {
		flight._cpp._fn.Geometry.offsetVector4(cast this, source, dx, dy, dz, dw);
	}
	extern inline public function project(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.projectVector4(out, cast this);
	}
	extern inline public function reflect(incident:flight._cpp.Vector4, normal:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.reflectVector4(cast this, incident, normal);
	}
	extern inline public function scale(source:flight._cpp.Vector4, scalar:Float):Void {
		flight._cpp._fn.Geometry.scaleVector4(cast this, source, scalar);
	}
	extern inline public function set(x:Float, y:Float, z:Float, w:Float):Void {
		flight._cpp._fn.Geometry.setVector4(cast this, x, y, z, w);
	}
	extern inline public function setFromFloat32Array(offset:Int, source:cpp.Star<cpp.Void>, sourceLen:Int):Void {
		flight._cpp._fn.Geometry.setVector4FromFloat32Array(cast this, offset, source, sourceLen);
	}
	extern inline public function setFromVector3(source:flight._cpp.Vector3, w:Float):Void {
		flight._cpp._fn.Geometry.setVector4FromVector3(cast this, source, w);
	}
	extern inline public function subtract(source:flight._cpp.Vector4, other:flight._cpp.Vector4):Void {
		flight._cpp._fn.Geometry.subtractVector4(cast this, source, other);
	}
	extern inline public function writeToFloat32Array(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int):Void {
		flight._cpp._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, cast this);
	}
	extern inline public function release():Void {
		flight._cpp._fn.Geometry.releaseVector4(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeVector4(cast this);
	}
}
