package flight;

abstract Physics2DJointResolutionStatus(Int) from Int to Int {
	public static inline var BodiesMissing:Physics2DJointResolutionStatus = 0;
	public static inline var BodyAMissing:Physics2DJointResolutionStatus = 1;
	public static inline var BodyBMissing:Physics2DJointResolutionStatus = 2;
	public static inline var Ready:Physics2DJointResolutionStatus = 3;
	public static inline var SolverUnregistered:Physics2DJointResolutionStatus = 4;
}
