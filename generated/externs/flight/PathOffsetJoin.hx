package flight;

abstract PathOffsetJoin(Int) from Int to Int {
	public static inline var Bevel:PathOffsetJoin = 0;
	public static inline var Miter:PathOffsetJoin = 1;
	public static inline var Round:PathOffsetJoin = 2;
	public static inline var Square:PathOffsetJoin = 3;
}
