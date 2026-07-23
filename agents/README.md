# Agent Documentation

This directory records the durable design and execution context for the Flight Haxe port. [`../AGENTS.md`](../AGENTS.md) is authoritative for repository-wide rules. These documents provide the details needed to apply those rules.

- [`architecture.md`](architecture.md): translation pipeline, public API, types, portability boundaries, and JavaScript test bridge.
- [`layout.md`](layout.md): current repository boundaries and generated artifact structure.
- [`patches.md`](patches.md): semantic patch model, operations, validation, and audit requirements.
- [`quality.md`](quality.md): implemented npm scripts, checks, test layers, and completion gates.
- [`plan.md`](plan.md): completed implementation phases and the upstream-update workflow.
- [`status.md`](status.md): current decisions, verified state, prerequisites, and release decisions.
- [`flight-port-core.md`](flight-port-core.md): plan to extract the language-neutral kernel into a shared core with Haxe and Rust emitters over one oracle.

Update the narrowest applicable document when direction changes. Avoid copying the same rule into several files; link back to its authoritative location instead.
