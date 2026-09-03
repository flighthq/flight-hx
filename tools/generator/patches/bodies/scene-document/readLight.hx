if (!isMapping__flightDocumentText(value) || !hasOnlyKeys__flightDocumentText(value, LIGHT_KEYS__flightDocumentText)) {
  return refuse__flightDocumentText(context, path);
}
final descriptorRaw:Dynamic = _Runtime.getIndex(value, 'descriptor');
final descriptorPath = appendPath__flightDocumentText(path, 'descriptor');
if (!isMapping__flightDocumentText(descriptorRaw)) return refuse__flightDocumentText(context, descriptorPath);
final kind:Dynamic = _Runtime.getIndex(descriptorRaw, 'kind');
if (_Runtime.typeofValue(kind) != 'string') {
  return refuse__flightDocumentText(context, appendPath__flightDocumentText(descriptorPath, 'kind'));
}
final descriptorFields = copyFlightDocumentFields__flightDocumentText(
  descriptorRaw,
  ['kind'],
  descriptorPath,
  context
);
if (descriptorFields == null) return null;
#if flight_struct_typedef
final descriptor:Light = cast flight._internal.DynamicObject.assign(
  _Runtime.objectFromPairs([
    { key: EntityRuntimeKey, value: _Runtime.UNDEFINED },
    { key: 'kind', value: kind },
  ]),
  descriptorFields
);
#else
final descriptor:Light = { kind: cast kind };
_Runtime.setIndex(descriptor, EntityRuntimeKey, _Runtime.UNDEFINED);
flight._internal.DynamicObject.assign(descriptor, descriptorFields);
#end
final transform = readTransform3D__flightDocumentText(
  _Runtime.getIndex(value, 'transform'),
  appendPath__flightDocumentText(path, 'transform'),
  context
);
if (transform == null) return null;
final light:Scene3DDocumentLight = cast { descriptor: descriptor, transform: transform };
final name:Dynamic = _Runtime.getIndex(value, 'name');
if (name != _Runtime.UNDEFINED) {
  if (_Runtime.typeofValue(name) != 'string') {
    return refuse__flightDocumentText(context, appendPath__flightDocumentText(path, 'name'));
  }
  light.name = name;
}
final node = readOptionalIndex__flightDocumentText(
  _Runtime.getIndex(value, 'node'),
  appendPath__flightDocumentText(path, 'node'),
  context
);
if (node == INVALID_OPTIONAL_INDEX__flightDocumentText) return null;
if (node != null) light.node = cast node;
return light;
