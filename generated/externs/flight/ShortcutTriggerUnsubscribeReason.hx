package flight;

abstract ShortcutTriggerUnsubscribeReason(Int) from Int to Int {
	public static inline var UnknownSubscription:ShortcutTriggerUnsubscribeReason = 0;
	public static inline var Unsubscribed:ShortcutTriggerUnsubscribeReason = 1;
}
