package flight;

abstract StorageMigrationReadFailureReason(Int) from Int to Int {
	public static inline var PersistenceInvalid:StorageMigrationReadFailureReason = 0;
	public static inline var ReadFailed:StorageMigrationReadFailureReason = 1;
	public static inline var RuntimeUnavailable:StorageMigrationReadFailureReason = 2;
	public static inline var SecurityDenied:StorageMigrationReadFailureReason = 3;
	public static inline var VersionParseFailed:StorageMigrationReadFailureReason = 4;
}
