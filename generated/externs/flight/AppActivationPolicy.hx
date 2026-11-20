package flight;

abstract AppActivationPolicy(Int) from Int to Int {
	public static inline var Regular:AppActivationPolicy = 0;
	public static inline var Accessory:AppActivationPolicy = 1;
	public static inline var Prohibited:AppActivationPolicy = 2;
}
