package flight;

abstract InteractionSignalName(Int) from Int to Int {
	public static inline var OnClick:InteractionSignalName = 0;
	public static inline var OnContextMenu:InteractionSignalName = 1;
	public static inline var OnDoubleClick:InteractionSignalName = 2;
	public static inline var OnFocusIn:InteractionSignalName = 3;
	public static inline var OnFocusOut:InteractionSignalName = 4;
	public static inline var OnKeyDown:InteractionSignalName = 5;
	public static inline var OnKeyUp:InteractionSignalName = 6;
	public static inline var OnPointerCancel:InteractionSignalName = 7;
	public static inline var OnPointerDoubleClick:InteractionSignalName = 8;
	public static inline var OnPointerDown:InteractionSignalName = 9;
	public static inline var OnPointerMove:InteractionSignalName = 10;
	public static inline var OnPointerOut:InteractionSignalName = 11;
	public static inline var OnPointerOver:InteractionSignalName = 12;
	public static inline var OnPointerRollOut:InteractionSignalName = 13;
	public static inline var OnPointerRollOver:InteractionSignalName = 14;
	public static inline var OnPointerUp:InteractionSignalName = 15;
	public static inline var OnReleaseOutside:InteractionSignalName = 16;
	public static inline var OnWheel:InteractionSignalName = 17;
}
