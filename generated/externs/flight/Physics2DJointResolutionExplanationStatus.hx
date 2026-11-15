package flight;

abstract Physics2DJointResolutionExplanationStatus(Int) from Int to Int {
	public static inline var Complete:Physics2DJointResolutionExplanationStatus = 0;
	public static inline var UnresolvedJoints:Physics2DJointResolutionExplanationStatus = 1;
}
