package flight;

abstract SpritesheetAnimationDirection(Int) from Int to Int {
	public static inline var Forward:SpritesheetAnimationDirection = 0;
	public static inline var Pingpong:SpritesheetAnimationDirection = 1;
	public static inline var PingpongReverse:SpritesheetAnimationDirection = 2;
	public static inline var Reverse:SpritesheetAnimationDirection = 3;
}
