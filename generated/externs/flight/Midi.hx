package flight;

#if (js && flight_esm)
extern inline function getMidiPortConnection(port:MidiPort):MidiPortConnectionOutcome {
	return flight._js._fn.Midi.getMidiPortConnection(port);
}
#else
extern inline function getMidiPortConnection(port:MidiPort):MidiPortConnectionOutcome {
#if hl
	return flight._hl._fn.Midi.getMidiPortConnection(port);
#elseif cpp
	return flight._cpp._fn.Midi.getMidiPortConnection(port);
#elseif (js && flight_esm)
	return flight._js._fn.Midi.getMidiPortConnection(port);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMidiPortState(port:MidiPort):MidiPortStateOutcome {
	return flight._js._fn.Midi.getMidiPortState(port);
}
#else
extern inline function getMidiPortState(port:MidiPort):MidiPortStateOutcome {
#if hl
	return flight._hl._fn.Midi.getMidiPortState(port);
#elseif cpp
	return flight._cpp._fn.Midi.getMidiPortState(port);
#elseif (js && flight_esm)
	return flight._js._fn.Midi.getMidiPortState(port);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function sendMidiMessage(port:Dynamic, data:Dynamic, timestamp:Null<Float>):MidiMessageSendOutcome {
	return flight._js._fn.Midi.sendMidiMessage(port, data, timestamp);
}
#else
extern inline function sendMidiMessage(port:Dynamic, data:Dynamic, dataLen:Int, timestamp:Float):MidiMessageSendOutcome {
#if hl
	return flight._hl._fn.Midi.sendMidiMessage(port, data, dataLen, timestamp);
#elseif cpp
	return flight._cpp._fn.Midi.sendMidiMessage(port, data, dataLen, timestamp);
#elseif (js && flight_esm)
	return flight._js._fn.Midi.sendMidiMessage(port, data, dataLen, timestamp);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMidiAccessStateSubscription():Dynamic {
	return flight._js._fn.Midi.createMidiAccessStateSubscription();
}
#else
extern inline function createMidiAccessStateSubscription():Dynamic {
#if hl
	return flight._hl._fn.Midi.createMidiAccessStateSubscription();
#elseif cpp
	return flight._cpp._fn.Midi.createMidiAccessStateSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Midi.createMidiAccessStateSubscription();
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMidiInputMessageSubscription():Dynamic {
	return flight._js._fn.Midi.createMidiInputMessageSubscription();
}
#else
extern inline function createMidiInputMessageSubscription():Dynamic {
#if hl
	return flight._hl._fn.Midi.createMidiInputMessageSubscription();
#elseif cpp
	return flight._cpp._fn.Midi.createMidiInputMessageSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Midi.createMidiInputMessageSubscription();
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMidiPortStateSubscription():Dynamic {
	return flight._js._fn.Midi.createMidiPortStateSubscription();
}
#else
extern inline function createMidiPortStateSubscription():Dynamic {
#if hl
	return flight._hl._fn.Midi.createMidiPortStateSubscription();
#elseif cpp
	return flight._cpp._fn.Midi.createMidiPortStateSubscription();
#elseif (js && flight_esm)
	return flight._js._fn.Midi.createMidiPortStateSubscription();
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiPortConnectionOutcome(ptr:MidiPortConnectionOutcome):Void {
	flight._js._fn.Midi.freeMidiPortConnectionOutcome(ptr);
}
#else
extern inline function freeMidiPortConnectionOutcome(ptr:MidiPortConnectionOutcome):Void {
#if hl
	flight._hl._fn.Midi.freeMidiPortConnectionOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiPortConnectionOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiPortConnectionOutcome(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiPortStateOutcome(ptr:MidiPortStateOutcome):Void {
	flight._js._fn.Midi.freeMidiPortStateOutcome(ptr);
}
#else
extern inline function freeMidiPortStateOutcome(ptr:MidiPortStateOutcome):Void {
#if hl
	flight._hl._fn.Midi.freeMidiPortStateOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiPortStateOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiPortStateOutcome(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiMessageSendOutcome(ptr:MidiMessageSendOutcome):Void {
	flight._js._fn.Midi.freeMidiMessageSendOutcome(ptr);
}
#else
extern inline function freeMidiMessageSendOutcome(ptr:MidiMessageSendOutcome):Void {
#if hl
	flight._hl._fn.Midi.freeMidiMessageSendOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiMessageSendOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiMessageSendOutcome(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiAccessStateSubscriptionRef(ptr:MidiAccessStateSubscription):Void {
	flight._js._fn.Midi.freeMidiAccessStateSubscriptionRef(ptr);
}
#else
extern inline function freeMidiAccessStateSubscriptionRef(ptr:MidiAccessStateSubscription):Void {
#if hl
	flight._hl._fn.Midi.freeMidiAccessStateSubscriptionRef(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiAccessStateSubscriptionRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiAccessStateSubscriptionRef(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiInputMessageSubscriptionRef(ptr:MidiInputMessageSubscription):Void {
	flight._js._fn.Midi.freeMidiInputMessageSubscriptionRef(ptr);
}
#else
extern inline function freeMidiInputMessageSubscriptionRef(ptr:MidiInputMessageSubscription):Void {
#if hl
	flight._hl._fn.Midi.freeMidiInputMessageSubscriptionRef(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiInputMessageSubscriptionRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiInputMessageSubscriptionRef(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMidiPortStateSubscriptionRef(ptr:MidiPortStateSubscription):Void {
	flight._js._fn.Midi.freeMidiPortStateSubscriptionRef(ptr);
}
#else
extern inline function freeMidiPortStateSubscriptionRef(ptr:MidiPortStateSubscription):Void {
#if hl
	flight._hl._fn.Midi.freeMidiPortStateSubscriptionRef(ptr);
#elseif cpp
	flight._cpp._fn.Midi.freeMidiPortStateSubscriptionRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Midi.freeMidiPortStateSubscriptionRef(ptr);
#else
	#error "flight.Midi: no backend for this target."
#end
}
#end
