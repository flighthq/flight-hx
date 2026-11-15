package flight;

abstract EntityRuntimeWriteSlot(Int) from Int to Int {
	public static inline var BindingSlot:EntityRuntimeWriteSlot = 0;
	public static inline var RuntimeSlot:EntityRuntimeWriteSlot = 1;
}
