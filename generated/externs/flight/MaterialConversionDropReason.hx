package flight;

abstract MaterialConversionDropReason(Int) from Int to Int {
	public static inline var IncompatibleChannelSemantics:MaterialConversionDropReason = 0;
	public static inline var UnsupportedByTargetModel:MaterialConversionDropReason = 1;
}
