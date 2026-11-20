package flight.esm.types.swf_contract;

#if (js && flight_esm)
@:jsRequire("@flighthq/swf/contract", "ShapeWriter")
extern class ShapeWriter {
  public function new();
  public function toBytes():js.lib.Uint8Array;
  public function toReader():flight.esm.types.swf_contract.Types.SwfReader;
  public function writeByte(value:Float):Void;
  public function writeCurvedEdge(controlX:Float, controlY:Float, anchorX:Float, anchorY:Float):Void;
  public function writeEndShape():Void;
  public function writeFillStyleCount(count:Float):Void;
  public function writeGradient(records:Array<Dynamic>):Void;
  public function writeBitmapFillStyle(type:Float, characterId:Float, scale:Float):Void;
  public function writeScaleMatrix(scale:Float):Void;
  public function writeIdentityMatrix(translateX:Float, translateY:Float):Void;
  public function writeZeroScaleMatrix():Void;
  public function writeLineStyleCount(count:Float):Void;
  public function writeSolidFillStyles(colors:Array<Float>):Void;
  public function writeStraightEdge(deltaX:Float, deltaY:Float):Void;
  public function writeNewStylesRecord():Void;
  public function writeStyleBits(fillBits:Float, lineBits:Float):Void;
  public function writeStyleChange(change:Dynamic, ?bits:Float):Void;
  public function writeUint16(value:Float):Void;
}

@:jsRequire("@flighthq/swf/contract", "SwfBitWriter")
extern class SwfBitWriter {
  public function new();
  public function toBytes():js.lib.Uint8Array;
  public function writeSigned(value:Float, count:Float):Void;
  public function writeUnsigned(value:Float, count:Float):Void;
}

typedef SwfContentCapabilities = flight.esm.types.swf.Types.SwfContentCapabilities;

typedef SwfDocumentImport = flight.esm.types.swf.Types.SwfDocumentImport;

typedef SwfFilterListGuard = flight.esm.types.swf.Types.SwfFilterListGuard;

typedef SwfHeader = flight.esm.types.swf.Types.SwfHeader;

typedef SwfJpegAlphaPayload = flight.esm.types.swf.Types.SwfJpegAlphaPayload;

typedef SwfMorphShapePaths = flight.esm.types.swf.Types.SwfMorphShapePaths;

typedef SwfNodeAppearance = flight.esm.types.swf.Types.SwfNodeAppearance;

typedef SwfParseOptions = flight.esm.types.swf.Types.SwfParseOptions;

@:jsRequire("@flighthq/swf/contract", "SwfReader")
extern class SwfReader {
  public function new(source:js.lib.Uint8Array, start:Float, end:Float);
  public final bitPosition:Float;
  public final pos:Float;
  public final valid:Bool;
  public final source:js.lib.Uint8Array;
  public final end:Float;
  public function alignToByte():Void;
  public function readEncodedUint32():Float;
  public function readFixed8():Float;
  public function readSignedBits(count:Float):Float;
  public function readString():String;
  public function readUint8():Float;
  public function readUint16():Float;
  public function readUint32():Float;
  public function readUnsignedBits(count:Float):Float;
}

typedef SwfTagHandler = flight.esm.types.swf.Types.SwfTagHandler;

typedef SwfTagHandlerDispatch = flight.esm.types.swf.Types.SwfTagHandlerDispatch;

typedef SwfTagHandlerInstantiation = flight.esm.types.swf.Types.SwfTagHandlerInstantiation;

typedef SwfTagHandlerResources = flight.esm.types.swf.Types.SwfTagHandlerResources;

typedef SwfTagMatrix = flight.esm.types.swf.Types.SwfTagMatrix;

typedef SwfTagParseResult = flight.esm.types.swf.Types.SwfTagParseResult;

typedef SwfTagParseState = flight.esm.types.swf.Types.SwfTagParseState;

typedef SwfTagPlacement = flight.esm.types.swf.Types.SwfTagPlacement;

typedef SwfTagReader = flight.esm.types.swf.Types.SwfTagReader;

typedef SwfTagRectangle = flight.esm.types.swf.Types.SwfTagRectangle;

typedef SwfTagTimelineState = flight.esm.types.swf.Types.SwfTagTimelineState;

typedef SwfTimeline = flight.esm.types.swf.Types.SwfTimeline;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
