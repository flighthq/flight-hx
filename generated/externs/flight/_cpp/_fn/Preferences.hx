package flight._cpp._fn;

extern class Preferences {
	@:native("flight_create_storage_signals")
	public static function createStorageSignals():flight._cpp.StorageSignals;
	@:native("flight_attach_storage")
	public static function attachStorage(hostPreferencesChange:flight._cpp.HostPreferencesChangeCapability, signals:flight._cpp.StorageSignals):Bool;
	@:native("flight_clear_storage")
	public static function clearStorage(hostPreferences:flight._cpp.HostPreferencesCapability, signals:flight._cpp.StorageSignals):flight._cpp.StorageClearResult;
	@:native("flight_clear_storage_namespace")
	public static function clearStorageNamespace(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace, signals:flight._cpp.StorageSignals):flight._cpp.StorageClearNamespaceResult;
	@:native("flight_destroy_storage")
	public static function destroyStorage(hostPreferencesChange:flight._cpp.HostPreferencesChangeCapability):Void;
	@:native("flight_detach_storage")
	public static function detachStorage(signals:flight._cpp.StorageSignals):Void;
	@:native("flight_dispose_storage")
	public static function disposeStorage(signals:flight._cpp.StorageSignals):Void;
	@:native("flight_get_namespaced_storage_byte_size")
	public static function getNamespacedStorageByteSize(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace):flight._cpp.StorageByteSizeResult;
	@:native("flight_get_namespaced_storage_entries")
	public static function getNamespacedStorageEntries(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace):flight._cpp.StorageEntriesResult;
	@:native("flight_get_namespaced_storage_item")
	public static function getNamespacedStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace, key:cpp.ConstCharStar):flight._cpp.StorageGetItemResult;
	@:native("flight_get_namespaced_storage_item_presence")
	public static function getNamespacedStorageItemPresence(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace, key:cpp.ConstCharStar):flight._cpp.StoragePresenceResult;
	@:native("flight_get_namespaced_storage_keys")
	public static function getNamespacedStorageKeys(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace):flight._cpp.StorageKeysResult;
	@:native("flight_get_storage_boolean")
	public static function getStorageBoolean(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar):flight._cpp.StorageBooleanResult;
	@:native("flight_get_storage_boolean_or")
	public static function getStorageBooleanOr(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, fallback:Bool):flight._cpp.StorageBooleanOrResult;
	@:native("flight_get_storage_byte_size")
	public static function getStorageByteSize(hostPreferences:flight._cpp.HostPreferencesCapability):flight._cpp.StorageByteSizeResult;
	@:native("flight_get_storage_entries")
	public static function getStorageEntries(hostPreferences:flight._cpp.HostPreferencesCapability):flight._cpp.StorageEntriesResult;
	@:native("flight_get_storage_item")
	public static function getStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar):flight._cpp.StorageGetItemResult;
	@:native("flight_get_storage_item_count")
	public static function getStorageItemCount(hostPreferences:flight._cpp.HostPreferencesCapability):flight._cpp.StorageItemCountResult;
	@:native("flight_get_storage_item_or")
	public static function getStorageItemOr(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, fallback:cpp.ConstCharStar):flight._cpp.StorageItemOrResult;
	@:native("flight_get_storage_item_presence")
	public static function getStorageItemPresence(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar):flight._cpp.StoragePresenceResult;
	@:native("flight_get_storage_items")
	public static function getStorageItems(hostPreferences:flight._cpp.HostPreferencesCapability, keys:cpp.Star<cpp.Void>, keysLen:Int):flight._cpp.StorageItemsResult;
	@:native("flight_get_storage_keys")
	public static function getStorageKeys(hostPreferences:flight._cpp.HostPreferencesCapability):flight._cpp.StorageKeysResult;
	@:native("flight_get_storage_number")
	public static function getStorageNumber(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar):flight._cpp.StorageNumberResult;
	@:native("flight_get_storage_number_or")
	public static function getStorageNumberOr(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, fallback:Float):flight._cpp.StorageNumberOrResult;
	@:native("flight_remove_namespaced_storage_item")
	public static function removeNamespacedStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace, key:cpp.ConstCharStar, signals:flight._cpp.StorageSignals):flight._cpp.StorageRemoveItemResult;
	@:native("flight_remove_storage_item")
	public static function removeStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, signals:flight._cpp.StorageSignals):flight._cpp.StorageRemoveItemResult;
	@:native("flight_remove_storage_items")
	public static function removeStorageItems(hostPreferences:flight._cpp.HostPreferencesCapability, keys:cpp.Star<cpp.Void>, keysLen:Int, signals:flight._cpp.StorageSignals):flight._cpp.StorageRemoveItemsResult;
	@:native("flight_set_namespaced_storage_item")
	public static function setNamespacedStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, namespace:flight._cpp.StorageNamespace, key:cpp.ConstCharStar, value:cpp.ConstCharStar, signals:flight._cpp.StorageSignals):flight._cpp.StorageSetItemResult;
	@:native("flight_set_storage_boolean")
	public static function setStorageBoolean(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, value:Bool, signals:flight._cpp.StorageSignals):flight._cpp.StorageSetItemResult;
	@:native("flight_set_storage_item")
	public static function setStorageItem(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, value:cpp.ConstCharStar, signals:flight._cpp.StorageSignals):flight._cpp.StorageSetItemResult;
	@:native("flight_set_storage_number")
	public static function setStorageNumber(hostPreferences:flight._cpp.HostPreferencesCapability, key:cpp.ConstCharStar, value:Float, signals:flight._cpp.StorageSignals):flight._cpp.StorageSetItemResult;
	@:native("flight_free_storage_signals")
	public static function freeStorageSignals(ptr:flight._cpp.StorageSignals):Void;
	@:native("flight_free_storage_clear_result")
	public static function freeStorageClearResult(ptr:flight._cpp.StorageClearResult):Void;
	@:native("flight_free_storage_clear_namespace_result")
	public static function freeStorageClearNamespaceResult(ptr:flight._cpp.StorageClearNamespaceResult):Void;
	@:native("flight_free_storage_byte_size_result")
	public static function freeStorageByteSizeResult(ptr:flight._cpp.StorageByteSizeResult):Void;
	@:native("flight_free_storage_entries_result")
	public static function freeStorageEntriesResult(ptr:flight._cpp.StorageEntriesResult):Void;
	@:native("flight_free_storage_get_item_result")
	public static function freeStorageGetItemResult(ptr:flight._cpp.StorageGetItemResult):Void;
	@:native("flight_free_storage_presence_result")
	public static function freeStoragePresenceResult(ptr:flight._cpp.StoragePresenceResult):Void;
	@:native("flight_free_storage_keys_result")
	public static function freeStorageKeysResult(ptr:flight._cpp.StorageKeysResult):Void;
	@:native("flight_free_storage_boolean_result")
	public static function freeStorageBooleanResult(ptr:flight._cpp.StorageBooleanResult):Void;
	@:native("flight_free_storage_boolean_or_result")
	public static function freeStorageBooleanOrResult(ptr:flight._cpp.StorageBooleanOrResult):Void;
	@:native("flight_free_storage_item_count_result")
	public static function freeStorageItemCountResult(ptr:flight._cpp.StorageItemCountResult):Void;
	@:native("flight_free_storage_item_or_result")
	public static function freeStorageItemOrResult(ptr:flight._cpp.StorageItemOrResult):Void;
	@:native("flight_free_storage_items_result")
	public static function freeStorageItemsResult(ptr:flight._cpp.StorageItemsResult):Void;
	@:native("flight_free_storage_number_result")
	public static function freeStorageNumberResult(ptr:flight._cpp.StorageNumberResult):Void;
	@:native("flight_free_storage_number_or_result")
	public static function freeStorageNumberOrResult(ptr:flight._cpp.StorageNumberOrResult):Void;
	@:native("flight_free_storage_remove_item_result")
	public static function freeStorageRemoveItemResult(ptr:flight._cpp.StorageRemoveItemResult):Void;
	@:native("flight_free_storage_remove_items_result")
	public static function freeStorageRemoveItemsResult(ptr:flight._cpp.StorageRemoveItemsResult):Void;
	@:native("flight_free_storage_set_item_result")
	public static function freeStorageSetItemResult(ptr:flight._cpp.StorageSetItemResult):Void;
	@:native("flight_free_storage_set_items_result")
	public static function freeStorageSetItemsResult(ptr:flight._cpp.StorageSetItemsResult):Void;
}
