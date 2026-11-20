package flight;

abstract StorageSetItemFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageSetItemFailureReason = 0;
	public static inline var QuotaExceeded:StorageSetItemFailureReason = 1;
	public static inline var ReadFailed:StorageSetItemFailureReason = 2;
	public static inline var RuntimeUnavailable:StorageSetItemFailureReason = 3;
	public static inline var SecurityDenied:StorageSetItemFailureReason = 4;
	public static inline var WriteFailed:StorageSetItemFailureReason = 5;
}
