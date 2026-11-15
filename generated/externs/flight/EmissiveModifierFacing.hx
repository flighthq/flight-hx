package flight;

abstract EmissiveModifierFacing(Int) from Int to Int {
	public static inline var AwayFromLight:EmissiveModifierFacing = 0;
	public static inline var Ignore:EmissiveModifierFacing = 1;
	public static inline var TowardLight:EmissiveModifierFacing = 2;
}
