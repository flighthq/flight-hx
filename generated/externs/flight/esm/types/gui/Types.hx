package flight.esm.types.gui;

#if (js && flight_esm)
typedef ButtonController = Dynamic;

typedef ButtonControllerOptions = { ?disabled:Null<Bool>, ?downState:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?hitArea:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?interactiveStateBinding:Null<flight.esm.types.interaction_contract.Types.NodeInteractiveStateBinding>, ?overState:Null<flight.esm.types.scene2d_contract.Types.Node2D>, upState:flight.esm.types.scene2d_contract.Types.Node2D, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ButtonControllerSignals = { onClick:flight.esm.types.signals.Types.Signal<Void>, onPress:flight.esm.types.signals.Types.Signal<Void>, onRelease:flight.esm.types.signals.Types.Signal<Void> };

typedef ComboBoxController = Dynamic;

typedef ComboBoxControllerOptions = { button:flight.esm.types.gui.Types.ButtonController, ?display:Null<flight.esm.types.scene2d_contract.Types.Node2D>, list:flight.esm.types.gui.Types.ListController, ?open:Null<Bool>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ComboBoxControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float>, onOpenChange:flight.esm.types.signals.Types.Signal<Bool> };

typedef GuiControllerOptions = { ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef GuiDialog = Dynamic;

typedef GuiDialogCloseReason = String;

typedef GuiDialogCloseResult = { entryId:String, reason:flight.esm.types.gui.Types.GuiDialogCloseReason, ?value:Dynamic };

typedef GuiDialogEntry = { ?dismissOnBackdrop:Null<Bool>, id:String, ?initialFocus:Null<flight.esm.types.scene2d_contract.Types.Node2D>, root:flight.esm.types.scene2d_contract.Types.Node2D };

typedef GuiDialogOptions = { ?backdrop:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?focusManager:Null<flight.esm.types.interaction.Types.FocusManager<flight.esm.types.scene2d_contract.Types.Node2D>>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef GuiDialogSignals = { onActiveChange:flight.esm.types.signals.Types.Signal<Null<flight.esm.types.gui.Types.GuiDialogEntry>>, onClose:flight.esm.types.signals.Types.Signal<flight.esm.types.gui.Types.GuiDialogCloseResult>, onQueueChange:flight.esm.types.signals.Types.Signal<Void> };

typedef GuiOrientation = String;

typedef GuiTransitionDescriptor = { run:((request:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionRequest<flight.esm.types.scene2d_contract.Types.Node2D, flight.esm.types.interaction_contract.Types.NodeInteractiveStateProperty>) -> Void) };

typedef GuiTransitionProperty = flight.esm.types.interaction_contract.Types.NodeInteractiveStateProperty;

typedef GuiTransitionRequest = { apply:((?value:Dynamic) -> Void), from:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionValue, property:flight.esm.types.interaction_contract.Types.NodeInteractiveStateProperty, target:flight.esm.types.scene2d_contract.Types.Node2D, value:flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionValue };

typedef GuiTransitionValue = flight.esm.types.scene_document.Types.NodeInteractiveStateTransitionValue;

typedef ListController = Dynamic;

typedef ListControllerOptions = { content:flight.esm.types.scene2d_contract.Types.Node2D, items:Array<flight.esm.types.scene2d_contract.Types.Node2D>, ?scrollBar:Null<flight.esm.types.gui.Types.ScrollBarController>, ?selectable:Null<Bool>, ?selectedIndex:Null<Float>, viewport:flight.esm.types.scene2d_contract.Types.Node2D, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ListControllerSignals = { onActivate:flight.esm.types.signals.Types.Signal<Float>, onSelect:flight.esm.types.signals.Types.Signal<Float> };

typedef ProgressBarController = Dynamic;

typedef ProgressBarControllerOptions = { fill:flight.esm.types.scene2d_contract.Types.Node2D, ?maximum:Null<Float>, ?minimum:Null<Float>, ?orientation:Null<String>, track:flight.esm.types.scene2d_contract.Types.Node2D, ?value:Null<Float>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef RadioGroupController = Dynamic;

typedef RadioGroupControllerOptions = { ?selectedIndex:Null<Float>, toggles:Array<flight.esm.types.gui.Types.ToggleController> };

typedef RadioGroupControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float> };

typedef ScrollBarController = Dynamic;

typedef ScrollBarControllerOptions = { ?downButton:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?lineSize:Null<Float>, ?maximum:Null<Float>, ?minimum:Null<Float>, ?orientation:Null<String>, ?pageSize:Null<Float>, ?repeatInterval:Null<Float>, thumb:flight.esm.types.scene2d_contract.Types.Node2D, track:flight.esm.types.scene2d_contract.Types.Node2D, ?upButton:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?value:Null<Float>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ScrollBarControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float> };

typedef ScrollViewController = Dynamic;

typedef ScrollViewControllerOptions = { content:flight.esm.types.scene2d_contract.Types.Node2D, ?horizontalScrollBar:Null<flight.esm.types.gui.Types.ScrollBarController>, ?mouseWheelEnabled:Null<Bool>, viewport:flight.esm.types.scene2d_contract.Types.Node2D, ?verticalScrollBar:Null<flight.esm.types.gui.Types.ScrollBarController>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ScrollViewControllerSignals = { onScroll:flight.esm.types.signals.Types.Signal<Array<Float>> };

typedef SliderController = Dynamic;

typedef SliderControllerOptions = { ?maximum:Null<Float>, ?minimum:Null<Float>, ?orientation:Null<String>, ?step:Null<Float>, thumb:flight.esm.types.scene2d_contract.Types.Node2D, track:flight.esm.types.scene2d_contract.Types.Node2D, ?value:Null<Float>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef SliderControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float> };

typedef SplitPaneController = Dynamic;

typedef SplitPaneControllerOptions = { divider:flight.esm.types.scene2d_contract.Types.Node2D, firstRegion:flight.esm.types.scene2d_contract.Types.Node2D, ?maximumFirst:Null<Float>, ?minimumFirst:Null<Float>, ?minimumSecond:Null<Float>, ?orientation:Null<String>, ?position:Null<Float>, secondRegion:flight.esm.types.scene2d_contract.Types.Node2D, ?totalSize:Null<Float>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef SplitPaneControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float> };

typedef TabBarController = Dynamic;

typedef TabBarControllerItem = { selectedState:flight.esm.types.scene2d_contract.Types.Node2D, unselectedState:flight.esm.types.scene2d_contract.Types.Node2D };

typedef TabBarControllerOptions = { ?selectedIndex:Null<Float>, tabs:Array<flight.esm.types.gui.Types.TabBarControllerItem>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef TabBarControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Float> };

typedef TextInputController = Dynamic;

typedef TextInputControllerKeyboardData = flight.esm.types.input.Types.InputKeyboardData;

typedef TextInputControllerOptions = { ?background:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?caret:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?input:Null<flight.esm.types.textinput_contract.Types.TextInputSource>, ?manager:Null<flight.esm.types.textinput_contract.Types.TextInputManagerRaw>, textField:flight.esm.types.text.Types.RichText, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef TextInputControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<String>, onSubmit:flight.esm.types.signals.Types.Signal<String> };

typedef ToggleController = Dynamic;

typedef ToggleControllerOptions = { ?checked:Null<Bool>, checkedState:flight.esm.types.scene2d_contract.Types.Node2D, ?label:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?overState:Null<flight.esm.types.scene2d_contract.Types.Node2D>, uncheckedState:flight.esm.types.scene2d_contract.Types.Node2D, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef ToggleControllerSignals = { onChange:flight.esm.types.signals.Types.Signal<Bool> };

typedef TooltipController = Dynamic;

typedef TooltipControllerOptions = { content:flight.esm.types.scene2d_contract.Types.Node2D, ?delay:Null<Float>, ?offset:Null<flight.esm.types.geometry.Types.Vector2Like>, target:flight.esm.types.scene2d_contract.Types.Node2D, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef TreeViewController = Dynamic;

typedef TreeViewControllerItem = { ?children:Null<Array<flight.esm.types.gui.Types.TreeViewControllerItem>>, ?expanded:Null<Bool>, visual:flight.esm.types.scene2d_contract.Types.Node2D };

typedef TreeViewControllerOptions = { items:Array<flight.esm.types.gui.Types.TreeViewControllerItem>, ?selectedItem:Null<flight.esm.types.gui.Types.TreeViewControllerItem>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef TreeViewControllerSignals = { onActivate:flight.esm.types.signals.Types.Signal<flight.esm.types.gui.Types.TreeViewControllerItem>, onExpandChange:flight.esm.types.signals.Types.Signal<Array<Dynamic>>, onSelect:flight.esm.types.signals.Types.Signal<Null<flight.esm.types.gui.Types.TreeViewControllerItem>> };

typedef WindowController = Dynamic;

typedef WindowControllerOptions = { ?closeButton:Null<flight.esm.types.gui.Types.ButtonController>, ?content:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?draggable:Null<Bool>, frame:flight.esm.types.scene2d_contract.Types.Node2D, ?minimumHeight:Null<Float>, ?minimumWidth:Null<Float>, ?resizable:Null<Bool>, ?resizeHandle:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?titleBar:Null<flight.esm.types.scene2d_contract.Types.Node2D>, ?transition:Null<flight.esm.types.gui.Types.GuiTransitionDescriptor> };

typedef WindowControllerSignals = { onClose:flight.esm.types.signals.Types.Signal<Void>, onMove:flight.esm.types.signals.Types.Signal<Array<Float>>, onResize:flight.esm.types.signals.Types.Signal<Array<Float>> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
