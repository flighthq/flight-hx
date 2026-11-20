package flight;

abstract MediaSessionClearPositionStateReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionClearPositionStateReason = 0;
	public static inline var MediaSessionUnavailable:MediaSessionClearPositionStateReason = 1;
	public static inline var PositionStateUnavailable:MediaSessionClearPositionStateReason = 2;
	public static inline var OperationFailed:MediaSessionClearPositionStateReason = 3;
}
