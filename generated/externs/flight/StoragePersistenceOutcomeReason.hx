package flight;

abstract StoragePersistenceOutcomeReason(Int) from Int to Int {
	public static inline var BestEffort:StoragePersistenceOutcomeReason = 0;
	public static inline var OperationFailed:StoragePersistenceOutcomeReason = 1;
	public static inline var Persistent:StoragePersistenceOutcomeReason = 2;
}
