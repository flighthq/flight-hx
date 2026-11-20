package flight.esm.types.text_markup_contract;

#if (js && flight_esm)
typedef MarkupClassResolver = ((className:String) -> Dynamic);

typedef MarkupColorResolver = ((value:String) -> Null<Float>);

typedef MarkupResolverSeams = { ?classResolver:Null<flight.esm.types.text_markup_contract.Types.MarkupClassResolver>, ?colorResolver:Null<flight.esm.types.text_markup_contract.Types.MarkupColorResolver> };

typedef MarkupTagEffect = { ?breakBefore:Null<Bool>, ?format:Dynamic, ?text:Null<String> };

typedef MarkupTagHandler = ((attributes:Dynamic, enclosingFormat:flight.esm.types.textformat.Types.TextFormat) -> flight.esm.types.text_markup_contract.Types.MarkupTagResult);

typedef MarkupTagRegistry = { ?classResolver:Null<flight.esm.types.text_markup_contract.Types.MarkupClassResolver>, ?colorResolver:Null<flight.esm.types.text_markup_contract.Types.MarkupColorResolver>, handlers:js.lib.Map<String, flight.esm.types.text_markup_contract.Types.MarkupTagHandler> };

typedef MarkupTagResult = Dynamic;

typedef TextMarkupClock = (() -> Float);

typedef TextMarkupExplanation = { issues:Array<flight.esm.types.text_markup_contract.Types.TextMarkupIssue> };

typedef TextMarkupGuard = ((issue:flight.esm.types.text_markup_contract.Types.TextMarkupIssue) -> Void);

typedef TextMarkupGuardState = { ?guard:Null<flight.esm.types.text_markup_contract.Types.TextMarkupGuard> };

typedef TextMarkupIssue = { kind:flight.esm.types.text_markup_contract.Types.TextMarkupIssueKind, offset:Float, tag:String, value:Null<String> };

typedef TextMarkupIssueKind = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
