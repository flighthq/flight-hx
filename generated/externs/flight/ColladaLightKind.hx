package flight;

abstract ColladaLightKind(Int) from Int to Int {
	public static inline var Ambient:ColladaLightKind = 0;
	public static inline var Directional:ColladaLightKind = 1;
	public static inline var Point:ColladaLightKind = 2;
	public static inline var Spot:ColladaLightKind = 3;
}
