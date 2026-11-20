package flight.esm.share;

#if (js && flight_esm)
@:jsRequire("@flighthq/share/contract")
extern class Contract {
  public static function attachShareSignals(signals:flight.esm.types.share_contract.Types.ShareSignals):Void;
  public static function canShareContent(hostShareContent:flight.esm.types.share_contract.Types.HostShareContentCapability, content:flight.esm.types.share_contract.Types.ShareContent):Bool;
  public static function canShareFiles(hostShareFiles:flight.esm.types.share_contract.Types.HostShareFilesCapability, files:Array<flight.esm.types.share_contract.Types.ShareFile>):Bool;
  public static function detachShareSignals(signals:flight.esm.types.share_contract.Types.ShareSignals):Void;
  public static function disposeShareSignals(signals:flight.esm.types.share_contract.Types.ShareSignals):Void;
  public static function enableShareSignals():flight.esm.types.share_contract.Types.ShareSignals;
  public static function hasShareContentFields(content:flight.esm.types.share_contract.Types.ShareContent):Bool;
  public static function initializeShareSignals(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.share_contract.Types.ShareSignals>):Void;
  public static function isShareFileValid(file:flight.esm.types.share_contract.Types.ShareFile):Bool;
  public static function shareContent(hostShareContent:flight.esm.types.share_contract.Types.HostShareContentCapability, content:flight.esm.types.share_contract.Types.ShareContent):js.lib.Promise<Bool>;
  public static function shareContentWithResult(hostShareContent:flight.esm.types.share_contract.Types.HostShareContentCapability, content:flight.esm.types.share_contract.Types.ShareContent):js.lib.Promise<flight.esm.types.share_contract.Types.ShareResult>;
  public static function shareFiles(hostShareFiles:flight.esm.types.share_contract.Types.HostShareFilesCapability, files:Array<flight.esm.types.share_contract.Types.ShareFile>):js.lib.Promise<Bool>;
  public static function shareText(hostShareContent:flight.esm.types.share_contract.Types.HostShareContentCapability, text:String):js.lib.Promise<Bool>;
  public static function shareUrl(hostShareContent:flight.esm.types.share_contract.Types.HostShareContentCapability, url:String):js.lib.Promise<Bool>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
