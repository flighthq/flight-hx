package flight;

abstract StorageClearNamespaceFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageClearNamespaceFailureReason = 0;
	public static inline var QuotaExceeded:StorageClearNamespaceFailureReason = 1;
	public static inline var ReadFailed:StorageClearNamespaceFailureReason = 2;
	public static inline var RemoveFailed:StorageClearNamespaceFailureReason = 3;
	public static inline var RuntimeUnavailable:StorageClearNamespaceFailureReason = 4;
	public static inline var SecurityDenied:StorageClearNamespaceFailureReason = 5;
}
