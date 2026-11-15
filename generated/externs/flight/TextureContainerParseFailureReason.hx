package flight;

abstract TextureContainerParseFailureReason(Int) from Int to Int {
	public static inline var ContainerUnrecognized:TextureContainerParseFailureReason = 0;
	public static inline var FormatUnsupported:TextureContainerParseFailureReason = 1;
	public static inline var HeaderTruncated:TextureContainerParseFailureReason = 2;
	public static inline var LevelRangeOutOfBounds:TextureContainerParseFailureReason = 3;
	public static inline var StructureInvalid:TextureContainerParseFailureReason = 4;
}
