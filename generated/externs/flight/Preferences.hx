package flight;

#if (js && flight_esm)
extern inline function createStorageSignals():StorageSignals {
	return flight._js._fn.Preferences.createStorageSignals();
}
#else
extern inline function createStorageSignals():StorageSignals {
#if hl
	return flight._hl._fn.Preferences.createStorageSignals();
#elseif cpp
	return flight._cpp._fn.Preferences.createStorageSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.createStorageSignals();
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachStorage(hostPreferencesChange:HostPreferencesChangeCapability, signals:StorageSignals):Bool {
	return flight._js._fn.Preferences.attachStorage(hostPreferencesChange, signals);
}
#else
extern inline function attachStorage(hostPreferencesChange:HostPreferencesChangeCapability, signals:StorageSignals):Bool {
#if hl
	return flight._hl._fn.Preferences.attachStorage(hostPreferencesChange, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.attachStorage(hostPreferencesChange, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.attachStorage(hostPreferencesChange, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearStorage(hostPreferences:HostPreferencesCapability, signals:Null<StorageSignals>):StorageClearResult {
	return flight._js._fn.Preferences.clearStorage(hostPreferences, signals);
}
#else
extern inline function clearStorage(hostPreferences:HostPreferencesCapability, signals:StorageSignals):StorageClearResult {
#if hl
	return flight._hl._fn.Preferences.clearStorage(hostPreferences, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.clearStorage(hostPreferences, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.clearStorage(hostPreferences, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearStorageNamespace(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, signals:Null<StorageSignals>):StorageClearNamespaceResult {
	return flight._js._fn.Preferences.clearStorageNamespace(hostPreferences, namespace, signals);
}
#else
extern inline function clearStorageNamespace(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, signals:StorageSignals):StorageClearNamespaceResult {
#if hl
	return flight._hl._fn.Preferences.clearStorageNamespace(hostPreferences, namespace, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.clearStorageNamespace(hostPreferences, namespace, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.clearStorageNamespace(hostPreferences, namespace, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyStorage(hostPreferencesChange:HostPreferencesChangeCapability):Void {
	flight._js._fn.Preferences.destroyStorage(hostPreferencesChange);
}
#else
extern inline function destroyStorage(hostPreferencesChange:HostPreferencesChangeCapability):Void {
#if hl
	flight._hl._fn.Preferences.destroyStorage(hostPreferencesChange);
#elseif cpp
	flight._cpp._fn.Preferences.destroyStorage(hostPreferencesChange);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.destroyStorage(hostPreferencesChange);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachStorage(signals:StorageSignals):Void {
	flight._js._fn.Preferences.detachStorage(signals);
}
#else
extern inline function detachStorage(signals:StorageSignals):Void {
#if hl
	flight._hl._fn.Preferences.detachStorage(signals);
#elseif cpp
	flight._cpp._fn.Preferences.detachStorage(signals);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.detachStorage(signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeStorage(signals:StorageSignals):Void {
	flight._js._fn.Preferences.disposeStorage(signals);
}
#else
extern inline function disposeStorage(signals:StorageSignals):Void {
#if hl
	flight._hl._fn.Preferences.disposeStorage(signals);
#elseif cpp
	flight._cpp._fn.Preferences.disposeStorage(signals);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.disposeStorage(signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNamespacedStorageByteSize(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageByteSizeResult {
	return flight._js._fn.Preferences.getNamespacedStorageByteSize(hostPreferences, namespace);
}
#else
extern inline function getNamespacedStorageByteSize(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageByteSizeResult {
#if hl
	return flight._hl._fn.Preferences.getNamespacedStorageByteSize(hostPreferences, namespace);
#elseif cpp
	return flight._cpp._fn.Preferences.getNamespacedStorageByteSize(hostPreferences, namespace);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getNamespacedStorageByteSize(hostPreferences, namespace);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNamespacedStorageEntries(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageEntriesResult {
	return flight._js._fn.Preferences.getNamespacedStorageEntries(hostPreferences, namespace);
}
#else
extern inline function getNamespacedStorageEntries(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageEntriesResult {
#if hl
	return flight._hl._fn.Preferences.getNamespacedStorageEntries(hostPreferences, namespace);
#elseif cpp
	return flight._cpp._fn.Preferences.getNamespacedStorageEntries(hostPreferences, namespace);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getNamespacedStorageEntries(hostPreferences, namespace);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String):StorageGetItemResult {
	return flight._js._fn.Preferences.getNamespacedStorageItem(hostPreferences, namespace, key);
}
#else
extern inline function getNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String):StorageGetItemResult {
#if hl
	return flight._hl._fn.Preferences.getNamespacedStorageItem(hostPreferences, namespace, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getNamespacedStorageItem(hostPreferences, namespace, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getNamespacedStorageItem(hostPreferences, namespace, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNamespacedStorageItemPresence(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String):StoragePresenceResult {
	return flight._js._fn.Preferences.getNamespacedStorageItemPresence(hostPreferences, namespace, key);
}
#else
extern inline function getNamespacedStorageItemPresence(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String):StoragePresenceResult {
#if hl
	return flight._hl._fn.Preferences.getNamespacedStorageItemPresence(hostPreferences, namespace, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getNamespacedStorageItemPresence(hostPreferences, namespace, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getNamespacedStorageItemPresence(hostPreferences, namespace, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNamespacedStorageKeys(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageKeysResult {
	return flight._js._fn.Preferences.getNamespacedStorageKeys(hostPreferences, namespace);
}
#else
extern inline function getNamespacedStorageKeys(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace):StorageKeysResult {
#if hl
	return flight._hl._fn.Preferences.getNamespacedStorageKeys(hostPreferences, namespace);
#elseif cpp
	return flight._cpp._fn.Preferences.getNamespacedStorageKeys(hostPreferences, namespace);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getNamespacedStorageKeys(hostPreferences, namespace);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageBoolean(hostPreferences:HostPreferencesCapability, key:String):StorageBooleanResult {
	return flight._js._fn.Preferences.getStorageBoolean(hostPreferences, key);
}
#else
extern inline function getStorageBoolean(hostPreferences:HostPreferencesCapability, key:String):StorageBooleanResult {
#if hl
	return flight._hl._fn.Preferences.getStorageBoolean(hostPreferences, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageBoolean(hostPreferences, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageBoolean(hostPreferences, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageBooleanOr(hostPreferences:HostPreferencesCapability, key:String, fallback:Bool):StorageBooleanOrResult {
	return flight._js._fn.Preferences.getStorageBooleanOr(hostPreferences, key, fallback);
}
#else
extern inline function getStorageBooleanOr(hostPreferences:HostPreferencesCapability, key:String, fallback:Bool):StorageBooleanOrResult {
#if hl
	return flight._hl._fn.Preferences.getStorageBooleanOr(hostPreferences, cast key, fallback);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageBooleanOr(hostPreferences, cast key, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageBooleanOr(hostPreferences, key, fallback);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageByteSize(hostPreferences:HostPreferencesCapability):StorageByteSizeResult {
	return flight._js._fn.Preferences.getStorageByteSize(hostPreferences);
}
#else
extern inline function getStorageByteSize(hostPreferences:HostPreferencesCapability):StorageByteSizeResult {
#if hl
	return flight._hl._fn.Preferences.getStorageByteSize(hostPreferences);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageByteSize(hostPreferences);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageByteSize(hostPreferences);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageEntries(hostPreferences:HostPreferencesCapability):StorageEntriesResult {
	return flight._js._fn.Preferences.getStorageEntries(hostPreferences);
}
#else
extern inline function getStorageEntries(hostPreferences:HostPreferencesCapability):StorageEntriesResult {
#if hl
	return flight._hl._fn.Preferences.getStorageEntries(hostPreferences);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageEntries(hostPreferences);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageEntries(hostPreferences);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageItem(hostPreferences:HostPreferencesCapability, key:String):StorageGetItemResult {
	return flight._js._fn.Preferences.getStorageItem(hostPreferences, key);
}
#else
extern inline function getStorageItem(hostPreferences:HostPreferencesCapability, key:String):StorageGetItemResult {
#if hl
	return flight._hl._fn.Preferences.getStorageItem(hostPreferences, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageItem(hostPreferences, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageItem(hostPreferences, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageItemCount(hostPreferences:HostPreferencesCapability):StorageItemCountResult {
	return flight._js._fn.Preferences.getStorageItemCount(hostPreferences);
}
#else
extern inline function getStorageItemCount(hostPreferences:HostPreferencesCapability):StorageItemCountResult {
#if hl
	return flight._hl._fn.Preferences.getStorageItemCount(hostPreferences);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageItemCount(hostPreferences);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageItemCount(hostPreferences);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageItemOr(hostPreferences:HostPreferencesCapability, key:String, fallback:String):StorageItemOrResult {
	return flight._js._fn.Preferences.getStorageItemOr(hostPreferences, key, fallback);
}
#else
extern inline function getStorageItemOr(hostPreferences:HostPreferencesCapability, key:String, fallback:String):StorageItemOrResult {
#if hl
	return flight._hl._fn.Preferences.getStorageItemOr(hostPreferences, cast key, cast fallback);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageItemOr(hostPreferences, cast key, cast fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageItemOr(hostPreferences, key, fallback);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageItemPresence(hostPreferences:HostPreferencesCapability, key:String):StoragePresenceResult {
	return flight._js._fn.Preferences.getStorageItemPresence(hostPreferences, key);
}
#else
extern inline function getStorageItemPresence(hostPreferences:HostPreferencesCapability, key:String):StoragePresenceResult {
#if hl
	return flight._hl._fn.Preferences.getStorageItemPresence(hostPreferences, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageItemPresence(hostPreferences, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageItemPresence(hostPreferences, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageItems(hostPreferences:HostPreferencesCapability, keys:Dynamic):StorageItemsResult {
	return flight._js._fn.Preferences.getStorageItems(hostPreferences, keys);
}
#else
extern inline function getStorageItems(hostPreferences:HostPreferencesCapability, keys:Dynamic, keysLen:Int):StorageItemsResult {
#if hl
	return flight._hl._fn.Preferences.getStorageItems(hostPreferences, keys, keysLen);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageItems(hostPreferences, keys, keysLen);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageItems(hostPreferences, keys, keysLen);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageKeys(hostPreferences:HostPreferencesCapability):StorageKeysResult {
	return flight._js._fn.Preferences.getStorageKeys(hostPreferences);
}
#else
extern inline function getStorageKeys(hostPreferences:HostPreferencesCapability):StorageKeysResult {
#if hl
	return flight._hl._fn.Preferences.getStorageKeys(hostPreferences);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageKeys(hostPreferences);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageKeys(hostPreferences);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageNumber(hostPreferences:HostPreferencesCapability, key:String):StorageNumberResult {
	return flight._js._fn.Preferences.getStorageNumber(hostPreferences, key);
}
#else
extern inline function getStorageNumber(hostPreferences:HostPreferencesCapability, key:String):StorageNumberResult {
#if hl
	return flight._hl._fn.Preferences.getStorageNumber(hostPreferences, cast key);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageNumber(hostPreferences, cast key);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageNumber(hostPreferences, key);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getStorageNumberOr(hostPreferences:HostPreferencesCapability, key:String, fallback:Float):StorageNumberOrResult {
	return flight._js._fn.Preferences.getStorageNumberOr(hostPreferences, key, fallback);
}
#else
extern inline function getStorageNumberOr(hostPreferences:HostPreferencesCapability, key:String, fallback:Float):StorageNumberOrResult {
#if hl
	return flight._hl._fn.Preferences.getStorageNumberOr(hostPreferences, cast key, fallback);
#elseif cpp
	return flight._cpp._fn.Preferences.getStorageNumberOr(hostPreferences, cast key, fallback);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.getStorageNumberOr(hostPreferences, key, fallback);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String, signals:Null<StorageSignals>):StorageRemoveItemResult {
	return flight._js._fn.Preferences.removeNamespacedStorageItem(hostPreferences, namespace, key, signals);
}
#else
extern inline function removeNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String, signals:StorageSignals):StorageRemoveItemResult {
#if hl
	return flight._hl._fn.Preferences.removeNamespacedStorageItem(hostPreferences, namespace, cast key, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.removeNamespacedStorageItem(hostPreferences, namespace, cast key, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.removeNamespacedStorageItem(hostPreferences, namespace, key, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeStorageItem(hostPreferences:HostPreferencesCapability, key:String, signals:Null<StorageSignals>):StorageRemoveItemResult {
	return flight._js._fn.Preferences.removeStorageItem(hostPreferences, key, signals);
}
#else
extern inline function removeStorageItem(hostPreferences:HostPreferencesCapability, key:String, signals:StorageSignals):StorageRemoveItemResult {
#if hl
	return flight._hl._fn.Preferences.removeStorageItem(hostPreferences, cast key, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.removeStorageItem(hostPreferences, cast key, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.removeStorageItem(hostPreferences, key, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeStorageItems(hostPreferences:HostPreferencesCapability, keys:Dynamic, signals:Null<StorageSignals>):StorageRemoveItemsResult {
	return flight._js._fn.Preferences.removeStorageItems(hostPreferences, keys, signals);
}
#else
extern inline function removeStorageItems(hostPreferences:HostPreferencesCapability, keys:Dynamic, keysLen:Int, signals:StorageSignals):StorageRemoveItemsResult {
#if hl
	return flight._hl._fn.Preferences.removeStorageItems(hostPreferences, keys, keysLen, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.removeStorageItems(hostPreferences, keys, keysLen, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.removeStorageItems(hostPreferences, keys, keysLen, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String, value:String, signals:Null<StorageSignals>):StorageSetItemResult {
	return flight._js._fn.Preferences.setNamespacedStorageItem(hostPreferences, namespace, key, value, signals);
}
#else
extern inline function setNamespacedStorageItem(hostPreferences:HostPreferencesCapability, namespace:StorageNamespace, key:String, value:String, signals:StorageSignals):StorageSetItemResult {
#if hl
	return flight._hl._fn.Preferences.setNamespacedStorageItem(hostPreferences, namespace, cast key, cast value, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.setNamespacedStorageItem(hostPreferences, namespace, cast key, cast value, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.setNamespacedStorageItem(hostPreferences, namespace, key, value, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStorageBoolean(hostPreferences:HostPreferencesCapability, key:String, value:Bool, signals:Null<StorageSignals>):StorageSetItemResult {
	return flight._js._fn.Preferences.setStorageBoolean(hostPreferences, key, value, signals);
}
#else
extern inline function setStorageBoolean(hostPreferences:HostPreferencesCapability, key:String, value:Bool, signals:StorageSignals):StorageSetItemResult {
#if hl
	return flight._hl._fn.Preferences.setStorageBoolean(hostPreferences, cast key, value, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.setStorageBoolean(hostPreferences, cast key, value, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.setStorageBoolean(hostPreferences, key, value, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStorageItem(hostPreferences:HostPreferencesCapability, key:String, value:String, signals:Null<StorageSignals>):StorageSetItemResult {
	return flight._js._fn.Preferences.setStorageItem(hostPreferences, key, value, signals);
}
#else
extern inline function setStorageItem(hostPreferences:HostPreferencesCapability, key:String, value:String, signals:StorageSignals):StorageSetItemResult {
#if hl
	return flight._hl._fn.Preferences.setStorageItem(hostPreferences, cast key, cast value, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.setStorageItem(hostPreferences, cast key, cast value, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.setStorageItem(hostPreferences, key, value, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setStorageItems(hostPreferences:HostPreferencesCapability, record:Dynamic, signals:Null<StorageSignals>):StorageSetItemsResult {
	return flight._js._fn.Preferences.setStorageItems(hostPreferences, record, signals);
}
#end
#if (js && flight_esm)
extern inline function setStorageNumber(hostPreferences:HostPreferencesCapability, key:String, value:Float, signals:Null<StorageSignals>):StorageSetItemResult {
	return flight._js._fn.Preferences.setStorageNumber(hostPreferences, key, value, signals);
}
#else
extern inline function setStorageNumber(hostPreferences:HostPreferencesCapability, key:String, value:Float, signals:StorageSignals):StorageSetItemResult {
#if hl
	return flight._hl._fn.Preferences.setStorageNumber(hostPreferences, cast key, value, signals);
#elseif cpp
	return flight._cpp._fn.Preferences.setStorageNumber(hostPreferences, cast key, value, signals);
#elseif (js && flight_esm)
	return flight._js._fn.Preferences.setStorageNumber(hostPreferences, key, value, signals);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageSignals(ptr:StorageSignals):Void {
	flight._js._fn.Preferences.freeStorageSignals(ptr);
}
#else
extern inline function freeStorageSignals(ptr:StorageSignals):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageSignals(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageSignals(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageClearResult(ptr:StorageClearResult):Void {
	flight._js._fn.Preferences.freeStorageClearResult(ptr);
}
#else
extern inline function freeStorageClearResult(ptr:StorageClearResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageClearResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageClearResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageClearResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageClearNamespaceResult(ptr:StorageClearNamespaceResult):Void {
	flight._js._fn.Preferences.freeStorageClearNamespaceResult(ptr);
}
#else
extern inline function freeStorageClearNamespaceResult(ptr:StorageClearNamespaceResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageClearNamespaceResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageClearNamespaceResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageClearNamespaceResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageByteSizeResult(ptr:StorageByteSizeResult):Void {
	flight._js._fn.Preferences.freeStorageByteSizeResult(ptr);
}
#else
extern inline function freeStorageByteSizeResult(ptr:StorageByteSizeResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageByteSizeResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageByteSizeResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageByteSizeResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageEntriesResult(ptr:StorageEntriesResult):Void {
	flight._js._fn.Preferences.freeStorageEntriesResult(ptr);
}
#else
extern inline function freeStorageEntriesResult(ptr:StorageEntriesResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageEntriesResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageEntriesResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageEntriesResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageGetItemResult(ptr:StorageGetItemResult):Void {
	flight._js._fn.Preferences.freeStorageGetItemResult(ptr);
}
#else
extern inline function freeStorageGetItemResult(ptr:StorageGetItemResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageGetItemResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageGetItemResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageGetItemResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStoragePresenceResult(ptr:StoragePresenceResult):Void {
	flight._js._fn.Preferences.freeStoragePresenceResult(ptr);
}
#else
extern inline function freeStoragePresenceResult(ptr:StoragePresenceResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStoragePresenceResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStoragePresenceResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStoragePresenceResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageKeysResult(ptr:StorageKeysResult):Void {
	flight._js._fn.Preferences.freeStorageKeysResult(ptr);
}
#else
extern inline function freeStorageKeysResult(ptr:StorageKeysResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageKeysResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageKeysResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageKeysResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageBooleanResult(ptr:StorageBooleanResult):Void {
	flight._js._fn.Preferences.freeStorageBooleanResult(ptr);
}
#else
extern inline function freeStorageBooleanResult(ptr:StorageBooleanResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageBooleanResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageBooleanResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageBooleanResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageBooleanOrResult(ptr:StorageBooleanOrResult):Void {
	flight._js._fn.Preferences.freeStorageBooleanOrResult(ptr);
}
#else
extern inline function freeStorageBooleanOrResult(ptr:StorageBooleanOrResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageBooleanOrResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageBooleanOrResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageBooleanOrResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageItemCountResult(ptr:StorageItemCountResult):Void {
	flight._js._fn.Preferences.freeStorageItemCountResult(ptr);
}
#else
extern inline function freeStorageItemCountResult(ptr:StorageItemCountResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageItemCountResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageItemCountResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageItemCountResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageItemOrResult(ptr:StorageItemOrResult):Void {
	flight._js._fn.Preferences.freeStorageItemOrResult(ptr);
}
#else
extern inline function freeStorageItemOrResult(ptr:StorageItemOrResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageItemOrResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageItemOrResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageItemOrResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageItemsResult(ptr:StorageItemsResult):Void {
	flight._js._fn.Preferences.freeStorageItemsResult(ptr);
}
#else
extern inline function freeStorageItemsResult(ptr:StorageItemsResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageItemsResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageItemsResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageItemsResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageNumberResult(ptr:StorageNumberResult):Void {
	flight._js._fn.Preferences.freeStorageNumberResult(ptr);
}
#else
extern inline function freeStorageNumberResult(ptr:StorageNumberResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageNumberResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageNumberResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageNumberResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageNumberOrResult(ptr:StorageNumberOrResult):Void {
	flight._js._fn.Preferences.freeStorageNumberOrResult(ptr);
}
#else
extern inline function freeStorageNumberOrResult(ptr:StorageNumberOrResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageNumberOrResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageNumberOrResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageNumberOrResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageRemoveItemResult(ptr:StorageRemoveItemResult):Void {
	flight._js._fn.Preferences.freeStorageRemoveItemResult(ptr);
}
#else
extern inline function freeStorageRemoveItemResult(ptr:StorageRemoveItemResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageRemoveItemResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageRemoveItemResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageRemoveItemResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageRemoveItemsResult(ptr:StorageRemoveItemsResult):Void {
	flight._js._fn.Preferences.freeStorageRemoveItemsResult(ptr);
}
#else
extern inline function freeStorageRemoveItemsResult(ptr:StorageRemoveItemsResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageRemoveItemsResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageRemoveItemsResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageRemoveItemsResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageSetItemResult(ptr:StorageSetItemResult):Void {
	flight._js._fn.Preferences.freeStorageSetItemResult(ptr);
}
#else
extern inline function freeStorageSetItemResult(ptr:StorageSetItemResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageSetItemResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageSetItemResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageSetItemResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeStorageSetItemsResult(ptr:StorageSetItemsResult):Void {
	flight._js._fn.Preferences.freeStorageSetItemsResult(ptr);
}
#else
extern inline function freeStorageSetItemsResult(ptr:StorageSetItemsResult):Void {
#if hl
	flight._hl._fn.Preferences.freeStorageSetItemsResult(ptr);
#elseif cpp
	flight._cpp._fn.Preferences.freeStorageSetItemsResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Preferences.freeStorageSetItemsResult(ptr);
#else
	#error "flight.Preferences: no backend for this target."
#end
}
#end
