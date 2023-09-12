//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

public let PATTERN_NODES: [Node] = [
  Node(
    kind: .expressionPattern,
    base: .pattern,
    nameForDiagnostics: "pattern",
    children: [
      Child(
        name: "expression",
        kind: .node(kind: .expr)
      )
    ]
  ),

  Node(
    kind: .identifierPattern,
    base: .pattern,
    nameForDiagnostics: "pattern",
    children: [
      Child(
        name: "identifier",
        kind: .token(choices: [.token(.identifier), .keyword(.self), .keyword(.`init`)])
      )
    ]
  ),

  Node(
    kind: .isTypePattern,
    base: .pattern,
    nameForDiagnostics: "'is' pattern",
    children: [
      Child(
        name: "isKeyword",
        kind: .token(choices: [.keyword(.is)])
      ),
      Child(
        name: "type",
        kind: .node(kind: .type)
      ),
    ]
  ),

  Node(
    kind: .tuplePatternElementList,
    base: .syntaxCollection,
    nameForDiagnostics: nil,
    elementChoices: [.tuplePatternElement]
  ),

  Node(
    kind: .tuplePatternElement,
    base: .syntax,
    nameForDiagnostics: nil,
    traits: [
      "WithTrailingComma"
    ],
    children: [
      Child(
        name: "label",
        deprecatedName: "labelName",
        kind: .token(choices: [.token(.identifier)]),
        nameForDiagnostics: "label",
        isOptional: true
      ),
      Child(
        name: "colon",
        deprecatedName: "labelColon",
        kind: .token(choices: [.token(.colon)]),
        isOptional: true
      ),
      Child(
        name: "pattern",
        kind: .node(kind: .pattern)
      ),
      Child(
        name: "trailingComma",
        kind: .token(choices: [.token(.comma)]),
        isOptional: true
      ),
    ]
  ),

  Node(
    kind: .tuplePattern,
    base: .pattern,
    nameForDiagnostics: "tuple pattern",
    traits: [
      "Parenthesized"
    ],
    children: [
      Child(
        name: "leftParen",
        kind: .token(choices: [.token(.leftParen)])
      ),
      Child(
        name: "elements",
        kind: .collection(kind: .tuplePatternElementList, collectionElementName: "Element")
      ),
      Child(
        name: "rightParen",
        kind: .token(choices: [.token(.rightParen)])
      ),
    ]
  ),

  Node(
    kind: .typeAnnotation,
    base: .syntax,
    nameForDiagnostics: "type annotation",
    children: [
      Child(
        name: "colon",
        kind: .token(choices: [.token(.colon)])
      ),
      Child(
        name: "type",
        kind: .node(kind: .type)
      ),
    ]
  ),

  Node(
    kind: .valueBindingPattern,
    base: .pattern,
    nameForDiagnostics: "value binding pattern",
    children: [
      Child(
        name: "bindingSpecifier",
        deprecatedName: "bindingKeyword",
        kind: .token(choices: [
          .keyword(.let), .keyword(.var), .keyword(.inout),
          .keyword(._mutating), .keyword(._borrowing), .keyword(._consuming),
        ])
      ),
      Child(
        name: "pattern",
        deprecatedName: "valuePattern",
        kind: .node(kind: .pattern)
      ),
    ]
  ),

  Node(
    kind: .wildcardPattern,
    base: .pattern,
    nameForDiagnostics: "wildcard pattern",
    children: [
      Child(
        name: "wildcard",
        kind: .token(choices: [.token(.wildcard)])
      ),
      Child(
        name: "typeAnnotation",
        kind: .node(kind: .typeAnnotation),
        isOptional: true
      ),
    ]
  ),

  Node(
    kind: .editorPlaceholderPattern,
    base: .pattern,
    nameForDiagnostics: "editor placeholder",
    documentation: """
      An editor placeholder, e.g. `<#pattern#>` that is used in a position that expects a pattern.
      """,
    children: [
      Child(
        name: "placeholder",
        kind: .token(choices: [.token(.identifier)]),
        documentation: """
          The actual editor placeholder that starts with `<#` and ends with `#>`.
          """
      )
    ]
  ),

]
