package flight.esm.types.notification_contract;

#if (js && flight_esm)
typedef CapacitorNotificationCapabilities = Dynamic;

typedef ElectronMacosNotificationCapabilities = { click:flight.esm.types.notification_contract.Types.HostNotificationClickCapability, close:flight.esm.types.notification_contract.Types.HostNotificationCloseCapability, delivery:flight.esm.types.notification_contract.Types.HostNotificationDeliveryCapability, dismiss:flight.esm.types.notification_contract.Types.HostNotificationDismissCapability, lifecycle:flight.esm.types.notification_contract.Types.HostNotificationLifecycleCapability, received:flight.esm.types.notification_contract.Types.HostNotificationReceivedCapability, action:flight.esm.types.notification_contract.Types.HostNotificationActionCapability, reply:flight.esm.types.notification_contract.Types.HostNotificationReplyCapability };

typedef ElectronNotificationCapabilities = Dynamic;

typedef HostNotificationActionCapability = { attach:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventBackendAttachOutcome>) };

typedef HostNotificationActiveListCapability = { getActiveNotifications:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationActiveListOutcome>) };

typedef HostNotificationClickCapability = { attach:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventBackendAttachOutcome>) };

typedef HostNotificationCloseCapability = { closeAllNotifications:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationLifecycleOutcome>) };

typedef HostNotificationDeliveryCapability = { notify:((request:flight.esm.types.notification_contract.Types.NotificationRequest) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationDeliveryOutcome>) };

typedef HostNotificationDismissCapability = { attach:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventBackendAttachOutcome>) };

typedef HostNotificationLifecycleCapability = { destroy:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationLifecycleOutcome>) };

typedef HostNotificationPermissionCapability = { getPermission:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationPermissionQueryOutcome>), requestPermission:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationPermissionRequestOutcome>) };

typedef HostNotificationReceivedCapability = { attach:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventBackendAttachOutcome>) };

typedef HostNotificationReplyCapability = { attach:((listener:Dynamic) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventBackendAttachOutcome>) };

typedef HostNotificationSchedulingCapability = { cancelAllScheduledNotifications:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationLifecycleOutcome>), getPendingNotifications:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationPendingListOutcome>), scheduleNotification:((request:flight.esm.types.notification_contract.Types.NotificationRequest, schedule:flight.esm.types.notification_contract.Types.NotificationSchedule) -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationScheduleOutcome>) };

typedef Notification = { id:String, tag:String, title:String };

typedef NotificationAction = { id:String, title:String, ?icon:Null<String> };

typedef NotificationActionSubscription = { onNotificationAction:flight.esm.types.signals.Types.Signal<Array<Dynamic>> };

typedef NotificationActiveListOutcome = { reason:String };

typedef NotificationCancelOutcome = { reason:String };

typedef NotificationClickSubscription = { onNotificationClick:flight.esm.types.signals.Types.Signal<flight.esm.types.notification_contract.Types.Notification> };

typedef NotificationCloseOutcome = { reason:String };

typedef NotificationDeliveryOutcome = Dynamic;

typedef NotificationDismissSubscription = { onNotificationDismiss:flight.esm.types.signals.Types.Signal<flight.esm.types.notification_contract.Types.Notification> };

typedef NotificationEventAttachment = { release:(() -> js.lib.Promise<flight.esm.types.notification_contract.Types.NotificationEventReleaseOutcome>) };

typedef NotificationEventBackendAttachOutcome = { reason:String };

typedef NotificationEventReleaseOutcome = { reason:String };

typedef NotificationLifecycleFailure = { id:String, operation:String };

typedef NotificationLifecycleOutcome = Dynamic;

typedef NotificationPendingListOutcome = { reason:String };

typedef NotificationPermission = String;

typedef NotificationPermissionQueryOutcome = { reason:String };

typedef NotificationPermissionRequestOutcome = { reason:String };

typedef NotificationReceivedSubscription = { onNotificationReceived:flight.esm.types.signals.Types.Signal<flight.esm.types.notification_contract.Types.Notification> };

typedef NotificationReplySubscription = { onNotificationReply:flight.esm.types.signals.Types.Signal<Array<Dynamic>> };

typedef NotificationRequest = { title:String, ?id:Null<String>, ?body:Null<String>, ?icon:Null<String>, ?badge:Null<String>, ?tag:Null<String>, ?silent:Null<Bool>, ?actions:Null<Array<flight.esm.types.notification_contract.Types.NotificationAction>>, ?dir:Null<String>, ?image:Null<String>, ?lang:Null<String>, ?renotify:Null<Bool>, ?requireInteraction:Null<Bool>, ?timestamp:Null<Float>, ?vibrate:Null<Array<Float>>, ?data:Dynamic };

typedef NotificationRequestField = String;

typedef NotificationSchedule = { at:Float, ?repeat:Null<String> };

typedef NotificationScheduleOutcome = Dynamic;

typedef NotificationSubscriptionAttachOutcome = { reason:String };

typedef NotificationSubscriptionDetachOutcome = Dynamic;

typedef NotificationSubscriptionDisposeOutcome = Dynamic;

typedef ScheduledNotification = { id:String, request:flight.esm.types.notification_contract.Types.NotificationRequest, schedule:flight.esm.types.notification_contract.Types.NotificationSchedule };

typedef TauriNotificationCapabilities = Dynamic;

typedef WebNotificationOptions = { ?actions:Null<Array<Dynamic>>, ?badge:Null<String>, ?body:Null<String>, ?data:Dynamic, ?dir:Null<String>, ?icon:Null<String>, ?image:Null<String>, ?lang:Null<String>, ?renotify:Null<Bool>, ?requireInteraction:Null<Bool>, ?silent:Null<Bool>, ?tag:Null<String>, ?timestamp:Null<Float>, ?vibrate:Null<Array<Float>> };

typedef WebPageNotificationApi = { Notification:Dynamic };

typedef WebPageNotificationCapabilities = Dynamic;

typedef WebPageNotificationInstance = { close:(() -> Void), onclick:Null<(() -> Void)>, onclose:Null<(() -> Void)>, onerror:Null<(() -> Void)>, onshow:Null<(() -> Void)> };

typedef WebServiceWorkerNotificationApi = { permission:Dynamic, registration:flight.esm.types.notification_contract.Types.WebServiceWorkerNotificationRegistration };

typedef WebServiceWorkerNotificationCapabilities = Dynamic;

typedef WebServiceWorkerNotificationEvent = { ?actionId:Null<String>, notificationTag:String, type:String };

typedef WebServiceWorkerNotificationInstance = { ?data:Dynamic, tag:String, title:String, close:(() -> Void) };

typedef WebServiceWorkerNotificationRegistration = { getNotifications:((?filter:Dynamic) -> js.lib.Promise<Array<flight.esm.types.notification_contract.Types.WebServiceWorkerNotificationInstance>>), showNotification:((title:String, ?options:Null<flight.esm.types.notification_contract.Types.WebNotificationOptions>) -> js.lib.Promise<Void>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
