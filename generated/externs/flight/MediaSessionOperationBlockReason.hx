package flight;

abstract MediaSessionOperationBlockReason(Int) from Int to Int {
	public static inline var InvalidArtworkSource:MediaSessionOperationBlockReason = 0;
	public static inline var InvalidDuration:MediaSessionOperationBlockReason = 1;
	public static inline var InvalidPlaybackRate:MediaSessionOperationBlockReason = 2;
	public static inline var InvalidPosition:MediaSessionOperationBlockReason = 3;
	public static inline var MediaMetadataUnavailable:MediaSessionOperationBlockReason = 4;
	public static inline var MediaSessionUnavailable:MediaSessionOperationBlockReason = 5;
	public static inline var OperationFailed:MediaSessionOperationBlockReason = 6;
	public static inline var PositionStateUnavailable:MediaSessionOperationBlockReason = 7;
}
