package flight;

abstract VelocityReason(Int) from Int to Int {
	public static inline var NoSample:VelocityReason = 0;
	public static inline var Stale:VelocityReason = 1;
	public static inline var ExplicitZero:VelocityReason = 2;
	public static inline var DerivedZero:VelocityReason = 3;
	public static inline var Ok:VelocityReason = 4;
}
