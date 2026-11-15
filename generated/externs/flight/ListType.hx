package flight;

abstract ListType(Int) from Int to Int {
	public static inline var Conjunction:ListType = 0;
	public static inline var Disjunction:ListType = 1;
	public static inline var Unit:ListType = 2;
}
