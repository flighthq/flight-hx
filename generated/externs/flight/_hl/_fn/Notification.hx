package flight._hl._fn;

extern class Notification {
	@:hlNative("flight", "flight_create_notification_action_subscription")
	public static function createNotificationActionSubscription():flight._hl.NotificationActionSubscription;
	@:hlNative("flight", "flight_create_notification_click_subscription")
	public static function createNotificationClickSubscription():flight._hl.NotificationClickSubscription;
	@:hlNative("flight", "flight_create_notification_dismiss_subscription")
	public static function createNotificationDismissSubscription():flight._hl.NotificationDismissSubscription;
	@:hlNative("flight", "flight_create_notification_received_subscription")
	public static function createNotificationReceivedSubscription():flight._hl.NotificationReceivedSubscription;
	@:hlNative("flight", "flight_create_notification_reply_subscription")
	public static function createNotificationReplySubscription():flight._hl.NotificationReplySubscription;
	@:hlNative("flight", "flight_free_notification_action_subscription")
	public static function freeNotificationActionSubscription(ptr:flight._hl.NotificationActionSubscription):Void;
	@:hlNative("flight", "flight_free_notification_click_subscription")
	public static function freeNotificationClickSubscription(ptr:flight._hl.NotificationClickSubscription):Void;
	@:hlNative("flight", "flight_free_notification_dismiss_subscription")
	public static function freeNotificationDismissSubscription(ptr:flight._hl.NotificationDismissSubscription):Void;
	@:hlNative("flight", "flight_free_notification_received_subscription")
	public static function freeNotificationReceivedSubscription(ptr:flight._hl.NotificationReceivedSubscription):Void;
	@:hlNative("flight", "flight_free_notification_reply_subscription")
	public static function freeNotificationReplySubscription(ptr:flight._hl.NotificationReplySubscription):Void;
}
