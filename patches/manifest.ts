import { definePatches } from '../generator/src/patch/apply.ts';

export default definePatches([
  {
    expect: {
      astHash: 'sha256:e8e8ec56ac0d693d53dc93ebf38f390809e722b38285fd85aff1e9c1d5c98d77',
      kind: 'function',
    },
    fragment: 'patches/bodies/entity/createEntity.hx',
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
]);
