package flight;

abstract AppUpdateCheckReason(Int) from Int to Int {
	public static inline var Downloaded:AppUpdateCheckReason = 0;
	public static inline var CheckInProgress:AppUpdateCheckReason = 1;
	public static inline var NotAvailable:AppUpdateCheckReason = 2;
	public static inline var OperationFailed:AppUpdateCheckReason = 3;
}
