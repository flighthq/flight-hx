package flight._cpp._fn;

extern class Notification {
	@:native("flight_create_notification_action_subscription")
	public static function createNotificationActionSubscription():flight._cpp.NotificationActionSubscription;
	@:native("flight_create_notification_click_subscription")
	public static function createNotificationClickSubscription():flight._cpp.NotificationClickSubscription;
	@:native("flight_create_notification_dismiss_subscription")
	public static function createNotificationDismissSubscription():flight._cpp.NotificationDismissSubscription;
	@:native("flight_create_notification_received_subscription")
	public static function createNotificationReceivedSubscription():flight._cpp.NotificationReceivedSubscription;
	@:native("flight_create_notification_reply_subscription")
	public static function createNotificationReplySubscription():flight._cpp.NotificationReplySubscription;
	@:native("flight_free_notification_action_subscription")
	public static function freeNotificationActionSubscription(ptr:flight._cpp.NotificationActionSubscription):Void;
	@:native("flight_free_notification_click_subscription")
	public static function freeNotificationClickSubscription(ptr:flight._cpp.NotificationClickSubscription):Void;
	@:native("flight_free_notification_dismiss_subscription")
	public static function freeNotificationDismissSubscription(ptr:flight._cpp.NotificationDismissSubscription):Void;
	@:native("flight_free_notification_received_subscription")
	public static function freeNotificationReceivedSubscription(ptr:flight._cpp.NotificationReceivedSubscription):Void;
	@:native("flight_free_notification_reply_subscription")
	public static function freeNotificationReplySubscription(ptr:flight._cpp.NotificationReplySubscription):Void;
}
