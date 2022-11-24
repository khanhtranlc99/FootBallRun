//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Blur3" {
Properties {
_Radius ("Radius", Range(1, 255)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 GrabPass {
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  GpuProgramID 52766
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
lowp vec4 u_xlat10_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb18 = _Radius<u_xlat10;
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat10_4 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat10_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_6;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat10_3 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat10_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
lowp vec4 u_xlat10_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb18 = _Radius<u_xlat10;
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat10_4 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat10_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_6;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat10_3 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat10_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
lowp vec4 u_xlat10_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb18 = _Radius<u_xlat10;
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat10_4 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat10_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_6;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat10_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat10_3 = texture2D(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat10_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(_Radius<u_xlat10);
#else
        u_xlatb18 = _Radius<u_xlat10;
#endif
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat16_4 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat16_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_6;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat16_3 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat16_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(_Radius<u_xlat10);
#else
        u_xlatb18 = _Radius<u_xlat10;
#endif
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat16_4 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat16_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_6;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat16_3 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat16_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
int u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
float u_xlat10;
vec2 u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlati2 = int(1);
    u_xlat10 = float(0.100000001);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(_Radius<u_xlat10);
#else
        u_xlatb18 = _Radius<u_xlat10;
#endif
        if(u_xlatb18){break;}
        u_xlat3.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
        u_xlat18.xy = u_xlat3.xy / vs_TEXCOORD0.ww;
        u_xlat16_4 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_4 = u_xlat16_1 + u_xlat16_4;
        u_xlat3.zw = _GrabTexture_TexelSize.yx * (-vec2(u_xlat10)) + vs_TEXCOORD0.yx;
        u_xlat5 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_6;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
        u_xlat18.xy = u_xlat3.wz / vs_TEXCOORD0.ww;
        u_xlat16_3 = texture(_GrabTexture, u_xlat18.xy);
        u_xlat16_1 = u_xlat16_3 + u_xlat16_4;
        u_xlati2 = u_xlati2 + 4;
        u_xlat10 = u_xlat10 + 0.100000001;
        u_xlat16_1 = u_xlat16_1;
    }
    u_xlat16_7 = float(u_xlati2);
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_7);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
 GrabPass {
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  GpuProgramID 98558
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
lowp vec4 u_xlat10_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat10_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb31 = u_xlat1<u_xlat21;
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat10_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_8 = texture2D(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat10_8;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat10_5 + u_xlat16_6;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat10_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
lowp vec4 u_xlat10_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat10_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb31 = u_xlat1<u_xlat21;
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat10_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_8 = texture2D(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat10_8;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat10_5 + u_xlat16_6;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat10_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
lowp vec4 u_xlat10_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0 = texture2D(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat10_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb31 = u_xlat1<u_xlat21;
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat10_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat10_8 = texture2D(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat10_8;
        u_xlat10_5 = texture2D(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat10_5 + u_xlat16_6;
        u_xlat10_6 = texture2D(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat10_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat16_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat1<u_xlat21);
#else
        u_xlatb31 = u_xlat1<u_xlat21;
#endif
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat16_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_8 = texture(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat16_8;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
        u_xlat16_6 = texture(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat16_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat16_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat1<u_xlat21);
#else
        u_xlatb31 = u_xlat1<u_xlat21;
#endif
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat16_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_8 = texture(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat16_8;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
        u_xlat16_6 = texture(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat16_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _GrabTexture_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
mediump float u_xlat16_9;
int u_xlati11;
float u_xlat21;
bool u_xlatb31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0 = texture(_GrabTexture, u_xlat0.xy);
    u_xlat1 = _Radius * 1.99404109;
    u_xlat2.zw = vs_TEXCOORD0.yx;
    u_xlat3.zw = vs_TEXCOORD0.yx;
    u_xlat16_4 = u_xlat16_0;
    u_xlati11 = int(1);
    u_xlat21 = float(1.41421354);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat1<u_xlat21);
#else
        u_xlatb31 = u_xlat1<u_xlat21;
#endif
        if(u_xlatb31){break;}
        u_xlat2.xy = _GrabTexture_TexelSize.xy * vec2(u_xlat21) + vs_TEXCOORD0.xy;
        u_xlat5 = u_xlat2.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_6 = texture(_GrabTexture, u_xlat5.xy);
        u_xlat16_6 = u_xlat16_4 + u_xlat16_6;
        u_xlat3.xy = _GrabTexture_TexelSize.xy * (-vec2(u_xlat21)) + vs_TEXCOORD0.xy;
        u_xlat7 = u_xlat3.xzwy / vs_TEXCOORD0.wwww;
        u_xlat16_8 = texture(_GrabTexture, u_xlat7.xy);
        u_xlat16_6 = u_xlat16_6 + u_xlat16_8;
        u_xlat16_5 = texture(_GrabTexture, u_xlat5.zw);
        u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
        u_xlat16_6 = texture(_GrabTexture, u_xlat7.zw);
        u_xlat16_4 = u_xlat16_5 + u_xlat16_6;
        u_xlati11 = u_xlati11 + 4;
        u_xlat21 = u_xlat21 + 1.41421354;
        u_xlat16_4 = u_xlat16_4;
    }
    u_xlat16_9 = float(u_xlati11);
    SV_Target0 = u_xlat16_4 / vec4(u_xlat16_9);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
}
}
}
}