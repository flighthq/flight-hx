package flight;

abstract IntlPluralCategory(Int) from Int to Int {
	public static inline var Zero:IntlPluralCategory = 0;
	public static inline var One:IntlPluralCategory = 1;
	public static inline var Two:IntlPluralCategory = 2;
	public static inline var Few:IntlPluralCategory = 3;
	public static inline var Many:IntlPluralCategory = 4;
	public static inline var Other:IntlPluralCategory = 5;
}
