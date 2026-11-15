package flight._js;

abstract Transform3D(Dynamic) {
	static inline public function create():flight._js.Transform3D {
		return flight._js._fn.Geometry.createTransform3d();
	}
	inline public function decomposeMatrix4To(m:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.decomposeMatrix4ToTransform3d(cast this, m);
	}
}
