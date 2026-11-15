package flight._cpp;

abstract Aabb(cpp.Star<cpp.Void>) {
	static inline public function create(minX:Single, minY:Single, minZ:Single, maxX:Single, maxY:Single, maxZ:Single):flight._cpp.Aabb {
		return flight._cpp._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function clone():flight._cpp.Aabb {
		return flight._cpp._fn.Geometry.cloneAabb(cast this);
	}
	inline public function containsPoint(point:flight._cpp.Vector3):Bool {
		return flight._cpp._fn.Geometry.containsAabbPoint(cast this, point);
	}
	inline public function copy(source:flight._cpp.Aabb):Void {
		flight._cpp._fn.Geometry.copyAabb(cast this, source);
	}
	inline public function expandByPoint(aabb:flight._cpp.Aabb, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.expandAabbByPoint(cast this, aabb, point);
	}
	inline public function expandBySphere(aabb:flight._cpp.Aabb, sphere:flight._cpp.BoundingSphere):Void {
		flight._cpp._fn.Geometry.expandAabbBySphere(cast this, aabb, sphere);
	}
	inline public function getCenter(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getAabbCenter(out, cast this);
	}
	inline public function getExtents(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getAabbExtents(out, cast this);
	}
	inline public function getSize(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getAabbSize(out, cast this);
	}
	inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnAabb(out, cast this, point);
	}
	inline public function intersect(a:flight._cpp.Aabb, b:flight._cpp.Aabb):Void {
		flight._cpp._fn.Geometry.intersectAabb(cast this, a, b);
	}
	inline public function isAabbIntersecting(b:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isAabbIntersectingAabb(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isAabbIntersectingSphere(cast this, sphere);
	}
	inline public function set(minX:Single, minY:Single, minZ:Single, maxX:Single, maxY:Single, maxZ:Single):Void {
		flight._cpp._fn.Geometry.setAabb(cast this, minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function setFromPoints(points:cpp.Star<cpp.Void>, pointsLen:Int):Void {
		flight._cpp._fn.Geometry.setAabbFromPoints(cast this, points, pointsLen);
	}
	inline public function transformByMatrix4(aabb:flight._cpp.Aabb, m:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.transformAabbByMatrix4(cast this, aabb, m);
	}
	inline public function union(a:flight._cpp.Aabb, b:flight._cpp.Aabb):Void {
		flight._cpp._fn.Geometry.unionAabb(cast this, a, b);
	}
	inline public function setBoundingSphereFrom(out:flight._cpp.BoundingSphere):Void {
		flight._cpp._fn.Geometry.setBoundingSphereFromAabb(out, cast this);
	}
	inline public function free():Void {
		flight._cpp._fn.Geometry.freeAabb(cast this);
	}
	inline public function computeParticleEmitter3dLocalBounds(source:cpp.Star<cpp.Void>):Void {
		flight._cpp._fn.Particleemitter.computeParticleEmitter3dLocalBoundsAabb(cast this, source);
	}
}
