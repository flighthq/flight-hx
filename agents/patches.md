# Semantic Patches

Patches are the maintained escape hatch for exceptional translation behavior. They are not edits applied to generated text and they are not a parallel manual port.

## Placement in the Pipeline

```text
TypeScript AST
  → normalized intermediate model
  → Haxe ownership and semantic lowering
  → semantic patches
  → deterministic Haxe emission
```

Patch targets use upstream identity, which remains stable even if Haxe output is regrouped:

```text
npm package + source-relative path + exported symbol
```

Do not target a generated line number, formatted code substring, or incidental output filename.

## Manifest Shape

The manifest is typed TypeScript so target fields and operations can be validated without inventing another configuration language:

```ts
export default definePatches([
  {
    id: 'entity.create-entity.portable-runtime-slot',
    target: {
      package: '@flighthq/entity',
      source: 'upstream/packages/entity/src/entity.ts',
      export: 'createEntity',
    },
    expect: {
      kind: 'function',
      astHash: 'sha256:...',
    },
    operation: 'replaceBody',
    fragment: 'patches/bodies/entity/createEntity.hx',
    reason: 'Explain the Haxe semantic requirement, not the work history.',
  },
]);
```

The Haxe fragment is stored separately for syntax highlighting and review. Inline fragments may be allowed for very small type/name operations, but substantial Haxe belongs in a fragment file.

## Supported Operations

- `rename`: override an emitted Haxe identifier.
- `replaceType`: replace one translated type expression.
- `replaceBody`: preserve a generated signature and documentation while replacing the implementation body.
- `remove`: explicitly exclude a declaration with a required reason and coverage classification.

Prefer the narrowest operation that expresses the semantic exception. Add a new operation to the typed model, validator, audit, and tests before using it in the manifest; do not invent manifest fields that the patch engine ignores.

## Fingerprints and Drift

Every patch carries a normalized AST fingerprint for the declaration or module it expects. The fingerprint excludes formatting-only changes but includes semantic shape: declaration kind, name, parameters, types, modifiers, and normalized body.

Generation fails when a patch:

- matches nothing;
- matches more than one target;
- sees a changed fingerprint;
- conflicts with another patch;
- references a missing fragment;
- leaves an invalid intermediate model;
- suppresses an export without a reason.

Updating a fingerprint is an explicit review action. There is no automatic "accept all drift" mode in CI.

## Ordering and Conflicts

Patch order is deterministic. Independent patches may be sorted by stable `id`. Two patches that mutate the same property conflict unless one explicitly declares that it follows the other. Hidden last-write-wins behavior is forbidden.

Recurring exceptions should move into named lowering rules with fixture coverage. The patch audit should make unusually broad or frequently repeated patches easy to identify.

## Audit Output

Every full generation emits a human-readable and machine-readable audit:

```text
Applied:     18
Applied:      1
Stale:        0
Unmatched:    0
Conflicting:  0
```

Each record includes the patch id, target, operation, reason, and source fingerprint. Stale, unmatched, ambiguous, duplicate-id, or conflicting patches make generation and CI fail. The current audit contains one `replaceBody` patch and zero stale, unmatched, or conflicting entries.
