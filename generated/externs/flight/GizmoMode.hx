package flight;

abstract GizmoMode(Int) from Int to Int {
	public static inline var None:GizmoMode = 0;
	public static inline var Rotate:GizmoMode = 1;
	public static inline var Scale:GizmoMode = 2;
	public static inline var Translate:GizmoMode = 3;
}
