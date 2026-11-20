package flight._js;

abstract Accelerator(Dynamic) {
	inline public function free():Void {
		flight._js._fn.Shortcut.freeAccelerator(cast this);
	}
}
