package flight;

abstract Physics3DJointStatus(Int) from Int to Int {
	public static inline var InvalidBodies:Physics3DJointStatus = 0;
	public static inline var Solvable:Physics3DJointStatus = 1;
	public static inline var UnregisteredKind:Physics3DJointStatus = 2;
}
