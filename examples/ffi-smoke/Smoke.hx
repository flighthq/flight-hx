import flight.Math;
import flight.Geometry;
import flight.Bitmap;
import flight.Scene2D;
import flight.Node;
import flight.Compression;

class Smoke {
  static inline function bytePointer(bytes:haxe.io.Bytes)
    #if cpp
    return cpp.Pointer.ofArray(bytes.getData()).raw;
    #else
    return bytes.getData().bytes;
    #end

  public static function main() {
    if (lerp(0, 10, 0.25) != 2.5) throw 'lerp failed';
    final v = createVector2(3, 4);
    if (getVector2Length(v) != 5) throw 'vector length failed';
    v.x = 6;
    if (v.x != 6) throw 'vector field access failed';
    freeVector2(v);
    final rectangle = flight.Geometry.createRectangle(1, 2, 3, 4);
    if (rectangle.width != 3) throw 'rectangle allocation failed';
    flight.Geometry.freeRectangle(rectangle);
    final m = createMatrix4FromValues(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
    for (row in 0...4) for (column in 0...4) {
      if (getMatrix4Element(m, row, column) != column * 4 + row + 1)
        throw 'matrix constructor arguments corrupted';
    }
    setMatrix4(m, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32);
    for (row in 0...4) for (column in 0...4) {
      if (getMatrix4Element(m, row, column) != column * 4 + row + 17)
        throw 'matrix setter arguments corrupted';
    }
    freeMatrix4(m);
    final bitmap = createBitmap(2, 2, 0x11223344);
    if (getBitmapPixel(bitmap, 0, 0) != 0x11223344) throw 'bitmap allocation failed';
    setBitmapPixel(bitmap, 0, 0, 0x55667711);
    final sharedBitmap = shareBitmap(bitmap);
    final firstRegion = createBitmapRegion(sharedBitmap, 0, 0, 2, 2);
    freeBitmapRegion(firstRegion);
    final region = createBitmapRegion(sharedBitmap, 0, 0, 2, 2);
    setBitmapRegion(region, sharedBitmap, 0, 0, 1, 1);
    freeBitmapRef(sharedBitmap);
    final pixels = haxe.io.Bytes.alloc(4);
    extractBitmapPixels(bytePointer(pixels), pixels.length, region);
    if (pixels.toHex() != '55667711') throw 'region did not retain the shared bitmap';
    freeBitmapRegion(region);
    final parent = createDisplayObject();
    final child = createSprite();
    final appearance = getNodeAppearanceRevision(child);
    child.node2dAlpha = 0.25;
    child.node2dVisible = false;
    if (!child.setNode2dBlendMode(3, true)) throw 'Sprite blend mode write failed';
    child.name = 'Sprite Ω';
    if (child.node2dAlpha != 0.25 || child.node2dVisible || child.node2dBlendMode != 3 || child.name != 'Sprite Ω')
      throw 'Sprite inherited properties failed';
    final rawRevision = getNodeAppearanceRevision(child);
    invalidateNodeAppearance(child);
    if (rawRevision < appearance || getNodeAppearanceRevision(child) != rawRevision + 1)
      throw 'Sprite appearance invalidation failed';
    child.setNode2dBlendMode(0, false);
    child.name = '';
    if (child.name != '' || child.node2dBlendMode != -1) throw 'empty and null node properties differ';
    child.name = null;
    if (child.name != null) throw 'clearing a Sprite name failed';
    parent.node2dAlpha = 0.5;
    parent.node2dVisible = false;
    parent.name = 'parent';
    parent.setNode2dBlendMode(4, true);
    if (parent.node2dAlpha != 0.5 || parent.node2dVisible || parent.name != 'parent' || parent.node2dBlendMode != 4)
      throw 'DisplayObject inherited properties failed';
    final shape = flight.Shape.createShape();
    shape.node2dAlpha = 0.75;
    shape.name = 'shape';
    if (shape.node2dAlpha != 0.75 || shape.name != 'shape') throw 'Shape inherited properties failed';
    shape.free();
    final added = addNodeChild(parent, child);
    if (getNodeChildCount(parent) != 1) throw 'adding a concrete node failed';
    final parentView = getNodeParent(added);
    if (parentView == null || !flight.FlightNode.same(parentView, parent)) throw 'returned node handle failed';
    final cloned = cloneSprite(added);
    if (getNodeChildCount(cloned) != 0) throw 'concrete node receiver failed';
    final removed = removeNodeChild(parentView, added);
    if (getNodeChildCount(parent) != 0) throw 'node removal failed';
    if (getNodeParent(removed) != null) throw 'absent parent did not return null';
    removed.free();
    cloned.free();
    parentView.free();
    added.free();
    child.free();
    parent.free();
    #if (cpp || hl)
    final font = flight.Font.createFontResource();
    font.family = 'Sans Ω';
    if (font.family != 'Sans Ω') throw 'UTF8 string field failed';
    font.family = '';
    if (font.family != '') throw 'empty string field failed';
    flight.Font.freeFontResource(font);
    final input = haxe.io.Bytes.ofHex('0001027f80feff');
    final inputData = bytePointer(input);
    final reader = flight.Buffer.createByteReader(inputData, input.length, haxe.Int64.ofInt(1));
    if (!flight.Buffer.hasByteReaderBytes(reader, 6) || flight.Buffer.readByteReaderU16(reader) != 0x0201)
      throw 'owned byte reader failed';
    flight.Buffer.freeOwnedByteReader(reader);
    final history:flight.CommandHistory = cast flight.Command.createCommandHistory();
    history.maxSize = 91;
    if (history.maxSize != 91) throw 'Ref-backed history field failed';
    if (flight.Command.getCommandHistorySignals(cast history) != null) throw 'history already has a signal';
    final enabled = flight.Command.enableCommandHistorySignals(cast history);
    final signal = flight.Command.getCommandHistorySignals(cast history);
    if (enabled == null || signal == null) throw 'history signal handles missing';
    flight.Command.freeUnitSignal(signal);
    flight.Command.freeUnitSignal(enabled);
    flight.Command.freeCommandHistoryRef(history);
    final path = flight.Path.createPath(-1);
    if (flight.Path.getPathLastPoint(path) != null) throw 'empty path returned a point';
    flight.Path.appendPathMoveTo(path, 1.5, 2.5);
    final lastPoint = flight.Path.getPathLastPoint(path);
    if (lastPoint == null || lastPoint._0 != 1.5 || lastPoint._1 != 2.5)
      throw 'native optional tuple failed';
    flight.Path.freePath(path);
    final compressed = compressDeflate(inputData, input.length);
    if (compressed.length <= 0) throw 'compressed buffer length missing';
    final compressedBytes = compressed.toBytes();
    final decoded = decompressDeflate(bytePointer(compressedBytes), compressedBytes.length, input.length, flight.CompressionFraming.Raw);
    if (decoded == null || decoded.length != input.length || decoded.get(6) != 255)
      throw 'decoded buffer metadata invalid';
    if (decoded.toBytes().toHex() != input.toHex()) throw 'decoded buffer copy failed';
    decoded.free();
    compressed.free();
    final empty = compressDeflate(null, 0);
    final emptyBytes = empty.toBytes();
    final emptyDecoded = decompressDeflate(bytePointer(emptyBytes), emptyBytes.length, 0, flight.CompressionFraming.Raw);
    if (emptyDecoded == null || emptyDecoded.toBytes().length != 0) throw 'empty buffer failed';
    emptyDecoded.free();
    empty.free();
    if (decompressDeflate(null, 0, 4, flight.CompressionFraming.Rfc1950) != null)
      throw 'invalid compressed input did not return null';
    #end
    trace('FLIGHT_FFI_SMOKE_OK');
  }
}
