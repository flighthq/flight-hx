package flight;

abstract MenuItemType(Int) from Int to Int {
	public static inline var Normal:MenuItemType = 0;
	public static inline var Separator:MenuItemType = 1;
	public static inline var Submenu:MenuItemType = 2;
	public static inline var Checkbox:MenuItemType = 3;
	public static inline var Radio:MenuItemType = 4;
}
