package flight._cpp._fn;

extern class App {
	@:native("flight_create_app_events")
	public static function createAppEvents():flight._cpp.AppEvents;
	@:native("flight_add_app_recent_document")
	public static function addAppRecentDocument(hostAppRecentDocuments:flight._cpp.HostAppRecentDocumentsCapability, path:cpp.ConstCharStar):Void;
	@:native("flight_attach_app_activate")
	public static function attachAppActivate(hostAppActivate:flight._cpp.HostAppActivateCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_all_windows_closed")
	public static function attachAppAllWindowsClosed(hostAppAllWindowsClosed:flight._cpp.HostAppAllWindowsClosedCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_events")
	public static function attachAppEvents(hostAppActivate:flight._cpp.HostAppActivateCapability, hostAppAllWindowsClosed:flight._cpp.HostAppAllWindowsClosedCapability, hostAppOpenFile:flight._cpp.HostAppOpenFileCapability, hostAppQuitRequest:flight._cpp.HostAppQuitRequestCapability, hostAppReady:flight._cpp.HostAppReadyCapability, hostAppSecondInstance:flight._cpp.HostAppSecondInstanceCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_open_file")
	public static function attachAppOpenFile(hostAppOpenFile:flight._cpp.HostAppOpenFileCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_quit_request")
	public static function attachAppQuitRequest(hostAppQuitRequest:flight._cpp.HostAppQuitRequestCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_ready")
	public static function attachAppReady(hostAppReady:flight._cpp.HostAppReadyCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_attach_app_second_instance")
	public static function attachAppSecondInstance(hostAppSecondInstance:flight._cpp.HostAppSecondInstanceCapability, app:flight._cpp.AppEvents):Void;
	@:native("flight_bounce_app_dock")
	public static function bounceAppDock(hostAppDock:flight._cpp.HostAppDockCapability):Int;
	@:native("flight_cancel_app_attention")
	public static function cancelAppAttention(hostAppDock:flight._cpp.HostAppDockCapability, id:Int):Void;
	@:native("flight_cancel_app_dock_bounce")
	public static function cancelAppDockBounce(hostAppDock:flight._cpp.HostAppDockCapability, id:Int):Void;
	@:native("flight_clear_app_recent_documents")
	public static function clearAppRecentDocuments(hostAppRecentDocuments:flight._cpp.HostAppRecentDocumentsCapability):Void;
	@:native("flight_detach_app_events")
	public static function detachAppEvents(app:flight._cpp.AppEvents):Void;
	@:native("flight_dispose_app_events")
	public static function disposeAppEvents(app:flight._cpp.AppEvents):Void;
	@:native("flight_focus_app")
	public static function focusApp(hostAppFocus:flight._cpp.HostAppFocusCapability):Void;
	@:native("flight_get_app_directory_path")
	public static function getAppDirectoryPath(hostAppPath:flight._cpp.HostAppPathCapability, kind:Int):cpp.ConstCharStar;
	@:native("flight_get_app_executable_path")
	public static function getAppExecutablePath(hostAppPath:flight._cpp.HostAppPathCapability):cpp.ConstCharStar;
	@:native("flight_get_app_locale")
	public static function getAppLocale(hostAppLocale:flight._cpp.HostAppLocaleCapability):cpp.ConstCharStar;
	@:native("flight_get_app_login_item")
	public static function getAppLoginItem(hostAppLoginItem:flight._cpp.HostAppLoginItemCapability):flight._cpp.AppLoginItem;
	@:native("flight_get_app_name")
	public static function getAppName(hostAppName:flight._cpp.HostAppNameCapability):cpp.ConstCharStar;
	@:native("flight_get_app_path")
	public static function getAppPath(hostAppPath:flight._cpp.HostAppPathCapability):cpp.ConstCharStar;
	@:native("flight_get_app_preferred_system_languages")
	public static function getAppPreferredSystemLanguages(out:cpp.Star<cpp.Void>, hostAppLocale:flight._cpp.HostAppLocaleCapability):Void;
	@:native("flight_get_app_system_locale")
	public static function getAppSystemLocale(hostAppLocale:flight._cpp.HostAppLocaleCapability):cpp.ConstCharStar;
	@:native("flight_get_app_version")
	public static function getAppVersion(hostAppVersion:flight._cpp.HostAppVersionCapability):cpp.ConstCharStar;
	@:native("flight_has_app_single_instance_lock")
	public static function hasAppSingleInstanceLock(hostAppSingleInstance:flight._cpp.HostAppSingleInstanceCapability):Bool;
	@:native("flight_hide_app")
	public static function hideApp(hostAppHide:flight._cpp.HostAppHideCapability):Void;
	@:native("flight_is_app_hidden")
	public static function isAppHidden(hostLifecycle:flight._cpp.HostLifecycleCapability):Bool;
	@:native("flight_quit_app")
	public static function quitApp(hostAppQuit:flight._cpp.HostAppQuitCapability):Void;
	@:native("flight_relaunch_app")
	public static function relaunchApp(hostAppRelaunch:flight._cpp.HostAppRelaunchCapability):Void;
	@:native("flight_release_app_single_instance_lock")
	public static function releaseAppSingleInstanceLock(hostAppSingleInstance:flight._cpp.HostAppSingleInstanceCapability):Void;
	@:native("flight_request_app_attention")
	public static function requestAppAttention(hostAppDock:flight._cpp.HostAppDockCapability, critical:Bool):Int;
	@:native("flight_request_app_single_instance_lock")
	public static function requestAppSingleInstanceLock(hostAppSingleInstance:flight._cpp.HostAppSingleInstanceCapability):Bool;
	@:native("flight_set_app_activation_policy")
	public static function setAppActivationPolicy(hostAppActivationPolicy:flight._cpp.HostAppActivationPolicyCapability, policy:Int):Void;
	@:native("flight_set_app_dock_badge")
	public static function setAppDockBadge(hostAppDock:flight._cpp.HostAppDockCapability, text:cpp.ConstCharStar):Void;
	@:native("flight_set_app_login_item")
	public static function setAppLoginItem(hostAppLoginItem:flight._cpp.HostAppLoginItemCapability, settings:flight._cpp.AppLoginItemLike):Void;
	@:native("flight_set_app_name")
	public static function setAppName(hostAppNameWrite:flight._cpp.HostAppNameWriteCapability, name:cpp.ConstCharStar):Void;
	@:native("flight_set_app_user_model_id")
	public static function setAppUserModelId(hostAppUserModelId:flight._cpp.HostAppUserModelIdCapability, id:cpp.ConstCharStar):Void;
	@:native("flight_show_app")
	public static function showApp(hostAppShow:flight._cpp.HostAppShowCapability):Void;
	@:native("flight_create_app_loop")
	public static function createAppLoop():cpp.Star<cpp.Void>;
	@:native("flight_attach_app_loop_exit")
	public static function attachAppLoopExit(hostAppExit:flight._cpp.HostAppExitCapability, app:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_app_loop_lifecycle")
	public static function attachAppLoopLifecycle(app:cpp.Star<cpp.Void>, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_app_loop_exit")
	public static function detachAppLoopExit(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispose_app_loop")
	public static function disposeAppLoop(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_app_loop_lifecycle_signals")
	public static function enableAppLoopLifecycleSignals(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_for_each_app_loop_window")
	public static function forEachAppLoopWindow(app:cpp.Star<cpp.Void>, visitorFn:cpp.Star<cpp.Void>, visitorCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_app_loop_frame_rate")
	public static function getAppLoopFrameRate(app:cpp.Star<cpp.Void>):Float;
	@:native("flight_get_app_loop_main_window")
	public static function getAppLoopMainWindow(app:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_is_app_loop_running")
	public static function isAppLoopRunning(app:cpp.Star<cpp.Void>):Bool;
	@:native("flight_pause_app_loop")
	public static function pauseAppLoop(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_register_app_loop_window")
	public static function registerAppLoopWindow(app:cpp.Star<cpp.Void>, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_resume_app_loop")
	public static function resumeAppLoop(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_app_loop_main_window")
	public static function setAppLoopMainWindow(app:cpp.Star<cpp.Void>, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_start_app_loop")
	public static function startAppLoop(hostAppLoop:flight._cpp.HostAppLoopCapability, hostLifecycle:flight._cpp.HostLifecycleCapability, app:cpp.Star<cpp.Void>, options:flight._cpp.AppLoopOptions):Void;
	@:native("flight_step_app_loop")
	public static function stepAppLoop(app:cpp.Star<cpp.Void>, deltaTime:Float, options:flight._cpp.AppStepOptions):Void;
	@:native("flight_stop_app_loop")
	public static function stopAppLoop(app:cpp.Star<cpp.Void>):Void;
	@:native("flight_unregister_app_loop_window")
	public static function unregisterAppLoopWindow(app:cpp.Star<cpp.Void>, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_app_window")
	public static function createAppWindow():cpp.Star<cpp.Void>;
	@:native("flight_attach_window")
	public static function attachWindow(hostWindowAttach:flight._cpp.HostWindowAttachCapability, hostWindowLifecycle:flight._cpp.HostWindowLifecycleCapability, win:cpp.Star<cpp.Void>, handle:flight._cpp.NativeWindowHandle, ownership:Int):Bool;
	@:native("flight_attach_window_close")
	public static function attachWindowClose(hostWindowLifecycle:flight._cpp.HostWindowLifecycleCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_window_drop_file")
	public static function attachWindowDropFile(hostInputDropFile:flight._cpp.HostInputDropFileCapability, win:cpp.Star<cpp.Void>, target:flight._cpp.InputTargetHandle):Void;
	@:native("flight_attach_window_focus")
	public static function attachWindowFocus(hostInputFocus:flight._cpp.HostInputFocusCapability, win:cpp.Star<cpp.Void>, target:flight._cpp.InputTargetHandle):Void;
	@:native("flight_attach_window_fullscreen")
	public static function attachWindowFullscreen(hostFullscreen:flight._cpp.HostElementFullscreenCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_window_move")
	public static function attachWindowMove(hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_window_orientation")
	public static function attachWindowOrientation(hostScreenChange:flight._cpp.HostScreenChangeCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_window_resize")
	public static function attachWindowResize(hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>, target:cpp.Star<cpp.Void>):Void;
	@:native("flight_attach_window_visibility")
	public static function attachWindowVisibility(hostWindowVisibility:flight._cpp.HostWindowVisibilityCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_center_window")
	public static function centerWindow(hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_close_window")
	public static function closeWindow(hostWindowLifecycle:flight._cpp.HostWindowLifecycleCapability, win:cpp.Star<cpp.Void>):Bool;
	@:native("flight_compute_window_device_transform")
	public static function computeWindowDeviceTransform(out:flight._cpp.Matrix, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_close")
	public static function detachWindowClose(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_drop_file")
	public static function detachWindowDropFile(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_focus")
	public static function detachWindowFocus(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_fullscreen")
	public static function detachWindowFullscreen(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_move")
	public static function detachWindowMove(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_orientation")
	public static function detachWindowOrientation(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_resize")
	public static function detachWindowResize(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_detach_window_visibility")
	public static function detachWindowVisibility(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_dispose_app_window")
	public static function disposeAppWindow(win:cpp.Star<cpp.Void>):Void;
	@:native("flight_exit_app_input_pointer_lock")
	public static function exitAppInputPointerLock(state:cpp.Star<cpp.Void>, hostInputPointerLock:flight._cpp.HostInputPointerLockCapability):flight._cpp.InputPointerLockExitFuture;
	@:native("flight_flash_window_frame")
	public static function flashWindowFrame(hostWindowAttention:flight._cpp.HostWindowAttentionCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_focus_window")
	public static function focusWindow(hostWindowFocus:flight._cpp.HostWindowFocusCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_window_bounds")
	public static function getWindowBounds(out:flight._cpp.WindowBounds, hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_hide_window")
	public static function hideWindow(hostWindowVisibility:flight._cpp.HostWindowVisibilityCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_lock_app_input_pointer")
	public static function lockAppInputPointer(state:cpp.Star<cpp.Void>, hostInputPointerLock:flight._cpp.HostInputPointerLockCapability, target:flight._cpp.InputTargetHandle):flight._cpp.InputPointerLockRequestFuture;
	@:native("flight_maximize_window")
	public static function maximizeWindow(hostWindowState:flight._cpp.HostWindowStateCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_minimize_window")
	public static function minimizeWindow(hostWindowState:flight._cpp.HostWindowStateCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_open_window")
	public static function openWindow(hostWindowLifecycle:flight._cpp.HostWindowLifecycleCapability, hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>, options:flight._cpp.WindowOptions):Bool;
	@:native("flight_prepare_element_for_input")
	public static function prepareElementForInput(hostInputTarget:flight._cpp.HostInputTargetCapability, target:flight._cpp.InputTargetHandle):Void;
	@:native("flight_request_window_attention")
	public static function requestWindowAttention(hostWindowAttention:flight._cpp.HostWindowAttentionCapability, win:cpp.Star<cpp.Void>, attention:Bool):Void;
	@:native("flight_request_window_close")
	public static function requestWindowClose(win:cpp.Star<cpp.Void>):Bool;
	@:native("flight_restore_window")
	public static function restoreWindow(hostWindowState:flight._cpp.HostWindowStateCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_window_always_on_top")
	public static function setWindowAlwaysOnTop(hostWindowZOrder:flight._cpp.HostWindowZOrderCapability, win:cpp.Star<cpp.Void>, alwaysOnTop:Bool):Void;
	@:native("flight_set_window_content_protection")
	public static function setWindowContentProtection(hostWindowContentProtection:flight._cpp.HostWindowContentProtectionCapability, win:cpp.Star<cpp.Void>, enabled:Bool):Void;
	@:native("flight_set_window_fullscreen")
	public static function setWindowFullscreen(hostWindowFullscreen:flight._cpp.HostWindowFullscreenCapability, win:cpp.Star<cpp.Void>, fullscreen:Bool):Void;
	@:native("flight_set_window_has_shadow")
	public static function setWindowHasShadow(hostWindowShadow:flight._cpp.HostWindowShadowCapability, win:cpp.Star<cpp.Void>, hasShadow:Bool):Void;
	@:native("flight_set_window_icon")
	public static function setWindowIcon(hostWindowAppearance:flight._cpp.HostWindowAppearanceCapability, win:cpp.Star<cpp.Void>, icon:cpp.ConstCharStar):Void;
	@:native("flight_set_window_maximum_size")
	public static function setWindowMaximumSize(hostWindowSizeConstraints:flight._cpp.HostWindowSizeConstraintsCapability, win:cpp.Star<cpp.Void>, width:Single, height:Single):Void;
	@:native("flight_set_window_menu_bar_visible")
	public static function setWindowMenuBarVisible(hostWindowShell:flight._cpp.HostWindowShellCapability, win:cpp.Star<cpp.Void>, visible:Bool):Void;
	@:native("flight_set_window_minimum_size")
	public static function setWindowMinimumSize(hostWindowSizeConstraints:flight._cpp.HostWindowSizeConstraintsCapability, win:cpp.Star<cpp.Void>, width:Single, height:Single):Void;
	@:native("flight_set_window_opacity")
	public static function setWindowOpacity(hostWindowAppearance:flight._cpp.HostWindowAppearanceCapability, win:cpp.Star<cpp.Void>, opacity:Single):Void;
	@:native("flight_set_window_parent")
	public static function setWindowParent(hostWindowHierarchy:flight._cpp.HostWindowHierarchyCapability, win:cpp.Star<cpp.Void>, parent:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_window_position")
	public static function setWindowPosition(hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>, x:Single, y:Single):Void;
	@:native("flight_set_window_progress")
	public static function setWindowProgress(hostWindowProgress:flight._cpp.HostWindowProgressCapability, win:cpp.Star<cpp.Void>, progress:Single):Void;
	@:native("flight_set_window_resizable")
	public static function setWindowResizable(hostWindowSizeConstraints:flight._cpp.HostWindowSizeConstraintsCapability, win:cpp.Star<cpp.Void>, resizable:Bool):Void;
	@:native("flight_set_window_size")
	public static function setWindowSize(hostWindowGeometry:flight._cpp.HostWindowGeometryCapability, win:cpp.Star<cpp.Void>, width:Single, height:Single):Void;
	@:native("flight_set_window_skip_taskbar")
	public static function setWindowSkipTaskbar(hostWindowShell:flight._cpp.HostWindowShellCapability, win:cpp.Star<cpp.Void>, skip:Bool):Void;
	@:native("flight_set_window_title")
	public static function setWindowTitle(hostWindowAppearance:flight._cpp.HostWindowAppearanceCapability, win:cpp.Star<cpp.Void>, title:cpp.ConstCharStar):Void;
	@:native("flight_show_window")
	public static function showWindow(hostWindowVisibility:flight._cpp.HostWindowVisibilityCapability, win:cpp.Star<cpp.Void>):Void;
	@:native("flight_free_app_events")
	public static function freeAppEvents(ptr:flight._cpp.AppEvents):Void;
	@:native("flight_free_app_login_item")
	public static function freeAppLoginItem(ptr:flight._cpp.AppLoginItem):Void;
	@:native("flight_free_app_loop_ref")
	public static function freeAppLoopRef(ptr:flight._cpp.AppLoop):Void;
	@:native("flight_free_app_window_ref")
	public static function freeAppWindowRef(ptr:flight._cpp.AppWindow):Void;
	@:native("flight_free_input_pointer_lock_exit_future")
	public static function freeInputPointerLockExitFuture(ptr:flight._cpp.InputPointerLockExitFuture):Void;
	@:native("flight_free_input_pointer_lock_request_future")
	public static function freeInputPointerLockRequestFuture(ptr:flight._cpp.InputPointerLockRequestFuture):Void;
	@:native("flight_free_string")
	public static function freeString(ptr:cpp.ConstCharStar):Void;
}
