" syntax/unrealshader.vim

" 1. すでに読み込み済みの場合は何もしない
if exists("b:current_syntax")
  finish
endif

" 2. ★ C++ のシンタックスを継承 ★
"    シェーダーはC++に近いため、これをベースにします
runtime! syntax/cpp.vim

" 3. Unrealシェーダー固有のキーワードを追加

" 3a. 型 (float3, sampler2D など)
"     "Type" グループでハイライトします
syntax keyword UnrealShaderTypes float2 float3 float4
syntax keyword UnrealShaderTypes half2 half3 half4
syntax keyword UnrealShaderTypes float3x3 float4x4
syntax keyword UnrealShaderTypes sampler2D sampler3D samplerCUBE
syntax keyword UnrealShaderTypes Texture2D Texture3D TextureCube
syntax keyword UnrealShaderTypes Buffer
syntax keyword UnrealShaderTypes int2 int3 int4
syntax keyword UnrealShaderTypes SamplerState
hi def link UnrealShaderTypes Type

" 3b. 組み込み関数・セマンティクス (SV_POSITION など)
"     "Keyword" グループでハイライトします
syntax keyword UnrealShaderKeywords SV_POSITION SV_Target SV_Depth
syntax keyword UnrealShaderKeywords tex2D texCUBE
syntax keyword UnrealShaderKeywords mul saturate lerp ddx ddy
hi def link UnrealShaderKeywords Keyword

" 3c. Unreal固有のマクロ (PS_ENTRY など)
"     "Macro" (プリプロセッサ) グループでハイライトします
syntax keyword UnrealShaderMacro PS_ENTRY VS_ENTRY CS_ENTRY
syntax keyword UnrealShaderMacro GetMaterialDynamicParameter
syntax keyword UnrealShaderMacro GetMaterialVertexParameters
hi def link UnrealShaderMacro Macro

" 4. C++のコメント構文をそのまま使う (cpp.vimが読み込まれているので不要)

let b:current_syntax = "unrealshader"
