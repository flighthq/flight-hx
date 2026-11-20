package flight._cpp;

abstract Bitmap(cpp.Star<cpp.Void>) {
	static extern inline public function create(width:Int, height:Int, color:haxe.Int64):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.createBitmap(width, height, color);
	}
	extern inline public function clone():flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.cloneBitmap(cast this);
	}
	extern inline public function convertAlphaType(target:Int):Void {
		flight._cpp._fn.Bitmap.convertBitmapAlphaType(cast this, target);
	}
	extern inline public function invalidate():Void {
		flight._cpp._fn.Bitmap.invalidateBitmap(cast this);
	}
	extern inline public function share():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Bitmap.shareBitmap(cast this);
	}
	extern inline public function compare(other:flight._cpp.Bitmap):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.compareBitmap(cast this, other);
	}
	extern inline public function getMismatch(other:flight._cpp.Bitmap, channelTolerance:Int):flight._cpp.BitmapMismatch {
		return flight._cpp._fn.Bitmap.getBitmapMismatch(cast this, other, channelTolerance);
	}
	extern inline public function getCoverage(backgroundColor:Int, channelTolerance:Int):Float {
		return flight._cpp._fn.Bitmap.getBitmapCoverage(cast this, backgroundColor, channelTolerance);
	}
	extern inline public function crop(rect:flight._cpp.Rectangle):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.cropBitmap(cast this, rect);
	}
	extern inline public function extend(left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.extendBitmap(cast this, left, top, right, bottom, edgeMode, fillColor);
	}
	extern inline public function trim():flight._cpp.Bitmap {
		return flight._cpp._fn.Bitmap.trimBitmap(cast this);
	}
	extern inline public function encode(hostBitmapEncode:flight._cpp.HostBitmapEncodeCapability, format:Int, quality:Single):Null<flight._cpp.ByteResult> {
		return flight._cpp._fn.Bitmap.EncodeBitmapByteResult.wrapOptional(flight._cpp._fn.Bitmap.encodeBitmap(hostBitmapEncode, cast this, format, quality));
	}
	extern inline public function floodFill(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.floodFillBitmap(cast this, x, y, color);
	}
	extern inline public function createFingerprint(gridSize:Int):flight._cpp.BitmapFingerprint {
		return flight._cpp._fn.Bitmap.createBitmapFingerprint(cast this, gridSize);
	}
	extern inline public function getPixel(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixel(cast this, x, y);
	}
	extern inline public function getPixelChannel(x:Int, y:Int, channel:flight._cpp.ImageChannel):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelChannel(cast this, x, y, channel);
	}
	extern inline public function getPixelLuminance(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelLuminance(cast this, x, y);
	}
	extern inline public function getPixelRgb(x:Int, y:Int):Int {
		return flight._cpp._fn.Bitmap.getBitmapPixelRgb(cast this, x, y);
	}
	extern inline public function setPixel(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.setBitmapPixel(cast this, x, y, color);
	}
	extern inline public function setPixelRgb(x:Int, y:Int, color:Int):Void {
		flight._cpp._fn.Bitmap.setBitmapPixelRgb(cast this, x, y, color);
	}
	extern inline public function scroll(dx:Int, dy:Int):Void {
		flight._cpp._fn.Bitmap.scrollBitmap(cast this, dx, dy);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Bitmap.freeBitmap(cast this);
	}
	extern inline public function freeRef():Void {
		flight._cpp._fn.Bitmap.freeBitmapRef(cast this);
	}
	extern inline public function createImageResourceFrom(hostImage:flight._cpp.HostImageCapability):cpp.Star<cpp.Void> {
		return flight._cpp._fn.Image.createImageResourceFromBitmap(hostImage, cast this);
	}
}
