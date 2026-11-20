package flight._hl;

abstract Accelerator(hl.Bytes) {
	inline public function free():Void {
		flight._hl._fn.Shortcut.freeAccelerator(cast this);
	}
}
