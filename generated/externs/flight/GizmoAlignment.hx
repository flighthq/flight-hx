package flight;

abstract GizmoAlignment(Int) from Int to Int {
	public static inline var Bottom:GizmoAlignment = 0;
	public static inline var HorizontalCenter:GizmoAlignment = 1;
	public static inline var Left:GizmoAlignment = 2;
	public static inline var Right:GizmoAlignment = 3;
	public static inline var Top:GizmoAlignment = 4;
	public static inline var VerticalCenter:GizmoAlignment = 5;
}
