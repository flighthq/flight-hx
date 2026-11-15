package flight;

abstract TiledLayerDataFailure(Int) from Int to Int {
	public static inline var CompressedWithoutInflate:TiledLayerDataFailure = 0;
	public static inline var InflateFailed:TiledLayerDataFailure = 1;
}
