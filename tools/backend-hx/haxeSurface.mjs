import { basename } from 'node:path';

export function buildTranspiledBackendSurface(externFiles, transpiledFiles) {
  const implementations = collectImplementations(transpiledFiles);
  const publicSurface = collectExternSurface(externFiles);
  const types = publicSurface.types.map((declaration) => matchType(declaration, implementations.types));
  const functions = publicSurface.functions.map((declaration) =>
    matchValue(declaration, implementations.functions, 'function'),
  );
  const values = publicSurface.values.map((declaration) => matchValue(declaration, implementations.values, 'value'));

  const supportedTypes = types.filter(isSupported);
  const supportedFunctions = functions.filter(isSupported);
  const supportedValues = values.filter(isSupported);
  const files = mergeGeneratedFiles([
    ...supportedTypes.flatMap(emitTypeAliases),
    ...emitFunctionHolders(supportedFunctions, supportedValues),
    ...emitPublicHolders(supportedFunctions, supportedValues),
  ]).sort((left, right) => compareText(left.path, right.path));

  return {
    files,
    report: {
      schema: 'flight-hx-transpiled-public-surface/1',
      summary: {
        publicFunctions: functions.length,
        publicTypes: types.length,
        publicValues: values.length,
        supportedFunctions: supportedFunctions.length,
        supportedTypes: supportedTypes.length,
        supportedValues: supportedValues.length,
        unavailableFunctions: functions.length - supportedFunctions.length,
        unavailableTypes: types.length - supportedTypes.length,
        unavailableValues: values.length - supportedValues.length,
      },
      supported: {
        functions: supportedFunctions.map(publicReportEntry),
        types: supportedTypes.map(publicReportEntry),
        values: supportedValues.map(publicReportEntry),
      },
      unavailable: {
        functions: functions.filter((entry) => !isSupported(entry)).map(unavailableReportEntry),
        types: types.filter((entry) => !isSupported(entry)).map(unavailableReportEntry),
        values: values.filter((entry) => !isSupported(entry)).map(unavailableReportEntry),
      },
    },
  };
}

export function collectExternSurface(files, publicTypeNames = inferPublicExternTypeNames(files)) {
  const functions = [];
  const types = [];
  const values = [];
  for (const file of files) {
    const typeMatch = /^flight\/_js\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (typeMatch) {
      if (!publicTypeNames.has(typeMatch[1])) continue;
      const declaration = parseTypeDeclaration(file.contents, typeMatch[1]);
      if (!declaration) throw new Error(`Extern ${file.path} has no matching public type declaration`);
      types.push({
        ...declaration,
        externPath: file.path,
        kind: 'type',
        publicName: typeMatch[1],
      });
      continue;
    }

    const holderMatch = /^flight\/_js\/_fn\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (!holderMatch) continue;
    const sourcePackage = /@:jsImport\("(@flighthq\/[^/]+)\/contract"\)/u.exec(file.contents)?.[1];
    if (!sourcePackage) throw new Error(`Extern holder ${file.path} has no @:jsImport package contract`);
    const members = parseModuleMembers(file.contents, '  static ');
    for (const declaration of members.functions) {
      functions.push({
        ...declaration,
        externPath: file.path,
        holder: holderMatch[1],
        kind: 'function',
        publicName: declaration.name,
        sourcePackage,
      });
    }
    for (const declaration of members.values) {
      values.push({
        ...declaration,
        externPath: file.path,
        holder: holderMatch[1],
        kind: 'value',
        publicName: declaration.name,
        sourcePackage,
      });
    }
  }
  return {
    functions: functions.sort(comparePublicEntries),
    types: types.sort(comparePublicEntries),
    values: values.sort(comparePublicEntries),
  };
}

function inferPublicExternTypeNames(files) {
  const names = new Set();
  for (const file of files) {
    const match = /^flight\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (match && parseTypeDeclaration(file.contents, match[1])) names.add(match[1]);
  }
  return names;
}

export function collectPublicHaxeSurface(files) {
  const functions = [];
  const types = [];
  const values = [];
  for (const file of files) {
    const moduleMatch = /^flight\/([A-Za-z_][A-Za-z0-9_]*)\.hx$/u.exec(file.path);
    if (!moduleMatch) continue;
    const members = parseModuleMembers(file.contents);
    for (const declaration of members.functions) {
      functions.push({ ...declaration, holder: moduleMatch[1], kind: 'function', publicName: declaration.name });
    }
    for (const declaration of members.types) {
      types.push({ ...declaration, kind: 'type', publicName: declaration.name });
    }
    for (const declaration of members.values) {
      values.push({ ...declaration, holder: moduleMatch[1], kind: 'value', publicName: declaration.name });
    }
  }
  return {
    functions: functions.sort(comparePublicEntries),
    types: types.sort(comparePublicEntries),
    values: values.sort(comparePublicEntries),
  };
}

export function parseModuleMembers(contents, prefix = '') {
  const functions = [];
  const types = [];
  const values = [];
  let nativeName;
  for (const line of contents.split('\n')) {
    const native = new RegExp(`^${escapeRegExp(prefix)}@:native\\("([^"]+)"\\)$`, 'u').exec(line);
    if (native) {
      nativeName = native[1];
      continue;
    }
    const functionDeclaration = parseFunctionDeclaration(line, prefix);
    if (functionDeclaration) {
      functions.push({ ...functionDeclaration, sourceName: nativeName ?? functionDeclaration.name });
      nativeName = undefined;
      continue;
    }
    const valueDeclaration = parseValueDeclaration(line, prefix);
    if (valueDeclaration) {
      values.push({ ...valueDeclaration, sourceName: nativeName ?? valueDeclaration.name });
      nativeName = undefined;
      continue;
    }
    if (prefix === '') {
      const typeDeclaration = parseTypeDeclarationLine(line);
      if (typeDeclaration) types.push(typeDeclaration);
    }
    if (line.trim() && !line.trim().startsWith('@:')) nativeName = undefined;
  }
  return { functions, types, values };
}

function collectImplementations(files) {
  const functions = new Map();
  const types = new Map();
  const values = new Map();
  for (const file of files) {
    if (!/^flight\/_hx\/(?!_fn\/)[^/]+\/.+\.hx$/u.test(file.path)) continue;
    const sourcePackage = /from (@flighthq\/[^/]+)\//u.exec(file.contents)?.[1];
    const targetPackage = /^package ([^;]+);$/mu.exec(file.contents)?.[1];
    if (!sourcePackage || !targetPackage) {
      throw new Error(`Transpiled module ${file.path} lacks compiler source or Haxe package provenance`);
    }
    const moduleName = basename(file.path, '.hx');
    const imports = [...file.contents.matchAll(/^import ([^;]+);$/gmu)].map((match) => match[1]);
    const members = parseModuleMembers(file.contents);
    const siblingTypeTargets = new Map(
      members.types.map((declaration) => [
        declaration.name,
        declaration.name === moduleName
          ? `${targetPackage}.${moduleName}`
          : `${targetPackage}.${moduleName}.${declaration.name}`,
      ]),
    );
    for (const declaration of members.functions) {
      addCandidate(functions, `${sourcePackage}\0${declaration.sourceName}`, {
        ...declaration,
        imports,
        implementationPath: file.path,
        target: `${targetPackage}.${moduleName}.${declaration.name}`,
      });
    }
    for (const declaration of members.values) {
      addCandidate(values, `${sourcePackage}\0${declaration.sourceName}`, {
        ...declaration,
        imports,
        implementationPath: file.path,
        target: `${targetPackage}.${moduleName}.${declaration.name}`,
      });
    }
    for (const declaration of members.types) {
      addCandidate(types, declaration.name, {
        ...declaration,
        imports: [
          ...imports,
          ...[...siblingTypeTargets]
            .filter(([name]) => name !== declaration.name)
            .map(([, target]) => target),
        ],
        implementationPath: file.path,
        target: siblingTypeTargets.get(declaration.name),
      });
    }
  }
  return { functions, types, values };
}

function matchType(declaration, implementations) {
  return match(declaration, implementations.get(declaration.publicName) ?? []);
}

function matchValue(declaration, implementations, kind) {
  const candidates = implementations.get(`${declaration.sourcePackage}\0${declaration.sourceName}`) ?? [];
  if (
    kind === 'function' &&
    candidates.length === 1 &&
    declaration.returnType !== 'Void' &&
    candidates[0].returnType === 'Void'
  ) {
    return { ...declaration, unavailableReason: 'incompatible-void-return' };
  }
  return match(declaration, candidates, kind);
}

function match(declaration, candidates) {
  if (candidates.length === 1) return { ...declaration, implementation: candidates[0] };
  return {
    ...declaration,
    unavailableReason: candidates.length === 0 ? 'compiler-refused-or-not-emitted' : 'ambiguous-implementation',
    ...(candidates.length > 1 ? { candidates: candidates.map(({ target }) => target).sort(compareText) } : {}),
  };
}

function emitTypeAliases(entry) {
  const implementationParameters = entry.implementation.typeParameters;
  const publicParameters = entry.typeParameters;
  const implementationArguments = typeArguments(implementationParameters);
  const publicArguments = typeArguments(publicParameters);
  const imports = [...new Set(entry.implementation.imports)].map((target) => `import ${target};`).join('\n');
  const header = '// Generated by tools/backend-hx from the compiler-emitted public surface. Do not edit.\n';
  return [
    {
      contents: `${header}package flight._hx;\n${imports ? `\n${imports}\n` : ''}\ntypedef ${entry.publicName}${implementationParameters} = ${entry.implementation.target}${implementationArguments};\n`,
      path: `flight/_hx/${entry.publicName}.hx`,
    },
    {
      contents: `${header}package flight;\n\ntypedef ${entry.publicName}${publicParameters} = flight._hx.${entry.publicName}${publicArguments};\n`,
      path: `flight/${entry.publicName}.hx`,
    },
  ];
}

function emitFunctionHolders(functions, values) {
  const holders = new Map();
  for (const entry of [...functions, ...values]) {
    const members = holders.get(entry.holder) ?? [];
    members.push(entry);
    holders.set(entry.holder, members);
  }
  return [...holders]
    .sort(([left], [right]) => compareText(left, right))
    .map(([holder, members]) => ({
      contents: `// Generated by tools/backend-hx from the compiler-emitted public surface. Do not edit.\npackage flight._hx._fn;\n\n${members
        .sort(comparePublicEntries)
        .map((entry) => (entry.kind === 'function' ? emitFunction(entry) : emitValue(entry)))
        .join('\n\n')}\n`,
      path: `flight/_hx/_fn/${holder}.hx`,
    }));
}

function emitPublicHolders(functions, values) {
  const holders = new Map();
  for (const entry of [...functions, ...values]) {
    const members = holders.get(entry.holder) ?? [];
    members.push(entry);
    holders.set(entry.holder, members);
  }
  return [...holders]
    .sort(([left], [right]) => compareText(left, right))
    .map(([holder, members]) => ({
      contents: `// Generated by tools/backend-hx from the compiler-emitted public surface. Do not edit.\npackage flight;\n\n${members
        .sort(comparePublicEntries)
        .map((entry) => (entry.kind === 'function' ? emitPublicFunction(entry) : emitPublicValue(entry)))
        .join('\n\n')}\n`,
      path: `flight/${holder}.hx`,
    }));
}

function emitFunction(entry) {
  const arguments_ = entry.parameters.map(({ name, rest }) => (rest ? `...${name}` : `cast ${name}`)).join(', ');
  const call = `${entry.implementation.target}(${arguments_})`;
  return `inline ${entry.signature} {\n  ${entry.returnType === 'Void' ? '' : 'return cast '}${call};\n}`;
}

function emitValue(entry) {
  if (entry.implementation.declarationKind === 'var') {
    return `var ${entry.publicName}(get, set):${entry.valueType};\n\ninline function get_${entry.publicName}():${entry.valueType} return ${entry.implementation.target};\n\ninline function set_${entry.publicName}(value:${entry.valueType}):${entry.valueType} return ${entry.implementation.target} = value;`;
  }
  return `final ${entry.publicName}:${entry.valueType} = cast ${entry.implementation.target};`;
}

function emitPublicFunction(entry) {
  const arguments_ = entry.parameters.map(({ name, rest }) => `${rest ? '...' : ''}${name}`).join(', ');
  const call = `flight._hx._fn.${entry.holder}.${entry.publicName}(${arguments_})`;
  return `inline ${entry.signature} {\n  ${entry.returnType === 'Void' ? '' : 'return '}${call};\n}`;
}

function emitPublicValue(entry) {
  if (entry.implementation.declarationKind === 'var') {
    return `var ${entry.publicName}(get, set):${entry.valueType};\n\ninline function get_${entry.publicName}():${entry.valueType} return flight._hx._fn.${entry.holder}.${entry.publicName};\n\ninline function set_${entry.publicName}(value:${entry.valueType}):${entry.valueType} return flight._hx._fn.${entry.holder}.${entry.publicName} = value;`;
  }
  return `final ${entry.publicName}:${entry.valueType} = flight._hx._fn.${entry.holder}.${entry.publicName};`;
}

function mergeGeneratedFiles(files) {
  const byPath = new Map();
  for (const file of files) {
    const packageMatch = /^\/\/ Generated by tools\/backend-hx[^\n]*\npackage ([^;]+);\n/u.exec(file.contents);
    if (!packageMatch) throw new Error(`Generated compatibility file ${file.path} has no package header`);
    const declaration = file.contents.slice(packageMatch[0].length).trim();
    const existing = byPath.get(file.path);
    if (existing && existing.packageName !== packageMatch[1]) {
      throw new Error(`Generated compatibility file ${file.path} has conflicting packages`);
    }
    const record = existing ?? { declarations: [], packageName: packageMatch[1] };
    record.declarations.push(declaration);
    byPath.set(file.path, record);
  }
  return [...byPath].map(([path, record]) => ({
    contents: `// Generated by tools/backend-hx from the compiler-emitted public surface. Do not edit.\npackage ${record.packageName};\n\n${record.declarations.filter(Boolean).join('\n\n')}\n`,
    path,
  }));
}

function parseFunctionDeclaration(line, prefix) {
  const plainStart = `${prefix}function `;
  const inlineStart = `${prefix}inline function `;
  const start = line.startsWith(plainStart) ? plainStart : line.startsWith(inlineStart) ? inlineStart : undefined;
  if (!start) return undefined;
  let cursor = start.length;
  const name = /^[A-Za-z_][A-Za-z0-9_]*/u.exec(line.slice(cursor))?.[0];
  if (!name) return undefined;
  cursor += name.length;
  if (line[cursor] === '<') cursor = matchingDelimiter(line, cursor, '<', '>') + 1;
  if (line[cursor] !== '(') return undefined;
  const parametersEnd = matchingDelimiter(line, cursor, '(', ')');
  if (parametersEnd === -1 || line[parametersEnd + 1] !== ':') return undefined;
  const returnStart = parametersEnd + 2;
  const returnEnd = declarationTerminator(line, returnStart);
  const returnType = line.slice(returnStart, returnEnd).trim();
  const signature = `function ${line.slice(start.length, returnEnd).trim()}`;
  return {
    name,
    parameters: splitTopLevel(line.slice(cursor + 1, parametersEnd)).filter(Boolean).map(parseParameter),
    returnType,
    signature,
  };
}

function parseValueDeclaration(line, prefix) {
  const match = new RegExp(`^${escapeRegExp(prefix)}(final|var) ([A-Za-z_][A-Za-z0-9_]*)(?:\\([^)]*\\))?:`, 'u').exec(
    line,
  );
  if (!match) return undefined;
  const typeStart = match[0].length;
  const typeEnd = valueTypeEnd(line, typeStart);
  return {
    declarationKind: match[1],
    name: match[2],
    valueType: line.slice(typeStart, typeEnd).trim(),
  };
}

function parseTypeDeclaration(contents, name) {
  for (const line of contents.split('\n')) {
    const declaration = parseTypeDeclarationLine(line);
    if (declaration?.name === name) return declaration;
  }
  return undefined;
}

function parseTypeDeclarationLine(line) {
  const match = /^(typedef|class|interface|enum abstract) ([A-Za-z_][A-Za-z0-9_]*)/u.exec(line);
  if (!match) return undefined;
  const parameterStart = match[0].length;
  let typeParameters = '';
  if (line[parameterStart] === '<') {
    const end = matchingDelimiter(line, parameterStart, '<', '>');
    if (end === -1) throw new Error(`Unclosed Haxe type parameters in: ${line}`);
    typeParameters = line.slice(parameterStart, end + 1);
  }
  return { declarationKind: match[1], name: match[2], typeParameters };
}

function parseParameter(parameter) {
  const colon = topLevelIndex(parameter, ':');
  const rawName = (colon === -1 ? parameter : parameter.slice(0, colon)).trim();
  const rest = rawName.startsWith('...');
  const name = rawName.replace(/^\.\.\./u, '').replace(/^\?/u, '').trim();
  if (!/^[A-Za-z_][A-Za-z0-9_]*$/u.test(name)) throw new Error(`Unsupported Haxe parameter: ${parameter}`);
  return { name, rest };
}

function typeArguments(parameters) {
  if (!parameters) return '';
  return `<${splitTopLevel(parameters.slice(1, -1))
    .map((parameter) => /^[A-Za-z_][A-Za-z0-9_]*/u.exec(parameter.trim())?.[0])
    .join(', ')}>`;
}

function splitTopLevel(value) {
  const result = [];
  let start = 0;
  let quote;
  let escaped = false;
  const closing = [];
  const pairs = new Map([
    ['(', ')'],
    ['[', ']'],
    ['{', '}'],
    ['<', '>'],
  ]);
  for (let index = 0; index < value.length; index += 1) {
    const character = value[index];
    if (quote) {
      if (escaped) escaped = false;
      else if (character === '\\') escaped = true;
      else if (character === quote) quote = undefined;
      continue;
    }
    if (character === '"' || character === "'") {
      quote = character;
      continue;
    }
    if (pairs.has(character)) closing.push(pairs.get(character));
    else if (character === closing.at(-1)) closing.pop();
    else if (character === ',' && closing.length === 0) {
      result.push(value.slice(start, index).trim());
      start = index + 1;
    }
  }
  result.push(value.slice(start).trim());
  return result;
}

function topLevelIndex(value, target) {
  const sections = splitTopLevel(value);
  if (sections.length !== 1) return -1;
  let depth = 0;
  for (let index = 0; index < value.length; index += 1) {
    if ('<([{'.includes(value[index])) depth += 1;
    else if ('>)]}'.includes(value[index])) depth -= 1;
    else if (value[index] === target && depth === 0) return index;
  }
  return -1;
}

function matchingDelimiter(value, start, open, close) {
  let depth = 0;
  for (let index = start; index < value.length; index += 1) {
    if (value[index] === open) depth += 1;
    else if (value[index] === close && (close !== '>' || !['-', '='].includes(value[index - 1]))) {
      depth -= 1;
      if (depth === 0) return index;
    }
  }
  return -1;
}

function declarationTerminator(line, start) {
  const semicolon = line.lastIndexOf(';');
  if (semicolon >= start) return semicolon;
  const block = line.indexOf(' {', start);
  if (block >= start) return block;
  const expression = line.indexOf(' return ', start);
  return expression >= start ? expression : line.length;
}

function valueTypeEnd(line, start) {
  const assignment = line.indexOf(' = ', start);
  const semicolon = line.lastIndexOf(';');
  if (assignment >= start) return assignment;
  return semicolon >= start ? semicolon : line.length;
}

function addCandidate(index, key, entry) {
  const candidates = index.get(key) ?? [];
  candidates.push(entry);
  index.set(key, candidates);
}

function isSupported(entry) {
  return entry.implementation !== undefined;
}

function publicReportEntry(entry) {
  return {
    ...(entry.holder ? { holder: entry.holder } : {}),
    kind: entry.kind,
    name: entry.publicName,
    source: entry.externPath,
    target: entry.implementation.target,
  };
}

function unavailableReportEntry(entry) {
  return {
    ...(entry.candidates ? { candidates: entry.candidates } : {}),
    ...(entry.holder ? { holder: entry.holder } : {}),
    kind: entry.kind,
    name: entry.publicName,
    reason: entry.unavailableReason,
    source: entry.externPath,
  };
}

function comparePublicEntries(left, right) {
  return compareText(`${left.holder ?? ''}\0${left.publicName ?? left.name}`, `${right.holder ?? ''}\0${right.publicName ?? right.name}`);
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/gu, '\\$&');
}
