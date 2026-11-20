package flight._js._fn;

@:jsRequire("@flighthq/notification")
extern class Notification {
	@:native("createNotificationActionSubscription")
	public static function createNotificationActionSubscription():flight._js.NotificationActionSubscription;
	@:native("createNotificationClickSubscription")
	public static function createNotificationClickSubscription():flight._js.NotificationClickSubscription;
	@:native("createNotificationDismissSubscription")
	public static function createNotificationDismissSubscription():flight._js.NotificationDismissSubscription;
	@:native("createNotificationReceivedSubscription")
	public static function createNotificationReceivedSubscription():flight._js.NotificationReceivedSubscription;
	@:native("createNotificationReplySubscription")
	public static function createNotificationReplySubscription():flight._js.NotificationReplySubscription;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNotificationActionSubscription(ptr:flight._js.NotificationActionSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNotificationClickSubscription(ptr:flight._js.NotificationClickSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNotificationDismissSubscription(ptr:flight._js.NotificationDismissSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNotificationReceivedSubscription(ptr:flight._js.NotificationReceivedSubscription):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNotificationReplySubscription(ptr:flight._js.NotificationReplySubscription):Void {}
}
