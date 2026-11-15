package flight;

abstract TextureResolutionStatus(Int) from Int to Int {
	public static inline var MissingKind:TextureResolutionStatus = 0;
	public static inline var MissingResolver:TextureResolutionStatus = 1;
	public static inline var Registered:TextureResolutionStatus = 2;
}
