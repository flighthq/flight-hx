package flight._cpp;

abstract Bitmap(cpp.Star<cpp.Void>) {
	static inline public function create(width:Int, height:Int, color:Int):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.createBitmap(width, height, color);
	}
	inline public function clone():flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.cloneBitmap(cast this);
	}
	inline public function convertAlphaType(target:Int):Void {
		flight._cpp._fn.Bitmap.convertBitmapAlphaType(cast this, target);
	}
	inline public function invalidate():Void {
		flight._cpp._fn.Bitmap.invalidateBitmap(cast this);
	}
	inline public function compare(other:flight._cpp.Bitmap):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.compareBitmap(cast this, other);
	}
	inline public function getMismatch(other:flight._cpp.Bitmap, channelTolerance:Int):flight._cpp.BitmapMismatch {
		return flight._cpp._fn.Bitmap.getBitmapMismatch(cast this, other, channelTolerance);
	}
	inline public function getCoverage(backgroundColor:Int, channelTolerance:Int):Float {
		return flight._cpp._fn.Bitmap.getBitmapCoverage(cast this, backgroundColor, channelTolerance);
	}
	inline public function extend(left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.extendBitmap(cast this, left, top, right, bottom, edgeMode, fillColor);
	}
	inline public function trim():flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.trimBitmap(cast this);
	}
	inline public function encode(hostBitmapEncode:flight._cpp.HostBitmapEncodeCapability, format:Int, quality:Single):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Bitmap.encodeBitmap(hostBitmapEncode, cast this, format, quality);
	}
	inline public function floodFill(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.floodFillBitmap(cast this, x, y, color);
	}
	inline public function createFingerprint(gridSize:Int):flight._cpp.BitmapFingerprint {
		return flight._cpp._fn.Bitmap.createBitmapFingerprint(cast this, gridSize);
	}
	inline public function getPixel(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixel(cast this, x, y);
	}
	inline public function getPixelChannel(x:Int, y:Int, channel:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelChannel(cast this, x, y, channel);
	}
	inline public function getPixelLuminance(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelLuminance(cast this, x, y);
	}
	inline public function getPixelRgb(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelRgb(cast this, x, y);
	}
	inline public function setPixel(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.setBitmapPixel(cast this, x, y, color);
	}
	inline public function setPixelRgb(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.setBitmapPixelRgb(cast this, x, y, color);
	}
	inline public function createRegion(x:Int, y:Int, width:Int, height:Int):flight._cpp.BitmapRegion {
		return flight._cpp._fn.Bitmap.createBitmapRegion(cast this, x, y, width, height);
	}
	inline public function setRegion(out:flight._cpp.BitmapRegion, x:Int, y:Int, width:Int, height:Int):Void {
		flight._cpp._fn.Bitmap.setBitmapRegion(out, cast this, x, y, width, height);
	}
	inline public function scroll(dx:Int, dy:Int):Void {
		flight._cpp._fn.Bitmap.scrollBitmap(cast this, dx, dy);
	}
	inline public function free():Void {
		flight._cpp._fn.Bitmap.freeBitmap(cast this);
	}
	inline public function createImageResourceFrom(hostImage:flight._cpp.HostImageCapability):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Image.createImageResourceFromBitmap(hostImage, cast this);
	}
}
