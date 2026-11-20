package flight;

abstract MediaSessionSetPositionStateReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionSetPositionStateReason = 0;
	public static inline var MediaSessionUnavailable:MediaSessionSetPositionStateReason = 1;
	public static inline var PositionStateUnavailable:MediaSessionSetPositionStateReason = 2;
	public static inline var InvalidDuration:MediaSessionSetPositionStateReason = 3;
	public static inline var InvalidPosition:MediaSessionSetPositionStateReason = 4;
	public static inline var InvalidPlaybackRate:MediaSessionSetPositionStateReason = 5;
	public static inline var OperationFailed:MediaSessionSetPositionStateReason = 6;
}
