package flight;

abstract MediaSessionSetMetadataReason(Int) from Int to Int {
	public static inline var Ok:MediaSessionSetMetadataReason = 0;
	public static inline var MediaSessionUnavailable:MediaSessionSetMetadataReason = 1;
	public static inline var MediaMetadataUnavailable:MediaSessionSetMetadataReason = 2;
	public static inline var InvalidArtworkSource:MediaSessionSetMetadataReason = 3;
	public static inline var OperationFailed:MediaSessionSetMetadataReason = 4;
}
