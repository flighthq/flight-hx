package flight;

abstract StorageRemoveItemFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageRemoveItemFailureReason = 0;
	public static inline var QuotaExceeded:StorageRemoveItemFailureReason = 1;
	public static inline var ReadFailed:StorageRemoveItemFailureReason = 2;
	public static inline var RemoveFailed:StorageRemoveItemFailureReason = 3;
	public static inline var RuntimeUnavailable:StorageRemoveItemFailureReason = 4;
	public static inline var SecurityDenied:StorageRemoveItemFailureReason = 5;
}
