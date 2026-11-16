package flight;

abstract Scene3DAnimationPath(Int) from Int to Int {
	public static inline var Rotation:Scene3DAnimationPath = 0;
	public static inline var Scale:Scene3DAnimationPath = 1;
	public static inline var Translation:Scene3DAnimationPath = 2;
	public static inline var Weights:Scene3DAnimationPath = 3;
}
