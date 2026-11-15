package flight;

abstract Scene3DGraphSyncPolicy(Int) from Int to Int {
	public static inline var RefreshDerivedState:Scene3DGraphSyncPolicy = 0;
	public static inline var RequiresInvalidation:Scene3DGraphSyncPolicy = 1;
}
