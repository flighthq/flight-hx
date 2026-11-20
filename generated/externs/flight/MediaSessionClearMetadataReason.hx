package flight;

abstract MediaSessionClearMetadataReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionClearMetadataReason = 0;
	public static inline var MediaSessionUnavailable:MediaSessionClearMetadataReason = 1;
	public static inline var OperationFailed:MediaSessionClearMetadataReason = 2;
}
