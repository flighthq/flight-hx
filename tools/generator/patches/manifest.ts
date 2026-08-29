import { definePatches } from '../src/patch/apply.ts';

export default definePatches([
  {
    expect: {
      astHash: 'sha256:bec59fc28ac2cefeb3a8ee1bd234b5142511bf77ca8db1cb9e6dde7ecdd6caea',
      kind: 'function',
    },
    fragment: 'tools/generator/patches/bodies/render-gl/createGlContextFromCanvasElement.hx',
    id: 'render-gl.create-context.bind-native-drawing-buffer-surface',
    operation: 'replaceBody',
    reason:
      'Native GL contexts lack WebGL drawingBufferWidth/Height fields, so context acquisition associates the caller-owned surface for exact live dimension reads.',
    target: {
      export: 'createGlContextFromCanvasElement',
      package: '@flighthq/render-gl',
      source: 'upstream/packages/render-gl/src/glContext.ts',
    },
  },
  {
    expect: {
      astHash: 'sha256:8f338bafdcbe00d549a1c7dde5ccd4b8f9ced16d370fb2ef500efd6e5e5efbd1',
      kind: 'function',
    },
    fragment: 'tools/generator/patches/bodies/host-web/createWebRaster2DSurfaceProvider.hx',
    id: 'host-web.create-raster-2d-surface-provider.live-dimensions',
    operation: 'replaceBody',
    reason:
      'Portable Haxe anonymous structures cannot preserve TypeScript object-literal accessors, so the web provider materializes live canvas dimension descriptors explicitly.',
    target: {
      export: 'createWebRaster2DSurfaceProvider',
      package: '@flighthq/host-web',
      source: 'upstream/packages/host-web/src/webRaster2DSurface.ts',
    },
  },
  {
    expect: {
      astHash: 'sha256:e8e8ec56ac0d693d53dc93ebf38f390809e722b38285fd85aff1e9c1d5c98d77',
      kind: 'function',
    },
    fragment: 'tools/generator/patches/bodies/entity/createEntity.hx',
    id: 'entity.create-entity.portable-runtime-slot',
    operation: 'replaceBody',
    reason:
      'Haxe cannot assign an empty structural literal to an optional unconstrained generic without an explicit cast.',
    target: {
      export: 'createEntity',
      package: '@flighthq/entity',
      source: 'upstream/packages/entity/src/entity.ts',
    },
  },
  {
    expect: {
      astHash: 'sha256:c9f7e40c68e9aa3e64b72655fb256482b9e2272f4fe1c03e91b3a09fa5f92be8',
      kind: 'function',
    },
    fragment: 'tools/generator/patches/bodies/shape/createShapeCommandArgumentCursor.hx',
    id: 'shape.create-command-argument-cursor.portable-length',
    operation: 'replaceBody',
    reason:
      'Portable Haxe anonymous structures cannot preserve a TypeScript object-literal getter, so a typed runtime class materializes its length field.',
    target: {
      export: 'createShapeCommandArgumentCursor__shapeBounds',
      package: '@flighthq/shape',
      source: 'upstream/packages/shape/src/shapeBounds.ts',
    },
  },
  {
    expect: {
      astHash: 'sha256:73591ed5d5c6b7033f7738aa4af078735da6fc138353164610269cd995ca7186',
      kind: 'function',
    },
    fragment: 'tools/generator/patches/bodies/shape/setShapeCommandArgumentCursor.hx',
    id: 'shape.set-command-argument-cursor.portable-length',
    operation: 'replaceBody',
    reason: 'Keep the typed runtime cursor length synchronized with its internal argument-count mutation.',
    target: {
      export: 'setShapeCommandArgumentCursor__shapeBounds',
      package: '@flighthq/shape',
      source: 'upstream/packages/shape/src/shapeBounds.ts',
    },
  },
]);
