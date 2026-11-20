package flight;

abstract StorageWriteFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageWriteFailureReason = 0;
	public static inline var QuotaExceeded:StorageWriteFailureReason = 1;
	public static inline var ReadFailed:StorageWriteFailureReason = 2;
	public static inline var RuntimeUnavailable:StorageWriteFailureReason = 3;
	public static inline var SecurityDenied:StorageWriteFailureReason = 4;
	public static inline var SerializationFailed:StorageWriteFailureReason = 5;
	public static inline var WriteFailed:StorageWriteFailureReason = 6;
}
