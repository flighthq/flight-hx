package flight;

abstract Physics3DAbiExecutionStatus(Int) from Int to Int {
	public static inline var BusyWorld:Physics3DAbiExecutionStatus = 0;
	public static inline var Complete:Physics3DAbiExecutionStatus = 1;
	public static inline var InvalidBuffer:Physics3DAbiExecutionStatus = 2;
	public static inline var InvalidCommand:Physics3DAbiExecutionStatus = 3;
	public static inline var MissingBody:Physics3DAbiExecutionStatus = 4;
	public static inline var MissingCollider:Physics3DAbiExecutionStatus = 5;
	public static inline var MissingJoint:Physics3DAbiExecutionStatus = 6;
	public static inline var RejectedMutation:Physics3DAbiExecutionStatus = 7;
	public static inline var StaleWorld:Physics3DAbiExecutionStatus = 8;
	public static inline var UnsupportedJoint:Physics3DAbiExecutionStatus = 9;
	public static inline var UnsupportedShape:Physics3DAbiExecutionStatus = 10;
}
