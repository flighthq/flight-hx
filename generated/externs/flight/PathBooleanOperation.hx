package flight;

abstract PathBooleanOperation(Int) from Int to Int {
	public static inline var Difference:PathBooleanOperation = 0;
	public static inline var Intersection:PathBooleanOperation = 1;
	public static inline var Union:PathBooleanOperation = 2;
	public static inline var Xor:PathBooleanOperation = 3;
}
