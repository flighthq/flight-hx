package flight._cpp;

abstract Accelerator(cpp.Star<cpp.Void>) {
	extern inline public function free():Void {
		flight._cpp._fn.Shortcut.freeAccelerator(cast this);
	}
}
