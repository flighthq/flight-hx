package flight;

abstract StorageReadFailureReason(Int) from Int to Int {
	public static inline var ParseFailed:StorageReadFailureReason = 0;
	public static inline var PersistenceInvalid:StorageReadFailureReason = 1;
	public static inline var ReadFailed:StorageReadFailureReason = 2;
	public static inline var RuntimeUnavailable:StorageReadFailureReason = 3;
	public static inline var SecurityDenied:StorageReadFailureReason = 4;
}
