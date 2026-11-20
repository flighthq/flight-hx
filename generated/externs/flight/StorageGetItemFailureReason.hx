package flight;

abstract StorageGetItemFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageGetItemFailureReason = 0;
	public static inline var ReadFailed:StorageGetItemFailureReason = 1;
	public static inline var RuntimeUnavailable:StorageGetItemFailureReason = 2;
	public static inline var SecurityDenied:StorageGetItemFailureReason = 3;
}
