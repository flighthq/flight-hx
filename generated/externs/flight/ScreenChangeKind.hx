package flight;

abstract ScreenChangeKind(Int) from Int to Int {
	public static inline var ScreenAdded:ScreenChangeKind = 0;
	public static inline var ScreenMetricsChanged:ScreenChangeKind = 1;
	public static inline var ScreenRemoved:ScreenChangeKind = 2;
}
