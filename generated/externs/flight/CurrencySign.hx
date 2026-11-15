package flight;

abstract CurrencySign(Int) from Int to Int {
	public static inline var Standard:CurrencySign = 0;
	public static inline var Accounting:CurrencySign = 1;
}
