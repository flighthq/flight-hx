package flight._js;

abstract Aabb(Dynamic) {
	static inline public function create(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):flight._js.Aabb {
		return flight._js._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function clone():flight._js.Aabb {
		return flight._js._fn.Geometry.cloneAabb(cast this);
	}
	inline public function containsPoint(point:flight._js.Vector3):Bool {
		return flight._js._fn.Geometry.containsAabbPoint(cast this, point);
	}
	inline public function copy(source:flight._js.Aabb):Void {
		flight._js._fn.Geometry.copyAabb(cast this, source);
	}
	inline public function expandByPoint(aabb:flight._js.Aabb, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.expandAabbByPoint(cast this, aabb, point);
	}
	inline public function expandBySphere(aabb:flight._js.Aabb, sphere:flight._js.BoundingSphere):Void {
		flight._js._fn.Geometry.expandAabbBySphere(cast this, aabb, sphere);
	}
	inline public function getCenter(out:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getAabbCenter(out, cast this);
	}
	inline public function getExtents(out:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getAabbExtents(out, cast this);
	}
	inline public function getSize(out:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getAabbSize(out, cast this);
	}
	inline public function getClosestPointOn(out:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getClosestPointOnAabb(out, cast this, point);
	}
	inline public function intersect(a:flight._js.Aabb, b:flight._js.Aabb):Void {
		flight._js._fn.Geometry.intersectAabb(cast this, a, b);
	}
	inline public function isAabbIntersecting(b:flight._js.Aabb):Bool {
		return flight._js._fn.Geometry.isAabbIntersectingAabb(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._js.BoundingSphere):Bool {
		return flight._js._fn.Geometry.isAabbIntersectingSphere(cast this, sphere);
	}
	inline public function set(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void {
		flight._js._fn.Geometry.setAabb(cast this, minX, minY, minZ, maxX, maxY, maxZ);
	}
	inline public function setFromPoints(points:Dynamic, pointsLen:Int):Void {
		flight._js._fn.Geometry.setAabbFromPoints(cast this, points, pointsLen);
	}
	inline public function transformByMatrix4(aabb:flight._js.Aabb, m:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.transformAabbByMatrix4(cast this, aabb, m);
	}
	inline public function union(a:flight._js.Aabb, b:flight._js.Aabb):Void {
		flight._js._fn.Geometry.unionAabb(cast this, a, b);
	}
	inline public function setBoundingSphereFrom(out:flight._js.BoundingSphere):Void {
		flight._js._fn.Geometry.setBoundingSphereFromAabb(out, cast this);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeAabb(cast this);
	}
	inline public function computeParticleEmitter3dLocalBounds(source:Dynamic):Void {
		flight._js._fn.Particleemitter.computeParticleEmitter3dLocalBoundsAabb(cast this, source);
	}
}
