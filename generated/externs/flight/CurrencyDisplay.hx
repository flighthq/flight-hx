package flight;

abstract CurrencyDisplay(Int) from Int to Int {
	public static inline var Code:CurrencyDisplay = 0;
	public static inline var Symbol:CurrencyDisplay = 1;
	public static inline var NarrowSymbol:CurrencyDisplay = 2;
	public static inline var Name:CurrencyDisplay = 3;
}
