package flight;

abstract GizmoTransformMode(Int) from Int to Int {
	public static inline var Rotate:GizmoTransformMode = 0;
	public static inline var Scale:GizmoTransformMode = 1;
	public static inline var Translate:GizmoTransformMode = 2;
}
