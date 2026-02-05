;; extends
;; Unreal Engine macros

;; GENERATED_BODY()
(unreal_body_macro "GENERATED_BODY" @function.macro)
(unreal_body_macro ["(" ")"] @punctuation.special)

;; Macro heads as attributes
(uclass_macro      "UCLASS"    @attribute)
(ustruct_macro     "USTRUCT"   @attribute)
(uenum_macro       "UENUM"     @attribute)
(uproperty_macro   "UPROPERTY" @attribute)
(ufunction_macro   "UFUNCTION" @attribute)
(umeta_macro       "UMETA"     @attribute)

;; Parentheses of macros
(unreal_argument_list ["(" ")"] @punctuation.special)

;; Unreal API specifier (e.g. MYPROJECT_API)
(unreal_api_specifier) @type.qualifier

;; -----------------------------------------------------
;; Unreal Specifiers のハイライト設定
;; -----------------------------------------------------

;; 1. Specifier Keys (key=value の key)
(unreal_specifier key: (_) @property)

;; 2. Specifier Keywords (Blueprintable, EditAnywhere など)
(unreal_specifier_keyword) @property

;; 3. Values
(unreal_specifier_content (string_literal) @string)
(unreal_specifier_content (number_literal) @number)
(unreal_specifier_content (true) @boolean)
(unreal_specifier_content (false) @boolean)

;; 4. Nested parentheses punctuation (meta=(...))
(unreal_specifier_content ["(" ")"] @punctuation.special)