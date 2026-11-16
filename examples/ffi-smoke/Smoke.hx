import flight.Math;
import flight.Geometry;
import flight.Bitmap;

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
    trace('FLIGHT_FFI_SMOKE_OK');
  }
}
