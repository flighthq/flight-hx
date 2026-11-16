package flight;

abstract StlNormalPolicy(Int) from Int to Int {
	public static inline var FileNormals:StlNormalPolicy = 0;
	public static inline var RecomputeFromVertices:StlNormalPolicy = 1;
}
