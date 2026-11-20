package flight;

abstract GizmoHandleKind(Int) from Int to Int {
	public static inline var Rotate:GizmoHandleKind = 0;
	public static inline var ScaleX:GizmoHandleKind = 1;
	public static inline var ScaleXy:GizmoHandleKind = 2;
	public static inline var ScaleY:GizmoHandleKind = 3;
	public static inline var TranslateX:GizmoHandleKind = 4;
	public static inline var TranslateXy:GizmoHandleKind = 5;
	public static inline var TranslateY:GizmoHandleKind = 6;
}
