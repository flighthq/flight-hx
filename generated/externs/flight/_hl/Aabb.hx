package flight._hl;

abstract Aabb(hl.Bytes) {
	static inline public function create(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):flight._hl.Aabb {
		return flight._hl._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function clone():flight._hl.Aabb {
		return flight._hl._fn.Geometry.cloneAabb(cast this);
	}
	inline public function containsPoint(point:flight._hl.Vector3):Bool {
		return flight._hl._fn.Geometry.containsAabbPoint(cast this, point);
	}
	inline public function copy(source:flight._hl.Aabb):Void {
		flight._hl._fn.Geometry.copyAabb(cast this, source);
	}
	inline public function expandByPoint(aabb:flight._hl.Aabb, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.expandAabbByPoint(cast this, aabb, point);
	}
	inline public function expandBySphere(aabb:flight._hl.Aabb, sphere:flight._hl.BoundingSphere):Void {
		flight._hl._fn.Geometry.expandAabbBySphere(cast this, aabb, sphere);
	}
	inline public function getCenter(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getAabbCenter(out, cast this);
	}
	inline public function getExtents(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getAabbExtents(out, cast this);
	}
	inline public function getSize(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getAabbSize(out, cast this);
	}
	inline public function getClosestPointOn(out:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getClosestPointOnAabb(out, cast this, point);
	}
	inline public function intersect(a:flight._hl.Aabb, b:flight._hl.Aabb):Void {
		flight._hl._fn.Geometry.intersectAabb(cast this, a, b);
	}
	inline public function isAabbIntersecting(b:flight._hl.Aabb):Bool {
		return flight._hl._fn.Geometry.isAabbIntersectingAabb(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._hl.BoundingSphere):Bool {
		return flight._hl._fn.Geometry.isAabbIntersectingSphere(cast this, sphere);
	}
	inline public function set(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void {
		flight._hl._fn.Geometry.setAabb(cast this, minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function setFromPoints(points:hl.Bytes, pointsLen:Int):Void {
		flight._hl._fn.Geometry.setAabbFromPoints(cast this, points, pointsLen);
	}
	inline public function transformByMatrix4(aabb:flight._hl.Aabb, m:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.transformAabbByMatrix4(cast this, aabb, m);
	}
	inline public function union(a:flight._hl.Aabb, b:flight._hl.Aabb):Void {
		flight._hl._fn.Geometry.unionAabb(cast this, a, b);
	}
	inline public function setBoundingSphereFrom(out:flight._hl.BoundingSphere):Void {
		flight._hl._fn.Geometry.setBoundingSphereFromAabb(out, cast this);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeAabb(cast this);
	}
}
