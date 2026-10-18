// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function concatKindMap<T>(base:flight._internal._Map<flight.Kind, T>, overlay:flight._internal._Map<flight.Kind, T>):flight._internal._Map<flight.Kind, T> {
  return flight._cpp._attempt.Attempt_Registry_concatKindMap.concatKindMap(base, overlay);
}

extern inline function createOrdinalTable<T>(vocabulary:Array<flight.Kind>):flight.NonEntityCreateResult<flight.OrdinalTable<T>, String> {
  return flight._cpp._attempt.Attempt_Registry_createOrdinalTable.createOrdinalTable(vocabulary);
}

extern inline function getKindMapKeys(out:Array<flight.Kind>, map:flight._internal._Map<flight.Kind, Dynamic>):Void {
  flight._cpp._attempt.Attempt_Registry_getKindMapKeys.getKindMapKeys(out, map);
}

extern inline function getOrdinalTableEntry<T>(table:flight.OrdinalTable<T>, ordinal:Float):Null<T> {
  return flight._cpp._attempt.Attempt_Registry_getOrdinalTableEntry.getOrdinalTableEntry(table, ordinal);
}

extern inline function withKindMapEntry<T>(map:flight._internal._Map<flight.Kind, T>, key:flight.Kind, value:T):flight._internal._Map<flight.Kind, T> {
  return flight._cpp._attempt.Attempt_Registry_withKindMapEntry.withKindMapEntry(map, key, value);
}

extern inline function withoutKindMapEntry<T>(map:flight._internal._Map<flight.Kind, T>, key:flight.Kind):flight._internal._Map<flight.Kind, T> {
  return flight._cpp._attempt.Attempt_Registry_withoutKindMapEntry.withoutKindMapEntry(map, key);
}
