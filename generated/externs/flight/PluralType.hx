package flight;

abstract PluralType(Int) from Int to Int {
	public static inline var Cardinal:PluralType = 0;
	public static inline var Ordinal:PluralType = 1;
}
