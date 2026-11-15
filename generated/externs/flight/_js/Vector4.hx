package flight._js;

@:jsRequire("flight")
private extern class Vector4_Ffi {
	@:native("flight_get_vector4_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_vector4_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vector4_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_vector4_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vector4_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_vector4_z") static function set_z(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_vector4_w") static function get_w(ptr:Dynamic):Float;
	@:native("flight_set_vector4_w") static function set_w(ptr:Dynamic, value:Float):Float;
}

abstract Vector4(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return Vector4_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Vector4_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Vector4_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Vector4_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return Vector4_Ffi.get_z(this);

	inline function set_z(value:Float):Float return Vector4_Ffi.set_z(this, value);
	public var w(get, set):Float;

	inline function get_w():Float return Vector4_Ffi.get_w(this);

	inline function set_w(value:Float):Float return Vector4_Ffi.set_w(this, value);

	inline public function copyMatrix4ColumnTo(column:Int, source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.copyMatrix4ColumnToVector4(cast this, column, source);
	}
	inline public function copyMatrix4RowTo(row:Int, source:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.copyMatrix4RowToVector4(cast this, row, source);
	}
	static inline public function create(x:Float, y:Float, z:Float, w:Float):flight._js.Vector4 {
		return flight._js._fn.Geometry.createVector4(x, y, z, w);
	}
	inline public function add(a:flight._js.Vector4, b:flight._js.Vector4):Void {
		flight._js._fn.Geometry.addVector4(cast this, a, b);
	}
	inline public function clamp(value:flight._js.Vector4, min:flight._js.Vector4, max:flight._js.Vector4):Void {
		flight._js._fn.Geometry.clampVector4(cast this, value, min, max);
	}
	inline public function clone():flight._js.Vector4 {
		return flight._js._fn.Geometry.cloneVector4(cast this);
	}
	inline public function copy(source:flight._js.Vector4):Void {
		flight._js._fn.Geometry.copyVector4(cast this, source);
	}
	inline public function divide(source:flight._js.Vector4, divisor:flight._js.Vector4):Void {
		flight._js._fn.Geometry.divideVector4(cast this, source, divisor);
	}
	inline public function equals(b:flight._js.Vector4):Bool {
		return flight._js._fn.Geometry.equalsVector4(cast this, b);
	}
	inline public function getAngleBetween(b:flight._js.Vector4):Float {
		return flight._js._fn.Geometry.getVector4AngleBetween(cast this, b);
	}
	inline public function getDistance(b:flight._js.Vector4):Float {
		return flight._js._fn.Geometry.getVector4Distance(cast this, b);
	}
	inline public function getDistanceSquared(b:flight._js.Vector4):Float {
		return flight._js._fn.Geometry.getVector4DistanceSquared(cast this, b);
	}
	inline public function getDot(b:flight._js.Vector4):Float {
		return flight._js._fn.Geometry.getVector4Dot(cast this, b);
	}
	inline public function getLength():Float {
		return flight._js._fn.Geometry.getVector4Length(cast this);
	}
	inline public function getLengthSquared():Float {
		return flight._js._fn.Geometry.getVector4LengthSquared(cast this);
	}
	inline public function interpolate(a:flight._js.Vector4, b:flight._js.Vector4, t:Float):Void {
		flight._js._fn.Geometry.interpolateVector4(cast this, a, b, t);
	}
	inline public function max(a:flight._js.Vector4, b:flight._js.Vector4):Void {
		flight._js._fn.Geometry.maxVector4(cast this, a, b);
	}
	inline public function min(a:flight._js.Vector4, b:flight._js.Vector4):Void {
		flight._js._fn.Geometry.minVector4(cast this, a, b);
	}
	inline public function multiply(a:flight._js.Vector4, b:flight._js.Vector4):Void {
		flight._js._fn.Geometry.multiplyVector4(cast this, a, b);
	}
	inline public function nearEquals(b:flight._js.Vector4, tolerance:Float):Bool {
		return flight._js._fn.Geometry.nearEqualsVector4(cast this, b, tolerance);
	}
	inline public function negate(source:flight._js.Vector4):Void {
		flight._js._fn.Geometry.negateVector4(cast this, source);
	}
	inline public function normalize(source:flight._js.Vector4):Float {
		return flight._js._fn.Geometry.normalizeVector4(cast this, source);
	}
	inline public function offset(source:flight._js.Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void {
		flight._js._fn.Geometry.offsetVector4(cast this, source, dx, dy, dz, dw);
	}
	inline public function project(out:flight._js.Vector3):Void {
		flight._js._fn.Geometry.projectVector4(out, cast this);
	}
	inline public function reflect(incident:flight._js.Vector4, normal:flight._js.Vector4):Void {
		flight._js._fn.Geometry.reflectVector4(cast this, incident, normal);
	}
	inline public function scale(source:flight._js.Vector4, scalar:Float):Void {
		flight._js._fn.Geometry.scaleVector4(cast this, source, scalar);
	}
	inline public function set(x:Float, y:Float, z:Float, w:Float):Void {
		flight._js._fn.Geometry.setVector4(cast this, x, y, z, w);
	}
	inline public function setFromFloat32Array(offset:Int, source:Dynamic, sourceLen:Int):Void {
		flight._js._fn.Geometry.setVector4FromFloat32Array(cast this, offset, source, sourceLen);
	}
	inline public function setFromVector3(source:flight._js.Vector3, w:Float):Void {
		flight._js._fn.Geometry.setVector4FromVector3(cast this, source, w);
	}
	inline public function subtract(source:flight._js.Vector4, other:flight._js.Vector4):Void {
		flight._js._fn.Geometry.subtractVector4(cast this, source, other);
	}
	inline public function writeToFloat32Array(out:Dynamic, outLen:Int, offset:Int):Void {
		flight._js._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, cast this);
	}
	inline public function release():Void {
		flight._js._fn.Geometry.releaseVector4(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeVector4(cast this);
	}
}
