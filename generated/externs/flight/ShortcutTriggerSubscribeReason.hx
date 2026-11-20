package flight;

abstract ShortcutTriggerSubscribeReason(Int) from Int to Int {
	public static inline var Refused:ShortcutTriggerSubscribeReason = 0;
	public static inline var Subscribed:ShortcutTriggerSubscribeReason = 1;
}
