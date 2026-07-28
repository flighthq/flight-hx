import path from 'node:path';
import ts from 'typescript';

export interface UpstreamTypeScriptProgram {
  checker: ts.TypeChecker;
  program: ts.Program;
}

const cache = new Map<string, UpstreamTypeScriptProgram>();

/**
 * Returns the canonical TypeScript program for the pinned upstream checkout.
 *
 * Lowering previously reparsed each file in isolation, which discarded
 * contextual and imported type information. Keep one program per workspace so
 * receiver bindings can use TypeScript's actual type graph without rebuilding
 * it for every generated module.
 */
export function upstreamTypeScriptProgram(workspaceDirectory: string): UpstreamTypeScriptProgram {
  const root = path.resolve(workspaceDirectory);
  const cached = cache.get(root);
  if (cached) return cached;

  const configPath = path.join(root, 'upstream', 'tsconfig.json');
  const parsed = ts.getParsedCommandLineOfConfigFile(
    configPath,
    {},
    {
      ...ts.sys,
      onUnRecoverableConfigFileDiagnostic: (diagnostic) => {
        throw new Error(ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n'));
      },
    },
  );
  if (!parsed) throw new Error(`Unable to parse upstream TypeScript configuration: ${configPath}`);

  const program = ts.createProgram({
    options: parsed.options,
    rootNames: parsed.fileNames,
    ...(parsed.projectReferences ? { projectReferences: parsed.projectReferences } : {}),
  });
  const result = { checker: program.getTypeChecker(), program };
  cache.set(root, result);
  return result;
}
