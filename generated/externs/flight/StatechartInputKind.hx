package flight;

abstract StatechartInputKind(Int) from Int to Int {
	public static inline var Boolean:StatechartInputKind = 0;
	public static inline var Number:StatechartInputKind = 1;
	public static inline var Trigger:StatechartInputKind = 2;
}
