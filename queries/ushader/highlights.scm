;; Keywords from grammar.js
[
  "in"
  "out"
  "inout"
  "precise"
  "shared"
  "groupshared"
  "uniform"
  "row_major"
  "column_major"
  "globallycoherent"
  "centroid"
  "noperspective"
  "nointerpolation"
  "sample"
  "linear"
  "snorm"
  "unorm"
  "point"
  "line"
  "triangleadj"
  "lineadj"
  "triangle"
  "discard"
  "cbuffer"
] @keyword.modifier

;; Attributes
(hlsl_attribute) @attribute

;; Semantics (e.g. : SV_POSITION)
(semantics ":" @punctuation.delimiter (identifier) @variable.builtin)

;; 基本的なリテラルとコメント
(comment) @comment
(string_literal) @string
(number_literal) @number

;; 識別子
(identifier) @variable
(type_identifier) @type

;; 関数呼び出し
(call_expression
  function: (identifier) @function.call)

;; プリミティブ型 (int, float, etc)
(primitive_type) @type.builtin

;; 演算子と区切り文字
[
  "+" "-" "*" "/" "%"
  "=" "+=" "-=" "*=" "/="
  "==" "!=" "<" ">" "<=" ">="
  "&&" "||" "!"
] @operator

[ ";" "," "." ] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket

