package flight;

abstract NotificationLifecycleFailureOperation(Int) from Int to Int {
	public static inline var Cancel:NotificationLifecycleFailureOperation = 0;
	public static inline var Close:NotificationLifecycleFailureOperation = 1;
	public static inline var Release:NotificationLifecycleFailureOperation = 2;
}
