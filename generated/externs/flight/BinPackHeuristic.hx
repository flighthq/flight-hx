package flight;

abstract BinPackHeuristic(Int) from Int to Int {
	public static inline var BestShortSideFit:BinPackHeuristic = 0;
	public static inline var BestAreaFit:BinPackHeuristic = 1;
}
