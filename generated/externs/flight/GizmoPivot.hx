package flight;

abstract GizmoPivot(Int) from Int to Int {
	public static inline var Center:GizmoPivot = 0;
	public static inline var Custom:GizmoPivot = 1;
	public static inline var Origin:GizmoPivot = 2;
}
