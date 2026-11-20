package flight;

abstract MediaSessionSetPlaybackStateReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionSetPlaybackStateReason = 0;
	public static inline var MediaSessionUnavailable:MediaSessionSetPlaybackStateReason = 1;
	public static inline var OperationFailed:MediaSessionSetPlaybackStateReason = 2;
}
