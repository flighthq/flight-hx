package flight;

abstract MeshDeformer(Int) from Int to Int {
	public static inline var Morph:MeshDeformer = 0;
	public static inline var None:MeshDeformer = 1;
	public static inline var Skeletal:MeshDeformer = 2;
}
