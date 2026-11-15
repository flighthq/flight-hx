package flight;

abstract IntlRelativeTimeUnit(Int) from Int to Int {
	public static inline var Year:IntlRelativeTimeUnit = 0;
	public static inline var Years:IntlRelativeTimeUnit = 1;
	public static inline var Quarter:IntlRelativeTimeUnit = 2;
	public static inline var Quarters:IntlRelativeTimeUnit = 3;
	public static inline var Month:IntlRelativeTimeUnit = 4;
	public static inline var Months:IntlRelativeTimeUnit = 5;
	public static inline var Week:IntlRelativeTimeUnit = 6;
	public static inline var Weeks:IntlRelativeTimeUnit = 7;
	public static inline var Day:IntlRelativeTimeUnit = 8;
	public static inline var Days:IntlRelativeTimeUnit = 9;
	public static inline var Hour:IntlRelativeTimeUnit = 10;
	public static inline var Hours:IntlRelativeTimeUnit = 11;
	public static inline var Minute:IntlRelativeTimeUnit = 12;
	public static inline var Minutes:IntlRelativeTimeUnit = 13;
	public static inline var Second:IntlRelativeTimeUnit = 14;
	public static inline var Seconds:IntlRelativeTimeUnit = 15;
}
