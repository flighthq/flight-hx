package flight.esm.types.share_contract;

#if (js && flight_esm)
typedef CapacitorShareContentOptions = { ?chooserTitle:Null<String> };

typedef HostCapacitorShareContentCapability = { shareContent:((content:flight.esm.types.share_contract.Types.ShareContent, ?options:Null<flight.esm.types.share_contract.Types.CapacitorShareContentOptions>) -> js.lib.Promise<Bool>), shareContentWithResult:((content:flight.esm.types.share_contract.Types.ShareContent, ?options:Null<flight.esm.types.share_contract.Types.CapacitorShareContentOptions>) -> js.lib.Promise<flight.esm.types.share_contract.Types.ShareResult>), canShareContent:((content:flight.esm.types.share_contract.Types.ShareContent) -> Bool) };

typedef HostShareContentCapability = { canShareContent:((content:flight.esm.types.share_contract.Types.ShareContent) -> Bool), shareContent:((content:flight.esm.types.share_contract.Types.ShareContent) -> js.lib.Promise<Bool>), shareContentWithResult:((content:flight.esm.types.share_contract.Types.ShareContent) -> js.lib.Promise<flight.esm.types.share_contract.Types.ShareResult>) };

typedef HostShareFilesCapability = { canShareContent:((content:flight.esm.types.share_contract.Types.ShareFilesContent) -> Bool), shareContent:((content:flight.esm.types.share_contract.Types.ShareFilesContent) -> js.lib.Promise<Bool>), shareContentWithResult:((content:flight.esm.types.share_contract.Types.ShareFilesContent) -> js.lib.Promise<flight.esm.types.share_contract.Types.ShareResult>) };

typedef ShareContent = Dynamic;

typedef ShareFile = { name:String, mimeType:String, dataUrl:String };

typedef ShareFilesContent = { files:Array<flight.esm.types.share_contract.Types.ShareFile>, ?text:Null<String>, ?title:Null<String>, ?url:Null<String> };

typedef ShareResult = { completed:Bool, activityType:Null<String>, dismissed:Bool };

typedef ShareSignals = { onShareResult:flight.esm.types.signals.Types.Signal<flight.esm.types.share_contract.Types.ShareResult> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
