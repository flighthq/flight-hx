package flight._hl;

abstract Transform3D(hl.Bytes) {
	static inline public function create():flight._hl.Transform3D {
		return flight._hl._fn.Geometry.createTransform3d();
	}
	inline public function decomposeMatrix4To(m:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.decomposeMatrix4ToTransform3d(cast this, m);
	}
}
