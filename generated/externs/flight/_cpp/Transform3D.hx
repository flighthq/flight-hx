package flight._cpp;

abstract Transform3D(cpp.Star<cpp.Void>) {
	static inline public function create():flight._cpp.Transform3D {
		return flight._cpp._fn.Geometry.createTransform3d();
	}
	inline public function decomposeMatrix4To(m:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.decomposeMatrix4ToTransform3d(cast this, m);
	}
}
