import flight.Math;
import flight.Geometry;
import flight.Bitmap;
import flight.Scene2D;
import flight.Node;
import flight.Entity;
import flight.Compression;

class Smoke {
  public static function main() {
    if (lerp(0, 10, 0.25) != 2.5) throw 'lerp failed';
    final v = createVector2(3, 4);
    if (getVector2Length(v) != 5) throw 'vector length failed';
    v.x = 6;
    if (v.x != 6) throw 'vector field access failed';
    freeVector2(v);
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
    final region = createBitmapRegion(bitmap, 0, 0, 2, 2);
    setBitmapRegion(region, bitmap, 0, 0, 1, 1);
    freeBitmapRegion(region);
    if (getBitmapPixel(bitmap, 0, 0) != 0x11223344)
      throw 'region consumed caller bitmap storage';
    setBitmapPixel(bitmap, 0, 0, 0x55667711);
    if (getBitmapPixel(bitmap, 0, 0) != 0x55667711)
      throw 'caller bitmap is no longer writable';
    freeBitmap(bitmap);
    final parent = createDisplayObject();
    final child = createSprite();
    final added = addNodeChild(parent, child);
    if (getNodeChildCount(parent) != 1) throw 'concrete handle upcast failed';
    final parentView = getNodeParent(added);
    if (getNodeChildCount(parentView) != 1) throw 'returned node handle failed';
    final runtime:flight.SpriteRuntime = cast getSpriteRuntime(cast added);
    #if js
    runtime.localBoundsTextureVersion = 91;
    if (runtime.localBoundsTextureVersion != 91) throw 'runtime field access failed';
    #else
    runtime.localBoundsTextureVersion = haxe.Int64.ofInt(91);
    if (haxe.Int64.compare(runtime.localBoundsTextureVersion, haxe.Int64.ofInt(91)) != 0)
      throw 'Ref runtime field access failed';
    #end
    final cloned = cloneSprite(cast added);
    if (getNodeChildCount(cloned) != 0) throw 'concrete Ref receiver failed';
    final removed = removeNodeChild(parentView, added);
    if (getNodeChildCount(parent) != 0) throw 'node removal failed';
    if (getNodeParent(removed) != null) throw 'absent parent did not return null';
    freeRef(removed);
    freeRef(cloned);
    freeRef(cast runtime);
    freeRef(parentView);
    freeRef(added);
    freeRef(child);
    freeRef(parent);
    #if (cpp || hl)
    final font = flight.Font.createFontResource();
    font.family = 'Sans Ω';
    if (font.family != 'Sans Ω') throw 'UTF8 string field failed';
    font.family = '';
    if (font.family != '') throw 'empty string field failed';
    flight.Font.freeFontResource(font);
    final input = haxe.io.Bytes.ofHex('0001027f80feff');
    #if cpp
    final inputData = cpp.Pointer.ofArray(input.getData()).raw;
    #else
    final inputData = input.getData().bytes;
    #end
    final compressed = compressDeflate(inputData, input.length);
    if (compressed.length <= 0) throw 'compressed buffer length missing';
    final decoded = decompressDeflate(compressed.data, compressed.length, input.length, flight.CompressionFraming.Raw);
    if (decoded == null || decoded.length != input.length || decoded.getByte(6) != 255)
      throw 'decoded buffer metadata invalid';
    if (decoded.toBytes().toHex() != input.toHex()) throw 'decoded buffer copy failed';
    decoded.dispose();
    compressed.dispose();
    final empty = compressDeflate(null, 0);
    final emptyDecoded = decompressDeflate(empty.data, empty.length, 0, flight.CompressionFraming.Raw);
    if (emptyDecoded == null || emptyDecoded.toBytes().length != 0) throw 'empty buffer failed';
    emptyDecoded.dispose();
    empty.dispose();
    if (decompressDeflate(null, 0, 4, flight.CompressionFraming.Rfc1950) != null)
      throw 'invalid compressed input did not return null';
    #end
    trace('FLIGHT_FFI_SMOKE_OK');
  }
}
