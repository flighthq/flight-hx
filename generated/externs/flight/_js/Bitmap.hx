package flight._js;

abstract Bitmap(Dynamic) {
	static inline public function create(width:Int, height:Int, color:Null<Int>):flight._js.Bitmap {
		return flight._js._fn.Bitmap.createBitmap(width, height, color);
	}
	inline public function clone():flight._js.Bitmap {
		return flight._js._fn.Bitmap.cloneBitmap(cast this);
	}
	inline public function convertAlphaType(target:Dynamic):Void {
		flight._js._fn.Bitmap.convertBitmapAlphaType(cast this, target);
	}
	inline public function invalidate():Void {
		flight._js._fn.Bitmap.invalidateBitmap(cast this);
	}
	inline public function compare(other:flight._js.Bitmap):Null<flight._js.Bitmap> {
		return flight._js._fn.Bitmap.compareBitmap(cast this, other);
	}
	inline public function getMismatch(other:flight._js.Bitmap, channelTolerance:Int):flight._js.BitmapMismatch {
		return flight._js._fn.Bitmap.getBitmapMismatch(cast this, other, channelTolerance);
	}
	inline public function getCoverage(backgroundColor:Int, channelTolerance:Int):Float {
		return flight._js._fn.Bitmap.getBitmapCoverage(cast this, backgroundColor, channelTolerance);
	}
	inline public function extend(left:Int, top:Int, right:Int, bottom:Int, edgeMode:Dynamic, fillColor:Int):flight._js.Bitmap {
		return flight._js._fn.Bitmap.extendBitmap(cast this, left, top, right, bottom, edgeMode, fillColor);
	}
	inline public function trim():flight._js.Bitmap {
		return flight._js._fn.Bitmap.trimBitmap(cast this);
	}
	inline public function encode(hostBitmapEncode:flight._js.HostBitmapEncodeCapability, format:Null<Dynamic>, quality:Null<Float>):Null<Dynamic> {
		return flight._js._fn.Bitmap.encodeBitmap(hostBitmapEncode, cast this, format, quality);
	}
	inline public function floodFill(x:Int, y:Int, color:Int):Void {
		flight._js._fn.Bitmap.floodFillBitmap(cast this, x, y, color);
	}
	inline public function createFingerprint(gridSize:Int):flight._js.BitmapFingerprint {
		return flight._js._fn.Bitmap.createBitmapFingerprint(cast this, gridSize);
	}
	inline public function getPixel(x:Int, y:Int):Int {
		return flight._js._fn.Bitmap.getBitmapPixel(cast this, x, y);
	}
	inline public function getPixelChannel(x:Int, y:Int, channel:flight._js.ImageChannel):Int {
		return flight._js._fn.Bitmap.getBitmapPixelChannel(cast this, x, y, channel);
	}
	inline public function getPixelLuminance(x:Int, y:Int):Int {
		return flight._js._fn.Bitmap.getBitmapPixelLuminance(cast this, x, y);
	}
	inline public function getPixelRgb(x:Int, y:Int):Int {
		return flight._js._fn.Bitmap.getBitmapPixelRgb(cast this, x, y);
	}
	inline public function setPixel(x:Int, y:Int, color:Int):Void {
		flight._js._fn.Bitmap.setBitmapPixel(cast this, x, y, color);
	}
	inline public function setPixelRgb(x:Int, y:Int, color:Int):Void {
		flight._js._fn.Bitmap.setBitmapPixelRgb(cast this, x, y, color);
	}
	inline public function createRegion(x:Int, y:Int, width:Int, height:Int):flight._js.BitmapRegion {
		return flight._js._fn.Bitmap.createBitmapRegion(cast this, x, y, width, height);
	}
	inline public function setRegion(out:flight._js.BitmapRegion, x:Int, y:Int, width:Int, height:Int):Void {
		flight._js._fn.Bitmap.setBitmapRegion(out, cast this, x, y, width, height);
	}
	inline public function scroll(dx:Int, dy:Int):Void {
		flight._js._fn.Bitmap.scrollBitmap(cast this, dx, dy);
	}
	inline public function free():Void {
		flight._js._fn.Bitmap.freeBitmap(cast this);
	}
	inline public function createImageResourceFrom(hostImage:flight._js.HostImageCapability):Null<Dynamic> {
		return flight._js._fn.Image.createImageResourceFromBitmap(hostImage, cast this);
	}
}
