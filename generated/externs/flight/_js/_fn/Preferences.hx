package flight._js._fn;

@:jsRequire("@flighthq/preferences")
extern class Preferences {
	@:native("createStorageSignals")
	public static function createStorageSignals():flight._js.StorageSignals;
	@:native("attachStorage")
	public static function attachStorage(hostPreferencesChange:flight._js.HostPreferencesChangeCapability, signals:flight._js.StorageSignals):Bool;
	@:native("clearStorage")
	public static function clearStorage(hostPreferences:flight._js.HostPreferencesCapability, signals:Null<flight._js.StorageSignals>):flight._js.StorageClearResult;
	@:native("clearStorageNamespace")
	public static function clearStorageNamespace(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace, signals:Null<flight._js.StorageSignals>):flight._js.StorageClearNamespaceResult;
	@:native("destroyStorage")
	public static function destroyStorage(hostPreferencesChange:flight._js.HostPreferencesChangeCapability):Void;
	@:native("detachStorage")
	public static function detachStorage(signals:flight._js.StorageSignals):Void;
	@:native("disposeStorage")
	public static function disposeStorage(signals:flight._js.StorageSignals):Void;
	@:native("getNamespacedStorageByteSize")
	public static function getNamespacedStorageByteSize(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace):flight._js.StorageByteSizeResult;
	@:native("getNamespacedStorageEntries")
	public static function getNamespacedStorageEntries(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace):flight._js.StorageEntriesResult;
	@:native("getNamespacedStorageItem")
	public static function getNamespacedStorageItem(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace, key:String):flight._js.StorageGetItemResult;
	@:native("getNamespacedStorageItemPresence")
	public static function getNamespacedStorageItemPresence(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace, key:String):flight._js.StoragePresenceResult;
	@:native("getNamespacedStorageKeys")
	public static function getNamespacedStorageKeys(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace):flight._js.StorageKeysResult;
	@:native("getStorageBoolean")
	public static function getStorageBoolean(hostPreferences:flight._js.HostPreferencesCapability, key:String):flight._js.StorageBooleanResult;
	@:native("getStorageBooleanOr")
	public static function getStorageBooleanOr(hostPreferences:flight._js.HostPreferencesCapability, key:String, fallback:Bool):flight._js.StorageBooleanOrResult;
	@:native("getStorageByteSize")
	public static function getStorageByteSize(hostPreferences:flight._js.HostPreferencesCapability):flight._js.StorageByteSizeResult;
	@:native("getStorageEntries")
	public static function getStorageEntries(hostPreferences:flight._js.HostPreferencesCapability):flight._js.StorageEntriesResult;
	@:native("getStorageItem")
	public static function getStorageItem(hostPreferences:flight._js.HostPreferencesCapability, key:String):flight._js.StorageGetItemResult;
	@:native("getStorageItemCount")
	public static function getStorageItemCount(hostPreferences:flight._js.HostPreferencesCapability):flight._js.StorageItemCountResult;
	@:native("getStorageItemOr")
	public static function getStorageItemOr(hostPreferences:flight._js.HostPreferencesCapability, key:String, fallback:String):flight._js.StorageItemOrResult;
	@:native("getStorageItemPresence")
	public static function getStorageItemPresence(hostPreferences:flight._js.HostPreferencesCapability, key:String):flight._js.StoragePresenceResult;
	@:native("getStorageItems")
	public static function getStorageItems(hostPreferences:flight._js.HostPreferencesCapability, keys:Dynamic):flight._js.StorageItemsResult;
	@:native("getStorageKeys")
	public static function getStorageKeys(hostPreferences:flight._js.HostPreferencesCapability):flight._js.StorageKeysResult;
	@:native("getStorageNumber")
	public static function getStorageNumber(hostPreferences:flight._js.HostPreferencesCapability, key:String):flight._js.StorageNumberResult;
	@:native("getStorageNumberOr")
	public static function getStorageNumberOr(hostPreferences:flight._js.HostPreferencesCapability, key:String, fallback:Float):flight._js.StorageNumberOrResult;
	@:native("removeNamespacedStorageItem")
	public static function removeNamespacedStorageItem(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace, key:String, signals:Null<flight._js.StorageSignals>):flight._js.StorageRemoveItemResult;
	@:native("removeStorageItem")
	public static function removeStorageItem(hostPreferences:flight._js.HostPreferencesCapability, key:String, signals:Null<flight._js.StorageSignals>):flight._js.StorageRemoveItemResult;
	@:native("removeStorageItems")
	public static function removeStorageItems(hostPreferences:flight._js.HostPreferencesCapability, keys:Dynamic, signals:Null<flight._js.StorageSignals>):flight._js.StorageRemoveItemsResult;
	@:native("setNamespacedStorageItem")
	public static function setNamespacedStorageItem(hostPreferences:flight._js.HostPreferencesCapability, namespace:flight._js.StorageNamespace, key:String, value:String, signals:Null<flight._js.StorageSignals>):flight._js.StorageSetItemResult;
	@:native("setStorageBoolean")
	public static function setStorageBoolean(hostPreferences:flight._js.HostPreferencesCapability, key:String, value:Bool, signals:Null<flight._js.StorageSignals>):flight._js.StorageSetItemResult;
	@:native("setStorageItem")
	public static function setStorageItem(hostPreferences:flight._js.HostPreferencesCapability, key:String, value:String, signals:Null<flight._js.StorageSignals>):flight._js.StorageSetItemResult;
	@:native("setStorageItems")
	public static function setStorageItems(hostPreferences:flight._js.HostPreferencesCapability, record:Dynamic, signals:Null<flight._js.StorageSignals>):flight._js.StorageSetItemsResult;
	@:native("setStorageNumber")
	public static function setStorageNumber(hostPreferences:flight._js.HostPreferencesCapability, key:String, value:Float, signals:Null<flight._js.StorageSignals>):flight._js.StorageSetItemResult;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageSignals(ptr:flight._js.StorageSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageClearResult(ptr:flight._js.StorageClearResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageClearNamespaceResult(ptr:flight._js.StorageClearNamespaceResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageByteSizeResult(ptr:flight._js.StorageByteSizeResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageEntriesResult(ptr:flight._js.StorageEntriesResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageGetItemResult(ptr:flight._js.StorageGetItemResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStoragePresenceResult(ptr:flight._js.StoragePresenceResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageKeysResult(ptr:flight._js.StorageKeysResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageBooleanResult(ptr:flight._js.StorageBooleanResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageBooleanOrResult(ptr:flight._js.StorageBooleanOrResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageItemCountResult(ptr:flight._js.StorageItemCountResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageItemOrResult(ptr:flight._js.StorageItemOrResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageItemsResult(ptr:flight._js.StorageItemsResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageNumberResult(ptr:flight._js.StorageNumberResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageNumberOrResult(ptr:flight._js.StorageNumberOrResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageRemoveItemResult(ptr:flight._js.StorageRemoveItemResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageRemoveItemsResult(ptr:flight._js.StorageRemoveItemsResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageSetItemResult(ptr:flight._js.StorageSetItemResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStorageSetItemsResult(ptr:flight._js.StorageSetItemsResult):Void {}
}
