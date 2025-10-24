;; extends

; Unreal Engine macros

; GENERATED_BODY()
(unreal_body_macro "GENERATED_BODY" @function.macro)
(unreal_body_macro ["(" ")"] @punctuation.special)

; Macro heads as attributes (capture only the macro name token)
(uclass_macro      "UCLASS"    @attribute)
(ustruct_macro     "USTRUCT"   @attribute)
(uenum_macro       "UENUM"     @attribute)
(uproperty_macro   "UPROPERTY" @attribute)
(ufunction_macro   "UFUNCTION" @attribute)

; Parentheses of macros
(uclass_macro      ["(" ")"] @punctuation.special)
(ustruct_macro     ["(" ")"] @punctuation.special)
(uenum_macro       ["(" ")"] @punctuation.special)
(uproperty_macro   ["(" ")"] @punctuation.special)
(ufunction_macro   ["(" ")"] @punctuation.special)

; Unreal API specifier (e.g. MYPROJECT_API)
(unreal_api_specifier) @type.qualifier

;; -----------------------------------------------------
;; Unreal Specifiers のハイライト設定
;; -----------------------------------------------------

; 1. key = "value" (direct assignment specifiers: Category = "...")
; keyを @property でキャプチャ
(unreal_specifier
  key: (unreal_specifier_keyword) @property
  value: (string_literal) @string)

(unreal_specifier
  key: (identifier) @property
  value: (string_literal) @string)


; 2. meta=(...) のようなカッコで囲まれた割り当て ('meta' キーをキャプチャ)
; value: (parenthesized_expression) にノード名を修正済み
(unreal_specifier
  key: (unreal_specifier_keyword "meta") @property
  value: (parenthesized_expression))


; 3. meta=(DisplayName="...") の中の 'DisplayName' (unreal_meta_key) をターゲットにする
; unreal_meta_key はカスタムエイリアスで公開されているため有効。

; DisplayName (unreal_meta_key) のみ
(unreal_meta_key) @property

; DisplayName="My Cool Character" の割り当て全体
(assignment_expression ; <<--- ノード名を assignment_expression に修正
  left: (unreal_meta_key) @property
  right: (string_literal) @string)


; UCLASS マクロ内の meta=(DisplayName="...") を指定 (冗長だが確実性のため)
(uclass_macro
  specifiers: (unreal_specifier_list
    (unreal_specifier
      key: (unreal_specifier_keyword "meta")
      value: (parenthesized_expression
        (assignment_expression ; <<--- ノード名を assignment_expression に修正
          left: (unreal_meta_key) @property
          right: (string_literal) @string)))))

; UPROPERTY マクロ内の meta=(DisplayName="...") を指定
(uproperty_macro
  specifiers: (unreal_specifier_list
    (unreal_specifier
      key: (unreal_specifier_keyword "meta")
      value: (parenthesized_expression
        (assignment_expression ; <<--- ノード名を assignment_expression に修正
          left: (unreal_meta_key) @property
          right: (string_literal) @string)))))

; UFUNCTION マクロ内の meta=(DisplayName="...") を指定
(ufunction_macro
  specifiers: (unreal_specifier_list
    (unreal_specifier
      key: (unreal_specifier_keyword "meta")
      value: (parenthesized_expression
        (assignment_expression ; <<--- ノード名を assignment_expression に修正
          left: (unreal_meta_key) @property
          right: (string_literal) @string)))))


; 4. 単独のキーワードや識別子の Specifiers (Blueprintable, EditAnywhere, BlueprintCallable, meta など)
; 汎用的な C++ の @variable よりも優先して @property を適用する。
(unreal_specifier (unreal_specifier_keyword) @property)
(unreal_specifier (identifier) @property)


; 5. その他の値 (number / true / false / identifier)
; 値が識別子の場合（例: Foo=Bar の Bar）
(unreal_specifier value: (number_literal) @number)
(unreal_specifier value: (true) @boolean)
(unreal_specifier value: (false) @boolean)
(unreal_specifier value: (identifier) @constant)
