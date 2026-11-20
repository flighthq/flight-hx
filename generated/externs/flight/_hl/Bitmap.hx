package flight._hl;

abstract Bitmap(hl.Bytes) {
	static inline public function create(width:Int, height:Int, color:haxe.Int64):flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.createBitmap(width, height, color);
	}
	inline public function clone():flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.cloneBitmap(cast this);
	}
	inline public function convertAlphaType(target:Int):Void {
		flight._hl._fn.Bitmap.convertBitmapAlphaType(cast this, target);
	}
	inline public function invalidate():Void {
		flight._hl._fn.Bitmap.invalidateBitmap(cast this);
	}
	inline public function share():hl.Bytes {
		return flight._hl._fn.Bitmap.shareBitmap(cast this);
	}
	inline public function compare(other:flight._hl.Bitmap):flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.compareBitmap(cast this, other);
	}
	inline public function getMismatch(other:flight._hl.Bitmap, channelTolerance:Int):flight._hl.BitmapMismatch {
		return flight._hl._fn.Bitmap.getBitmapMismatch(cast this, other, channelTolerance);
	}
	inline public function getCoverage(backgroundColor:Int, channelTolerance:Int):Float {
		return flight._hl._fn.Bitmap.getBitmapCoverage(cast this, backgroundColor, channelTolerance);
	}
	inline public function crop(rect:flight._hl.Rectangle):flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.cropBitmap(cast this, rect);
	}
	inline public function extend(left:Int, top:Int, right:Int, bottom:Int, edgeMode:Int, fillColor:Int):flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.extendBitmap(cast this, left, top, right, bottom, edgeMode, fillColor);
	}
	inline public function trim():flight._hl.Bitmap {
		return flight._hl._fn.Bitmap.trimBitmap(cast this);
	}
	inline public function encode(hostBitmapEncode:flight._hl.HostBitmapEncodeCapability, format:Int, quality:Single):Null<flight._hl.ByteResult> {
		return flight._hl._fn.Bitmap.EncodeBitmapByteResult.wrapOptional(flight._hl._fn.Bitmap.encodeBitmap(hostBitmapEncode, cast this, format, quality));
	}
	inline public function floodFill(x:Int, y:Int, color:Int):Void {
		flight._hl._fn.Bitmap.floodFillBitmap(cast this, x, y, color);
	}
	inline public function createFingerprint(gridSize:Int):flight._hl.BitmapFingerprint {
		return flight._hl._fn.Bitmap.createBitmapFingerprint(cast this, gridSize);
	}
	inline public function getPixel(x:Int, y:Int):Int {
		return flight._hl._fn.Bitmap.getBitmapPixel(cast this, x, y);
	}
	inline public function getPixelChannel(x:Int, y:Int, channel:flight._hl.ImageChannel):Int {
		return flight._hl._fn.Bitmap.getBitmapPixelChannel(cast this, x, y, channel);
	}
	inline public function getPixelLuminance(x:Int, y:Int):Int {
		return flight._hl._fn.Bitmap.getBitmapPixelLuminance(cast this, x, y);
	}
	inline public function getPixelRgb(x:Int, y:Int):Int {
		return flight._hl._fn.Bitmap.getBitmapPixelRgb(cast this, x, y);
	}
	inline public function setPixel(x:Int, y:Int, color:Int):Void {
		flight._hl._fn.Bitmap.setBitmapPixel(cast this, x, y, color);
	}
	inline public function setPixelRgb(x:Int, y:Int, color:Int):Void {
		flight._hl._fn.Bitmap.setBitmapPixelRgb(cast this, x, y, color);
	}
	inline public function scroll(dx:Int, dy:Int):Void {
		flight._hl._fn.Bitmap.scrollBitmap(cast this, dx, dy);
	}
	inline public function free():Void {
		flight._hl._fn.Bitmap.freeBitmap(cast this);
	}
	inline public function freeRef():Void {
		flight._hl._fn.Bitmap.freeBitmapRef(cast this);
	}
	inline public function createImageResourceFrom(hostImage:flight._hl.HostImageCapability):hl.Bytes {
		return flight._hl._fn.Image.createImageResourceFromBitmap(hostImage, cast this);
	}
}
