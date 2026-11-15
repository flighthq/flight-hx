package flight;

abstract MotionPathLoopMode(Int) from Int to Int {
	public static inline var Clamp:MotionPathLoopMode = 0;
	public static inline var Loop:MotionPathLoopMode = 1;
	public static inline var Pingpong:MotionPathLoopMode = 2;
}
