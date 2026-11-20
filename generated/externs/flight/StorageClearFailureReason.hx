package flight;

abstract StorageClearFailureReason(Int) from Int to Int {
	public static inline var ClearFailed:StorageClearFailureReason = 0;
	public static inline var QuotaExceeded:StorageClearFailureReason = 1;
	public static inline var RuntimeUnavailable:StorageClearFailureReason = 2;
	public static inline var SecurityDenied:StorageClearFailureReason = 3;
}
