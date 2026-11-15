package flight;

abstract PathBooleanExplanationReason(Int) from Int to Int {
	public static inline var CollapsedOrDegenerate:PathBooleanExplanationReason = 0;
	public static inline var EmptyInput:PathBooleanExplanationReason = 1;
	public static inline var NonFiniteDelta:PathBooleanExplanationReason = 2;
}
