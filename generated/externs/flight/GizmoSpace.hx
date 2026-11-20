package flight;

abstract GizmoSpace(Int) from Int to Int {
	public static inline var Local:GizmoSpace = 0;
	public static inline var World:GizmoSpace = 1;
}
