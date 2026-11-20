package flight._hl._fn;

extern class Preferences {
	@:hlNative("flight", "flight_create_storage_signals")
	public static function createStorageSignals():flight._hl.StorageSignals;
	@:hlNative("flight", "flight_attach_storage")
	public static function attachStorage(hostPreferencesChange:flight._hl.HostPreferencesChangeCapability, signals:flight._hl.StorageSignals):Bool;
	@:hlNative("flight", "flight_clear_storage")
	public static function clearStorage(hostPreferences:flight._hl.HostPreferencesCapability, signals:flight._hl.StorageSignals):flight._hl.StorageClearResult;
	@:hlNative("flight", "flight_clear_storage_namespace")
	public static function clearStorageNamespace(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace, signals:flight._hl.StorageSignals):flight._hl.StorageClearNamespaceResult;
	@:hlNative("flight", "flight_destroy_storage")
	public static function destroyStorage(hostPreferencesChange:flight._hl.HostPreferencesChangeCapability):Void;
	@:hlNative("flight", "flight_detach_storage")
	public static function detachStorage(signals:flight._hl.StorageSignals):Void;
	@:hlNative("flight", "flight_dispose_storage")
	public static function disposeStorage(signals:flight._hl.StorageSignals):Void;
	@:hlNative("flight", "flight_get_namespaced_storage_byte_size")
	public static function getNamespacedStorageByteSize(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace):flight._hl.StorageByteSizeResult;
	@:hlNative("flight", "flight_get_namespaced_storage_entries")
	public static function getNamespacedStorageEntries(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace):flight._hl.StorageEntriesResult;
	@:hlNative("flight", "flight_get_namespaced_storage_item")
	public static function getNamespacedStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace, key:hl.Bytes):flight._hl.StorageGetItemResult;
	@:hlNative("flight", "flight_get_namespaced_storage_item_presence")
	public static function getNamespacedStorageItemPresence(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace, key:hl.Bytes):flight._hl.StoragePresenceResult;
	@:hlNative("flight", "flight_get_namespaced_storage_keys")
	public static function getNamespacedStorageKeys(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace):flight._hl.StorageKeysResult;
	@:hlNative("flight", "flight_get_storage_boolean")
	public static function getStorageBoolean(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes):flight._hl.StorageBooleanResult;
	@:hlNative("flight", "flight_get_storage_boolean_or")
	public static function getStorageBooleanOr(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, fallback:Bool):flight._hl.StorageBooleanOrResult;
	@:hlNative("flight", "flight_get_storage_byte_size")
	public static function getStorageByteSize(hostPreferences:flight._hl.HostPreferencesCapability):flight._hl.StorageByteSizeResult;
	@:hlNative("flight", "flight_get_storage_entries")
	public static function getStorageEntries(hostPreferences:flight._hl.HostPreferencesCapability):flight._hl.StorageEntriesResult;
	@:hlNative("flight", "flight_get_storage_item")
	public static function getStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes):flight._hl.StorageGetItemResult;
	@:hlNative("flight", "flight_get_storage_item_count")
	public static function getStorageItemCount(hostPreferences:flight._hl.HostPreferencesCapability):flight._hl.StorageItemCountResult;
	@:hlNative("flight", "flight_get_storage_item_or")
	public static function getStorageItemOr(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, fallback:hl.Bytes):flight._hl.StorageItemOrResult;
	@:hlNative("flight", "flight_get_storage_item_presence")
	public static function getStorageItemPresence(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes):flight._hl.StoragePresenceResult;
	@:hlNative("flight", "flight_get_storage_items")
	public static function getStorageItems(hostPreferences:flight._hl.HostPreferencesCapability, keys:hl.Bytes, keysLen:Int):flight._hl.StorageItemsResult;
	@:hlNative("flight", "flight_get_storage_keys")
	public static function getStorageKeys(hostPreferences:flight._hl.HostPreferencesCapability):flight._hl.StorageKeysResult;
	@:hlNative("flight", "flight_get_storage_number")
	public static function getStorageNumber(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes):flight._hl.StorageNumberResult;
	@:hlNative("flight", "flight_get_storage_number_or")
	public static function getStorageNumberOr(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, fallback:Float):flight._hl.StorageNumberOrResult;
	@:hlNative("flight", "flight_remove_namespaced_storage_item")
	public static function removeNamespacedStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace, key:hl.Bytes, signals:flight._hl.StorageSignals):flight._hl.StorageRemoveItemResult;
	@:hlNative("flight", "flight_remove_storage_item")
	public static function removeStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, signals:flight._hl.StorageSignals):flight._hl.StorageRemoveItemResult;
	@:hlNative("flight", "flight_remove_storage_items")
	public static function removeStorageItems(hostPreferences:flight._hl.HostPreferencesCapability, keys:hl.Bytes, keysLen:Int, signals:flight._hl.StorageSignals):flight._hl.StorageRemoveItemsResult;
	@:hlNative("flight", "flight_set_namespaced_storage_item")
	public static function setNamespacedStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, namespace:flight._hl.StorageNamespace, key:hl.Bytes, value:hl.Bytes, signals:flight._hl.StorageSignals):flight._hl.StorageSetItemResult;
	@:hlNative("flight", "flight_set_storage_boolean")
	public static function setStorageBoolean(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, value:Bool, signals:flight._hl.StorageSignals):flight._hl.StorageSetItemResult;
	@:hlNative("flight", "flight_set_storage_item")
	public static function setStorageItem(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, value:hl.Bytes, signals:flight._hl.StorageSignals):flight._hl.StorageSetItemResult;
	@:hlNative("flight", "flight_set_storage_number")
	public static function setStorageNumber(hostPreferences:flight._hl.HostPreferencesCapability, key:hl.Bytes, value:Float, signals:flight._hl.StorageSignals):flight._hl.StorageSetItemResult;
	@:hlNative("flight", "flight_free_storage_signals")
	public static function freeStorageSignals(ptr:flight._hl.StorageSignals):Void;
	@:hlNative("flight", "flight_free_storage_clear_result")
	public static function freeStorageClearResult(ptr:flight._hl.StorageClearResult):Void;
	@:hlNative("flight", "flight_free_storage_clear_namespace_result")
	public static function freeStorageClearNamespaceResult(ptr:flight._hl.StorageClearNamespaceResult):Void;
	@:hlNative("flight", "flight_free_storage_byte_size_result")
	public static function freeStorageByteSizeResult(ptr:flight._hl.StorageByteSizeResult):Void;
	@:hlNative("flight", "flight_free_storage_entries_result")
	public static function freeStorageEntriesResult(ptr:flight._hl.StorageEntriesResult):Void;
	@:hlNative("flight", "flight_free_storage_get_item_result")
	public static function freeStorageGetItemResult(ptr:flight._hl.StorageGetItemResult):Void;
	@:hlNative("flight", "flight_free_storage_presence_result")
	public static function freeStoragePresenceResult(ptr:flight._hl.StoragePresenceResult):Void;
	@:hlNative("flight", "flight_free_storage_keys_result")
	public static function freeStorageKeysResult(ptr:flight._hl.StorageKeysResult):Void;
	@:hlNative("flight", "flight_free_storage_boolean_result")
	public static function freeStorageBooleanResult(ptr:flight._hl.StorageBooleanResult):Void;
	@:hlNative("flight", "flight_free_storage_boolean_or_result")
	public static function freeStorageBooleanOrResult(ptr:flight._hl.StorageBooleanOrResult):Void;
	@:hlNative("flight", "flight_free_storage_item_count_result")
	public static function freeStorageItemCountResult(ptr:flight._hl.StorageItemCountResult):Void;
	@:hlNative("flight", "flight_free_storage_item_or_result")
	public static function freeStorageItemOrResult(ptr:flight._hl.StorageItemOrResult):Void;
	@:hlNative("flight", "flight_free_storage_items_result")
	public static function freeStorageItemsResult(ptr:flight._hl.StorageItemsResult):Void;
	@:hlNative("flight", "flight_free_storage_number_result")
	public static function freeStorageNumberResult(ptr:flight._hl.StorageNumberResult):Void;
	@:hlNative("flight", "flight_free_storage_number_or_result")
	public static function freeStorageNumberOrResult(ptr:flight._hl.StorageNumberOrResult):Void;
	@:hlNative("flight", "flight_free_storage_remove_item_result")
	public static function freeStorageRemoveItemResult(ptr:flight._hl.StorageRemoveItemResult):Void;
	@:hlNative("flight", "flight_free_storage_remove_items_result")
	public static function freeStorageRemoveItemsResult(ptr:flight._hl.StorageRemoveItemsResult):Void;
	@:hlNative("flight", "flight_free_storage_set_item_result")
	public static function freeStorageSetItemResult(ptr:flight._hl.StorageSetItemResult):Void;
	@:hlNative("flight", "flight_free_storage_set_items_result")
	public static function freeStorageSetItemsResult(ptr:flight._hl.StorageSetItemsResult):Void;
}
