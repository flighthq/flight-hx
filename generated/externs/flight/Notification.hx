package flight;

#if hl

typedef Notification = flight._hl.Notification;

#elseif cpp

typedef Notification = flight._cpp.Notification;

#elseif (js && flight_esm)

typedef Notification = flight._js.Notification;

#elseif js

#error "flight.Notification on js requires flight_esm."

#else

#error "flight.Notification: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createNotificationActionSubscription():NotificationActionSubscription {
	return flight._js._fn.Notification.createNotificationActionSubscription();
}
#else
extern inline function createNotificationActionSubscription():NotificationActionSubscription {
#if hl
	return flight._hl._fn.Notification.createNotificationActionSubscription();
#elseif cpp
	return flight._cpp._fn.Notification.createNotificationActionSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Notification.createNotificationActionSubscription();
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNotificationClickSubscription():NotificationClickSubscription {
	return flight._js._fn.Notification.createNotificationClickSubscription();
}
#else
extern inline function createNotificationClickSubscription():NotificationClickSubscription {
#if hl
	return flight._hl._fn.Notification.createNotificationClickSubscription();
#elseif cpp
	return flight._cpp._fn.Notification.createNotificationClickSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Notification.createNotificationClickSubscription();
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNotificationDismissSubscription():NotificationDismissSubscription {
	return flight._js._fn.Notification.createNotificationDismissSubscription();
}
#else
extern inline function createNotificationDismissSubscription():NotificationDismissSubscription {
#if hl
	return flight._hl._fn.Notification.createNotificationDismissSubscription();
#elseif cpp
	return flight._cpp._fn.Notification.createNotificationDismissSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Notification.createNotificationDismissSubscription();
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNotificationReceivedSubscription():NotificationReceivedSubscription {
	return flight._js._fn.Notification.createNotificationReceivedSubscription();
}
#else
extern inline function createNotificationReceivedSubscription():NotificationReceivedSubscription {
#if hl
	return flight._hl._fn.Notification.createNotificationReceivedSubscription();
#elseif cpp
	return flight._cpp._fn.Notification.createNotificationReceivedSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Notification.createNotificationReceivedSubscription();
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNotificationReplySubscription():NotificationReplySubscription {
	return flight._js._fn.Notification.createNotificationReplySubscription();
}
#else
extern inline function createNotificationReplySubscription():NotificationReplySubscription {
#if hl
	return flight._hl._fn.Notification.createNotificationReplySubscription();
#elseif cpp
	return flight._cpp._fn.Notification.createNotificationReplySubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Notification.createNotificationReplySubscription();
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNotificationActionSubscription(ptr:NotificationActionSubscription):Void {
	flight._js._fn.Notification.freeNotificationActionSubscription(ptr);
}
#else
extern inline function freeNotificationActionSubscription(ptr:NotificationActionSubscription):Void {
#if hl
	flight._hl._fn.Notification.freeNotificationActionSubscription(ptr);
#elseif cpp
	flight._cpp._fn.Notification.freeNotificationActionSubscription(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Notification.freeNotificationActionSubscription(ptr);
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNotificationClickSubscription(ptr:NotificationClickSubscription):Void {
	flight._js._fn.Notification.freeNotificationClickSubscription(ptr);
}
#else
extern inline function freeNotificationClickSubscription(ptr:NotificationClickSubscription):Void {
#if hl
	flight._hl._fn.Notification.freeNotificationClickSubscription(ptr);
#elseif cpp
	flight._cpp._fn.Notification.freeNotificationClickSubscription(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Notification.freeNotificationClickSubscription(ptr);
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNotificationDismissSubscription(ptr:NotificationDismissSubscription):Void {
	flight._js._fn.Notification.freeNotificationDismissSubscription(ptr);
}
#else
extern inline function freeNotificationDismissSubscription(ptr:NotificationDismissSubscription):Void {
#if hl
	flight._hl._fn.Notification.freeNotificationDismissSubscription(ptr);
#elseif cpp
	flight._cpp._fn.Notification.freeNotificationDismissSubscription(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Notification.freeNotificationDismissSubscription(ptr);
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNotificationReceivedSubscription(ptr:NotificationReceivedSubscription):Void {
	flight._js._fn.Notification.freeNotificationReceivedSubscription(ptr);
}
#else
extern inline function freeNotificationReceivedSubscription(ptr:NotificationReceivedSubscription):Void {
#if hl
	flight._hl._fn.Notification.freeNotificationReceivedSubscription(ptr);
#elseif cpp
	flight._cpp._fn.Notification.freeNotificationReceivedSubscription(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Notification.freeNotificationReceivedSubscription(ptr);
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNotificationReplySubscription(ptr:NotificationReplySubscription):Void {
	flight._js._fn.Notification.freeNotificationReplySubscription(ptr);
}
#else
extern inline function freeNotificationReplySubscription(ptr:NotificationReplySubscription):Void {
#if hl
	flight._hl._fn.Notification.freeNotificationReplySubscription(ptr);
#elseif cpp
	flight._cpp._fn.Notification.freeNotificationReplySubscription(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Notification.freeNotificationReplySubscription(ptr);
#else
	#error "flight.Notification: no backend for this target."
#end
}
#end
