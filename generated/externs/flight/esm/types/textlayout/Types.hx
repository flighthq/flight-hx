package flight.esm.types.textlayout;

#if (js && flight_esm)
typedef RichTextContent = { formatRanges:Array<flight.esm.types.textformat.Types.TextFormatRangeRaw>, text:String };

typedef TextAutoSize = String;

typedef TextBoundsSpec = Dynamic;

typedef TextJustification = String;

typedef TextLayoutGroup = { ascent:Float, descent:Float, endIndex:Float, format:flight.esm.types.textformat.Types.TextFormat, height:Float, leading:Float, lineIndex:Float, offsetX:Float, offsetY:Float, positions:Array<Float>, startIndex:Float, width:Float };

typedef TextLayoutParams = { ?autoSize:Null<String>, ?border:Null<Bool>, ?direction:Null<String>, formatRanges:Array<flight.esm.types.textformat.Types.TextFormatRangeRaw>, height:Float, ?justification:Null<String>, ?maxLines:Null<Float>, measure:flight.esm.types.textshaper.Types.TextMeasureFunction, ?multiline:Null<Bool>, text:String, ?truncationCharacter:Null<String>, ?verticalAlign:Null<String>, width:Float, ?wordWrap:Null<Bool> };

typedef TextLayoutResult = { groups:Array<flight.esm.types.textlayout.Types.TextLayoutGroup>, lineAscents:Array<Float>, lineDescents:Array<Float>, lineHeights:Array<Float>, lineLeadings:Array<Float>, lineWidths:Array<Float>, numLines:Float, textHeight:Float, textWidth:Float };

typedef TextLineMetrics = { ascent:Float, descent:Float, height:Float, leading:Float, width:Float, x:Float };

typedef TextMetrics = { height:Float, numLines:Float, width:Float };

typedef TextSelectionRectangle = { height:Float, lineIndex:Float, width:Float, x:Float, y:Float };

typedef TextVerticalAlign = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
