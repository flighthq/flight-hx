package flight.esm.types.preferences_contract;

#if (js && flight_esm)
typedef HostPreferencesCapabilities = { ?change:Null<flight.esm.types.preferences_contract.Types.HostPreferencesChangeCapability>, ?local:Null<flight.esm.types.preferences_contract.Types.HostPreferencesCapability>, ?persistenceQuery:Null<flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceQueryCapability>, ?persistenceRequest:Null<flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceRequestCapability> };

typedef HostPreferencesCapability = { clear:(() -> flight.esm.types.preferences_contract.Types.StorageClearResult), getItem:((key:String) -> flight.esm.types.preferences_contract.Types.StorageGetItemResult), keys:(() -> flight.esm.types.preferences_contract.Types.StorageKeysResult), removeItem:((key:String) -> flight.esm.types.preferences_contract.Types.StorageRemoveItemResult), setItem:((key:String, value:String) -> flight.esm.types.preferences_contract.Types.StorageSetItemResult) };

typedef HostPreferencesChangeCapability = { destroy:(() -> Void), subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostPreferencesPersistenceQueryCapability = { getPersistence:(() -> js.lib.Promise<flight.esm.types.preferences_contract.Types.StoragePersistenceOutcome>) };

typedef HostPreferencesPersistenceRequestCapability = { requestPersistence:(() -> js.lib.Promise<flight.esm.types.preferences_contract.Types.StoragePersistenceOutcome>) };

typedef StorageBatchMutationOutcome<FailureReason> = Dynamic;

typedef StorageBooleanOrResult = Dynamic;

typedef StorageBooleanResult = Dynamic;

typedef StorageByteSizeResult = Dynamic;

typedef StorageChange = { key:Null<String>, newValue:Null<String>, oldValue:Null<String> };

typedef StorageClearFailureReason = String;

typedef StorageClearNamespaceResult = Dynamic;

typedef StorageClearResult = Dynamic;

typedef StorageEntriesResult = Dynamic;

typedef StorageFallbackOutcome<Value> = Dynamic;

typedef StorageGetItemFailureReason = String;

typedef StorageGetItemResult = Dynamic;

typedef StorageItemCountResult = Dynamic;

typedef StorageItemOrResult = Dynamic;

typedef StorageItemsResult = Dynamic;

typedef StorageJsonOrResult<Value> = Dynamic;

typedef StorageJsonResult<Value> = Dynamic;

typedef StorageJsonWriteResult = Dynamic;

typedef StorageKeysFailureReason = flight.esm.types.preferences_contract.Types.StorageGetItemFailureReason;

typedef StorageKeysResult = Dynamic;

typedef StorageMigration = { migrate:((prefix:Null<String>) -> Void), version:Float };

typedef StorageMigrationOutcome = Dynamic;

typedef StorageMutationOutcome<FailureReason> = Dynamic;

typedef StorageNamespace = { prefix:String };

typedef StorageNumberOrResult = Dynamic;

typedef StorageNumberResult = Dynamic;

typedef StoragePersistenceOutcome = { outcome:String, permissionState:Null<String> };

typedef StoragePresenceResult = Dynamic;

typedef StorageQueryOutcome<Value> = Dynamic;

typedef StorageReadFailureReason = String;

typedef StorageRemoveItemFailureReason = String;

typedef StorageRemoveItemResult = Dynamic;

typedef StorageRemoveItemsResult = Dynamic;

typedef StorageSetItemFailureReason = String;

typedef StorageSetItemResult = Dynamic;

typedef StorageSetItemsResult = Dynamic;

typedef StorageSignals = { onChange:flight.esm.types.signals.Types.Signal<flight.esm.types.preferences_contract.Types.StorageChange> };

typedef StorageValueOutcome<Value, FailureReason> = Dynamic;

typedef StorageWriteFailureReason = String;

typedef WebWindowStoragePersistenceApi = { persist:(() -> js.lib.Promise<Bool>), getPermissionState:(() -> js.lib.Promise<String>), persisted:(() -> js.lib.Promise<Bool>) };

typedef WebWindowStoragePersistenceCapabilities = { persistenceQuery:flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceQueryCapability, persistenceRequest:flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceRequestCapability };

typedef WebWorkerStoragePersistenceApi = { getPermissionState:(() -> js.lib.Promise<String>), persisted:(() -> js.lib.Promise<Bool>) };

typedef WebWorkerStoragePersistenceCapabilities = { persistenceQuery:flight.esm.types.preferences_contract.Types.HostPreferencesPersistenceQueryCapability };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
