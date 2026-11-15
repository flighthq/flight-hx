package flight;

abstract NumberStyle(Int) from Int to Int {
	public static inline var Decimal:NumberStyle = 0;
	public static inline var Percent:NumberStyle = 1;
	public static inline var Currency:NumberStyle = 2;
	public static inline var Unit:NumberStyle = 3;
}
