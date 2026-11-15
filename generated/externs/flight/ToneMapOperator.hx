package flight;

abstract ToneMapOperator(Int) from Int to Int {
	public static inline var Reinhard:ToneMapOperator = 0;
	public static inline var Aces:ToneMapOperator = 1;
	public static inline var Filmic:ToneMapOperator = 2;
	public static inline var Agx:ToneMapOperator = 3;
	public static inline var Uncharted2:ToneMapOperator = 4;
}
