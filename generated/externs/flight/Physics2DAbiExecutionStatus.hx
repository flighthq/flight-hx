package flight;

abstract Physics2DAbiExecutionStatus(Int) from Int to Int {
	public static inline var BusyWorld:Physics2DAbiExecutionStatus = 0;
	public static inline var Complete:Physics2DAbiExecutionStatus = 1;
	public static inline var InvalidBuffer:Physics2DAbiExecutionStatus = 2;
	public static inline var InvalidCommand:Physics2DAbiExecutionStatus = 3;
	public static inline var MissingBody:Physics2DAbiExecutionStatus = 4;
	public static inline var MissingCollider:Physics2DAbiExecutionStatus = 5;
	public static inline var MissingJoint:Physics2DAbiExecutionStatus = 6;
	public static inline var RejectedMutation:Physics2DAbiExecutionStatus = 7;
	public static inline var StaleWorld:Physics2DAbiExecutionStatus = 8;
	public static inline var UnsupportedJoint:Physics2DAbiExecutionStatus = 9;
	public static inline var UnsupportedShape:Physics2DAbiExecutionStatus = 10;
}
