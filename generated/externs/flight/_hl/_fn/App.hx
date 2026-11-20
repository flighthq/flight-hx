package flight._hl._fn;

extern class App {
	@:hlNative("flight", "flight_create_app_events")
	public static function createAppEvents():flight._hl.AppEvents;
	@:hlNative("flight", "flight_add_app_recent_document")
	public static function addAppRecentDocument(hostAppRecentDocuments:flight._hl.HostAppRecentDocumentsCapability, path:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_app_activate")
	public static function attachAppActivate(hostAppActivate:flight._hl.HostAppActivateCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_all_windows_closed")
	public static function attachAppAllWindowsClosed(hostAppAllWindowsClosed:flight._hl.HostAppAllWindowsClosedCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_events")
	public static function attachAppEvents(hostAppActivate:flight._hl.HostAppActivateCapability, hostAppAllWindowsClosed:flight._hl.HostAppAllWindowsClosedCapability, hostAppOpenFile:flight._hl.HostAppOpenFileCapability, hostAppQuitRequest:flight._hl.HostAppQuitRequestCapability, hostAppReady:flight._hl.HostAppReadyCapability, hostAppSecondInstance:flight._hl.HostAppSecondInstanceCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_open_file")
	public static function attachAppOpenFile(hostAppOpenFile:flight._hl.HostAppOpenFileCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_quit_request")
	public static function attachAppQuitRequest(hostAppQuitRequest:flight._hl.HostAppQuitRequestCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_ready")
	public static function attachAppReady(hostAppReady:flight._hl.HostAppReadyCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_attach_app_second_instance")
	public static function attachAppSecondInstance(hostAppSecondInstance:flight._hl.HostAppSecondInstanceCapability, app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_bounce_app_dock")
	public static function bounceAppDock(hostAppDock:flight._hl.HostAppDockCapability):Int;
	@:hlNative("flight", "flight_cancel_app_attention")
	public static function cancelAppAttention(hostAppDock:flight._hl.HostAppDockCapability, id:Int):Void;
	@:hlNative("flight", "flight_cancel_app_dock_bounce")
	public static function cancelAppDockBounce(hostAppDock:flight._hl.HostAppDockCapability, id:Int):Void;
	@:hlNative("flight", "flight_clear_app_recent_documents")
	public static function clearAppRecentDocuments(hostAppRecentDocuments:flight._hl.HostAppRecentDocumentsCapability):Void;
	@:hlNative("flight", "flight_detach_app_events")
	public static function detachAppEvents(app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_dispose_app_events")
	public static function disposeAppEvents(app:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_focus_app")
	public static function focusApp(hostAppFocus:flight._hl.HostAppFocusCapability):Void;
	@:hlNative("flight", "flight_get_app_directory_path")
	public static function getAppDirectoryPath(hostAppPath:flight._hl.HostAppPathCapability, kind:Int):hl.Bytes;
	@:hlNative("flight", "flight_get_app_executable_path")
	public static function getAppExecutablePath(hostAppPath:flight._hl.HostAppPathCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_app_locale")
	public static function getAppLocale(hostAppLocale:flight._hl.HostAppLocaleCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_app_login_item")
	public static function getAppLoginItem(hostAppLoginItem:flight._hl.HostAppLoginItemCapability):flight._hl.AppLoginItem;
	@:hlNative("flight", "flight_get_app_name")
	public static function getAppName(hostAppName:flight._hl.HostAppNameCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_app_path")
	public static function getAppPath(hostAppPath:flight._hl.HostAppPathCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_app_preferred_system_languages")
	public static function getAppPreferredSystemLanguages(out:hl.Bytes, hostAppLocale:flight._hl.HostAppLocaleCapability):Void;
	@:hlNative("flight", "flight_get_app_system_locale")
	public static function getAppSystemLocale(hostAppLocale:flight._hl.HostAppLocaleCapability):hl.Bytes;
	@:hlNative("flight", "flight_get_app_version")
	public static function getAppVersion(hostAppVersion:flight._hl.HostAppVersionCapability):hl.Bytes;
	@:hlNative("flight", "flight_has_app_single_instance_lock")
	public static function hasAppSingleInstanceLock(hostAppSingleInstance:flight._hl.HostAppSingleInstanceCapability):Bool;
	@:hlNative("flight", "flight_hide_app")
	public static function hideApp(hostAppHide:flight._hl.HostAppHideCapability):Void;
	@:hlNative("flight", "flight_is_app_hidden")
	public static function isAppHidden(hostLifecycle:flight._hl.HostLifecycleCapability):Bool;
	@:hlNative("flight", "flight_quit_app")
	public static function quitApp(hostAppQuit:flight._hl.HostAppQuitCapability):Void;
	@:hlNative("flight", "flight_relaunch_app")
	public static function relaunchApp(hostAppRelaunch:flight._hl.HostAppRelaunchCapability):Void;
	@:hlNative("flight", "flight_release_app_single_instance_lock")
	public static function releaseAppSingleInstanceLock(hostAppSingleInstance:flight._hl.HostAppSingleInstanceCapability):Void;
	@:hlNative("flight", "flight_request_app_attention")
	public static function requestAppAttention(hostAppDock:flight._hl.HostAppDockCapability, critical:Bool):Int;
	@:hlNative("flight", "flight_request_app_single_instance_lock")
	public static function requestAppSingleInstanceLock(hostAppSingleInstance:flight._hl.HostAppSingleInstanceCapability):Bool;
	@:hlNative("flight", "flight_set_app_activation_policy")
	public static function setAppActivationPolicy(hostAppActivationPolicy:flight._hl.HostAppActivationPolicyCapability, policy:Int):Void;
	@:hlNative("flight", "flight_set_app_dock_badge")
	public static function setAppDockBadge(hostAppDock:flight._hl.HostAppDockCapability, text:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_app_login_item")
	public static function setAppLoginItem(hostAppLoginItem:flight._hl.HostAppLoginItemCapability, settings:flight._hl.AppLoginItemLike):Void;
	@:hlNative("flight", "flight_set_app_name")
	public static function setAppName(hostAppNameWrite:flight._hl.HostAppNameWriteCapability, name:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_app_user_model_id")
	public static function setAppUserModelId(hostAppUserModelId:flight._hl.HostAppUserModelIdCapability, id:hl.Bytes):Void;
	@:hlNative("flight", "flight_show_app")
	public static function showApp(hostAppShow:flight._hl.HostAppShowCapability):Void;
	@:hlNative("flight", "flight_create_app_loop")
	public static function createAppLoop():hl.Bytes;
	@:hlNative("flight", "flight_attach_app_loop_exit")
	public static function attachAppLoopExit(hostAppExit:flight._hl.HostAppExitCapability, app:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_app_loop_lifecycle")
	public static function attachAppLoopLifecycle(app:hl.Bytes, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_app_loop_exit")
	public static function detachAppLoopExit(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_dispose_app_loop")
	public static function disposeAppLoop(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_app_loop_lifecycle_signals")
	public static function enableAppLoopLifecycleSignals(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_for_each_app_loop_window")
	public static function forEachAppLoopWindow(app:hl.Bytes, visitorFn:hl.Bytes, visitorCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_app_loop_frame_rate")
	public static function getAppLoopFrameRate(app:hl.Bytes):Float;
	@:hlNative("flight", "flight_get_app_loop_main_window")
	public static function getAppLoopMainWindow(app:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_is_app_loop_running")
	public static function isAppLoopRunning(app:hl.Bytes):Bool;
	@:hlNative("flight", "flight_pause_app_loop")
	public static function pauseAppLoop(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_register_app_loop_window")
	public static function registerAppLoopWindow(app:hl.Bytes, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_resume_app_loop")
	public static function resumeAppLoop(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_app_loop_main_window")
	public static function setAppLoopMainWindow(app:hl.Bytes, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_start_app_loop")
	public static function startAppLoop(hostAppLoop:flight._hl.HostAppLoopCapability, hostLifecycle:flight._hl.HostLifecycleCapability, app:hl.Bytes, options:flight._hl.AppLoopOptions):Void;
	@:hlNative("flight", "flight_step_app_loop")
	public static function stepAppLoop(app:hl.Bytes, deltaTime:Float, options:flight._hl.AppStepOptions):Void;
	@:hlNative("flight", "flight_stop_app_loop")
	public static function stopAppLoop(app:hl.Bytes):Void;
	@:hlNative("flight", "flight_unregister_app_loop_window")
	public static function unregisterAppLoopWindow(app:hl.Bytes, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_app_window")
	public static function createAppWindow():hl.Bytes;
	@:hlNative("flight", "flight_attach_window")
	public static function attachWindow(hostWindowAttach:flight._hl.HostWindowAttachCapability, hostWindowLifecycle:flight._hl.HostWindowLifecycleCapability, win:hl.Bytes, handle:flight._hl.NativeWindowHandle, ownership:Int):Bool;
	@:hlNative("flight", "flight_attach_window_close")
	public static function attachWindowClose(hostWindowLifecycle:flight._hl.HostWindowLifecycleCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_window_drop_file")
	public static function attachWindowDropFile(hostInputDropFile:flight._hl.HostInputDropFileCapability, win:hl.Bytes, target:flight._hl.InputTargetHandle):Void;
	@:hlNative("flight", "flight_attach_window_focus")
	public static function attachWindowFocus(hostInputFocus:flight._hl.HostInputFocusCapability, win:hl.Bytes, target:flight._hl.InputTargetHandle):Void;
	@:hlNative("flight", "flight_attach_window_fullscreen")
	public static function attachWindowFullscreen(hostFullscreen:flight._hl.HostElementFullscreenCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_window_move")
	public static function attachWindowMove(hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_window_orientation")
	public static function attachWindowOrientation(hostScreenChange:flight._hl.HostScreenChangeCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_window_resize")
	public static function attachWindowResize(hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes, target:hl.Bytes):Void;
	@:hlNative("flight", "flight_attach_window_visibility")
	public static function attachWindowVisibility(hostWindowVisibility:flight._hl.HostWindowVisibilityCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_center_window")
	public static function centerWindow(hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_close_window")
	public static function closeWindow(hostWindowLifecycle:flight._hl.HostWindowLifecycleCapability, win:hl.Bytes):Bool;
	@:hlNative("flight", "flight_compute_window_device_transform")
	public static function computeWindowDeviceTransform(out:flight._hl.Matrix, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_close")
	public static function detachWindowClose(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_drop_file")
	public static function detachWindowDropFile(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_focus")
	public static function detachWindowFocus(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_fullscreen")
	public static function detachWindowFullscreen(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_move")
	public static function detachWindowMove(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_orientation")
	public static function detachWindowOrientation(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_resize")
	public static function detachWindowResize(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_detach_window_visibility")
	public static function detachWindowVisibility(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_dispose_app_window")
	public static function disposeAppWindow(win:hl.Bytes):Void;
	@:hlNative("flight", "flight_exit_app_input_pointer_lock")
	public static function exitAppInputPointerLock(state:hl.Bytes, hostInputPointerLock:flight._hl.HostInputPointerLockCapability):flight._hl.InputPointerLockExitFuture;
	@:hlNative("flight", "flight_flash_window_frame")
	public static function flashWindowFrame(hostWindowAttention:flight._hl.HostWindowAttentionCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_focus_window")
	public static function focusWindow(hostWindowFocus:flight._hl.HostWindowFocusCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_window_bounds")
	public static function getWindowBounds(out:flight._hl.WindowBounds, hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_hide_window")
	public static function hideWindow(hostWindowVisibility:flight._hl.HostWindowVisibilityCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_lock_app_input_pointer")
	public static function lockAppInputPointer(state:hl.Bytes, hostInputPointerLock:flight._hl.HostInputPointerLockCapability, target:flight._hl.InputTargetHandle):flight._hl.InputPointerLockRequestFuture;
	@:hlNative("flight", "flight_maximize_window")
	public static function maximizeWindow(hostWindowState:flight._hl.HostWindowStateCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_minimize_window")
	public static function minimizeWindow(hostWindowState:flight._hl.HostWindowStateCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_open_window")
	public static function openWindow(hostWindowLifecycle:flight._hl.HostWindowLifecycleCapability, hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes, options:flight._hl.WindowOptions):Bool;
	@:hlNative("flight", "flight_prepare_element_for_input")
	public static function prepareElementForInput(hostInputTarget:flight._hl.HostInputTargetCapability, target:flight._hl.InputTargetHandle):Void;
	@:hlNative("flight", "flight_request_window_attention")
	public static function requestWindowAttention(hostWindowAttention:flight._hl.HostWindowAttentionCapability, win:hl.Bytes, attention:Bool):Void;
	@:hlNative("flight", "flight_request_window_close")
	public static function requestWindowClose(win:hl.Bytes):Bool;
	@:hlNative("flight", "flight_restore_window")
	public static function restoreWindow(hostWindowState:flight._hl.HostWindowStateCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_window_always_on_top")
	public static function setWindowAlwaysOnTop(hostWindowZOrder:flight._hl.HostWindowZOrderCapability, win:hl.Bytes, alwaysOnTop:Bool):Void;
	@:hlNative("flight", "flight_set_window_content_protection")
	public static function setWindowContentProtection(hostWindowContentProtection:flight._hl.HostWindowContentProtectionCapability, win:hl.Bytes, enabled:Bool):Void;
	@:hlNative("flight", "flight_set_window_fullscreen")
	public static function setWindowFullscreen(hostWindowFullscreen:flight._hl.HostWindowFullscreenCapability, win:hl.Bytes, fullscreen:Bool):Void;
	@:hlNative("flight", "flight_set_window_has_shadow")
	public static function setWindowHasShadow(hostWindowShadow:flight._hl.HostWindowShadowCapability, win:hl.Bytes, hasShadow:Bool):Void;
	@:hlNative("flight", "flight_set_window_icon")
	public static function setWindowIcon(hostWindowAppearance:flight._hl.HostWindowAppearanceCapability, win:hl.Bytes, icon:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_window_maximum_size")
	public static function setWindowMaximumSize(hostWindowSizeConstraints:flight._hl.HostWindowSizeConstraintsCapability, win:hl.Bytes, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_set_window_menu_bar_visible")
	public static function setWindowMenuBarVisible(hostWindowShell:flight._hl.HostWindowShellCapability, win:hl.Bytes, visible:Bool):Void;
	@:hlNative("flight", "flight_set_window_minimum_size")
	public static function setWindowMinimumSize(hostWindowSizeConstraints:flight._hl.HostWindowSizeConstraintsCapability, win:hl.Bytes, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_set_window_opacity")
	public static function setWindowOpacity(hostWindowAppearance:flight._hl.HostWindowAppearanceCapability, win:hl.Bytes, opacity:Single):Void;
	@:hlNative("flight", "flight_set_window_parent")
	public static function setWindowParent(hostWindowHierarchy:flight._hl.HostWindowHierarchyCapability, win:hl.Bytes, parent:hl.Bytes):Void;
	@:hlNative("flight", "flight_set_window_position")
	public static function setWindowPosition(hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_set_window_progress")
	public static function setWindowProgress(hostWindowProgress:flight._hl.HostWindowProgressCapability, win:hl.Bytes, progress:Single):Void;
	@:hlNative("flight", "flight_set_window_resizable")
	public static function setWindowResizable(hostWindowSizeConstraints:flight._hl.HostWindowSizeConstraintsCapability, win:hl.Bytes, resizable:Bool):Void;
	@:hlNative("flight", "flight_set_window_size")
	public static function setWindowSize(hostWindowGeometry:flight._hl.HostWindowGeometryCapability, win:hl.Bytes, width:Single, height:Single):Void;
	@:hlNative("flight", "flight_set_window_skip_taskbar")
	public static function setWindowSkipTaskbar(hostWindowShell:flight._hl.HostWindowShellCapability, win:hl.Bytes, skip:Bool):Void;
	@:hlNative("flight", "flight_set_window_title")
	public static function setWindowTitle(hostWindowAppearance:flight._hl.HostWindowAppearanceCapability, win:hl.Bytes, title:hl.Bytes):Void;
	@:hlNative("flight", "flight_show_window")
	public static function showWindow(hostWindowVisibility:flight._hl.HostWindowVisibilityCapability, win:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_app_events")
	public static function freeAppEvents(ptr:flight._hl.AppEvents):Void;
	@:hlNative("flight", "flight_free_app_login_item")
	public static function freeAppLoginItem(ptr:flight._hl.AppLoginItem):Void;
	@:hlNative("flight", "flight_free_app_loop_ref")
	public static function freeAppLoopRef(ptr:flight._hl.AppLoop):Void;
	@:hlNative("flight", "flight_free_app_window_ref")
	public static function freeAppWindowRef(ptr:flight._hl.AppWindow):Void;
	@:hlNative("flight", "flight_free_input_pointer_lock_exit_future")
	public static function freeInputPointerLockExitFuture(ptr:flight._hl.InputPointerLockExitFuture):Void;
	@:hlNative("flight", "flight_free_input_pointer_lock_request_future")
	public static function freeInputPointerLockRequestFuture(ptr:flight._hl.InputPointerLockRequestFuture):Void;
	@:hlNative("flight", "flight_free_string")
	public static function freeString(ptr:hl.Bytes):Void;
}
