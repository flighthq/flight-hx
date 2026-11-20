package flight;

abstract MediaSessionOperationReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionOperationReason = 0;
	public static inline var InvalidArtworkSource:MediaSessionOperationReason = 1;
	public static inline var InvalidDuration:MediaSessionOperationReason = 2;
	public static inline var InvalidPlaybackRate:MediaSessionOperationReason = 3;
	public static inline var InvalidPosition:MediaSessionOperationReason = 4;
	public static inline var MediaMetadataUnavailable:MediaSessionOperationReason = 5;
	public static inline var MediaSessionUnavailable:MediaSessionOperationReason = 6;
	public static inline var OperationFailed:MediaSessionOperationReason = 7;
	public static inline var PositionStateUnavailable:MediaSessionOperationReason = 8;
}
