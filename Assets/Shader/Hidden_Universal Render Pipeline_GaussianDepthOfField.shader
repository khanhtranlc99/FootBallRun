//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/GaussianDepthOfField" {
Properties {
_MainTex ("Source", 2D) = "white" { }
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Name "Gaussian Depth Of Field CoC"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33992
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CoCParams.x);
    u_xlat1 = (-_CoCParams.x) + _CoCParams.y;
    SV_Target0 = u_xlat0.x / u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CoCParams.x);
    u_xlat1 = (-_CoCParams.x) + _CoCParams.y;
    SV_Target0 = u_xlat0.x / u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CoCParams.x);
    u_xlat1 = (-_CoCParams.x) + _CoCParams.y;
    SV_Target0 = u_xlat0.x / u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
}
Program "fp" {
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
 Pass {
  Name "Gaussian Depth Of Field Prefilter"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 109602
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump float u_xlat10_0;
mediump vec3 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    SV_Target0 = u_xlat10_0;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target1.xyz = vec3(u_xlat10_0) * u_xlat10_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump float u_xlat10_0;
mediump vec3 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    SV_Target0 = u_xlat10_0;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target1.xyz = vec3(u_xlat10_0) * u_xlat10_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump float u_xlat10_0;
mediump vec3 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    SV_Target0 = u_xlat10_0;
    u_xlat10_1.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target1.xyz = vec3(u_xlat10_0) * u_xlat10_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat10_4;
mediump float u_xlat10_5;
mediump float u_xlat16_9;
mediump vec3 u_xlat10_9;
mediump float u_xlat10_10;
mediump float u_xlat10_15;
void main()
{
    u_xlat10_0.x = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat1 = _ColorTexture_TexelSize.xyxy * vec4(0.899999976, -0.400000006, -0.899999976, 0.400000006) + vs_TEXCOORD0.xyxy;
    u_xlat10_5 = texture(_FullCoCTexture, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat10_5 + u_xlat10_0.x;
    u_xlat10_10 = texture(_FullCoCTexture, u_xlat1.zw).x;
    u_xlat16_2.x = u_xlat10_10 + u_xlat16_2.x;
    u_xlat3 = _ColorTexture_TexelSize.xyxy * vec4(0.400000006, 0.899999976, -0.400000006, -0.899999976) + vs_TEXCOORD0.xyxy;
    u_xlat10_15 = texture(_FullCoCTexture, u_xlat3.xy).x;
    u_xlat16_2.x = u_xlat10_15 + u_xlat16_2.x;
    u_xlat10_4 = texture(_FullCoCTexture, u_xlat3.zw).x;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat10_4;
    u_xlat16_9 = u_xlat16_2.x * 0.200000003;
    SV_Target0 = u_xlat16_9;
    u_xlat10_9.xyz = texture(_ColorTexture, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat10_9.xyz;
    u_xlat10_9.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_0.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_10) + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture(_ColorTexture, u_xlat3.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat3.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(u_xlat10_15) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_4) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    SV_Target1.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat10_4;
mediump float u_xlat10_5;
mediump float u_xlat16_9;
mediump vec3 u_xlat10_9;
mediump float u_xlat10_10;
mediump float u_xlat10_15;
void main()
{
    u_xlat10_0.x = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat1 = _ColorTexture_TexelSize.xyxy * vec4(0.899999976, -0.400000006, -0.899999976, 0.400000006) + vs_TEXCOORD0.xyxy;
    u_xlat10_5 = texture(_FullCoCTexture, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat10_5 + u_xlat10_0.x;
    u_xlat10_10 = texture(_FullCoCTexture, u_xlat1.zw).x;
    u_xlat16_2.x = u_xlat10_10 + u_xlat16_2.x;
    u_xlat3 = _ColorTexture_TexelSize.xyxy * vec4(0.400000006, 0.899999976, -0.400000006, -0.899999976) + vs_TEXCOORD0.xyxy;
    u_xlat10_15 = texture(_FullCoCTexture, u_xlat3.xy).x;
    u_xlat16_2.x = u_xlat10_15 + u_xlat16_2.x;
    u_xlat10_4 = texture(_FullCoCTexture, u_xlat3.zw).x;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat10_4;
    u_xlat16_9 = u_xlat16_2.x * 0.200000003;
    SV_Target0 = u_xlat16_9;
    u_xlat10_9.xyz = texture(_ColorTexture, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat10_9.xyz;
    u_xlat10_9.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_0.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_10) + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture(_ColorTexture, u_xlat3.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat3.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(u_xlat10_15) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_4) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    SV_Target1.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4_FullscreenProjMat[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_FullscreenProjMat[1];
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_FullscreenProjMat[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4_FullscreenProjMat[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
layout(location = 1) out mediump vec3 SV_Target1;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat10_4;
mediump float u_xlat10_5;
mediump float u_xlat16_9;
mediump vec3 u_xlat10_9;
mediump float u_xlat10_10;
mediump float u_xlat10_15;
void main()
{
    u_xlat10_0.x = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat1 = _ColorTexture_TexelSize.xyxy * vec4(0.899999976, -0.400000006, -0.899999976, 0.400000006) + vs_TEXCOORD0.xyxy;
    u_xlat10_5 = texture(_FullCoCTexture, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat10_5 + u_xlat10_0.x;
    u_xlat10_10 = texture(_FullCoCTexture, u_xlat1.zw).x;
    u_xlat16_2.x = u_xlat10_10 + u_xlat16_2.x;
    u_xlat3 = _ColorTexture_TexelSize.xyxy * vec4(0.400000006, 0.899999976, -0.400000006, -0.899999976) + vs_TEXCOORD0.xyxy;
    u_xlat10_15 = texture(_FullCoCTexture, u_xlat3.xy).x;
    u_xlat16_2.x = u_xlat10_15 + u_xlat16_2.x;
    u_xlat10_4 = texture(_FullCoCTexture, u_xlat3.zw).x;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat10_4;
    u_xlat16_9 = u_xlat16_2.x * 0.200000003;
    SV_Target0 = u_xlat16_9;
    u_xlat10_9.xyz = texture(_ColorTexture, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat1.zw).xyz;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat10_9.xyz;
    u_xlat10_9.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_9.xyz * u_xlat10_0.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_10) + u_xlat16_2.xyz;
    u_xlat10_0.xyz = texture(_ColorTexture, u_xlat3.xy).xyz;
    u_xlat10_1.xyz = texture(_ColorTexture, u_xlat3.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(u_xlat10_15) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(u_xlat10_4) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    SV_Target1.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
}
}
 Pass {
  Name "Gaussian Depth Of Field Blur Horizontal"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 167530
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.w = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat0 * vec4(0.294117659, 0.294117659, 0.294117659, 0.294117659);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu2.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).x;
    u_xlat16_3.x = (-u_xlat0.w) + u_xlat0.x;
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3.xxxx;
    u_xlat5 = _MainTex_TexelSize.x;
    u_xlat5 = u_xlat0.x * u_xlat5;
    u_xlat5 = u_xlat5 * _CoCParams.z;
    u_xlat2.xz = vec2(u_xlat5) * vec2(-1.33333337, 1.33333337);
    u_xlat2.y = float(-0.0);
    u_xlat2.w = float(0.0);
    u_xlat2 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.xy).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_1 = u_xlat16_3 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.zw).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat16_1.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.w = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat0 * vec4(0.294117659, 0.294117659, 0.294117659, 0.294117659);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu2.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).x;
    u_xlat16_3.x = (-u_xlat0.w) + u_xlat0.x;
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3.xxxx;
    u_xlat5 = _MainTex_TexelSize.x;
    u_xlat5 = u_xlat0.x * u_xlat5;
    u_xlat5 = u_xlat5 * _CoCParams.z;
    u_xlat2.xz = vec2(u_xlat5) * vec2(-1.33333337, 1.33333337);
    u_xlat2.y = float(-0.0);
    u_xlat2.w = float(0.0);
    u_xlat2 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.xy).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_1 = u_xlat16_3 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.zw).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat16_1.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.w = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat0 * vec4(0.294117659, 0.294117659, 0.294117659, 0.294117659);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu2.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).x;
    u_xlat16_3.x = (-u_xlat0.w) + u_xlat0.x;
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3.xxxx;
    u_xlat5 = _MainTex_TexelSize.x;
    u_xlat5 = u_xlat0.x * u_xlat5;
    u_xlat5 = u_xlat5 * _CoCParams.z;
    u_xlat2.xz = vec2(u_xlat5) * vec2(-1.33333337, 1.33333337);
    u_xlat2.y = float(-0.0);
    u_xlat2.w = float(0.0);
    u_xlat2 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.xy).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_1 = u_xlat16_3 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat3.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat3.w = texture(_HalfCoCTexture, u_xlat2.zw).x;
    u_xlat16_4 = u_xlat0.x + (-u_xlat3.w);
    u_xlat16_4 = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat3 * vec4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
    u_xlat16_0 = u_xlat16_0 * vec4(u_xlat16_4) + u_xlat16_1;
    u_xlat16_1.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
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
 Pass {
  Name "Gaussian Depth Of Field Blur Vertical"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 242138
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
uvec4 u_xlatu3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_5;
mediump float u_xlat16_7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.294117659, 0.294117659, 0.294117659);
    u_xlat16_1.w = 0.294117659;
    u_xlat10_2.x = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu3.xy = uvec2(ivec2(u_xlat8.xy));
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat8.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).x;
    u_xlat16_7 = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_0.w = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_0.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxw;
    u_xlat8.y = 1.0;
    u_xlat2.xz = u_xlat8.xy * _MainTex_TexelSize.xy;
    u_xlat8.z = _CoCParams.z;
    u_xlat3.xy = u_xlat8.zx * u_xlat2.xz;
    u_xlat3.z = u_xlat3.y * _CoCParams.z;
    u_xlat1 = u_xlat3.xzxz * vec4(-0.0, -1.33333337, 0.0, 1.33333337) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.xy).x;
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_3.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
    u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_3.w;
    u_xlat10_2.xzw = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xzw * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_3 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.zw).x;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_5.xyz * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_1.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.w = min(max(u_xlat16_1.w, 0.0), 1.0);
#else
    u_xlat16_1.w = clamp(u_xlat16_1.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1.w;
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_1 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat16_4.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_4.xxx;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
uvec4 u_xlatu3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_5;
mediump float u_xlat16_7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.294117659, 0.294117659, 0.294117659);
    u_xlat16_1.w = 0.294117659;
    u_xlat10_2.x = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu3.xy = uvec2(ivec2(u_xlat8.xy));
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat8.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).x;
    u_xlat16_7 = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_0.w = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_0.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxw;
    u_xlat8.y = 1.0;
    u_xlat2.xz = u_xlat8.xy * _MainTex_TexelSize.xy;
    u_xlat8.z = _CoCParams.z;
    u_xlat3.xy = u_xlat8.zx * u_xlat2.xz;
    u_xlat3.z = u_xlat3.y * _CoCParams.z;
    u_xlat1 = u_xlat3.xzxz * vec4(-0.0, -1.33333337, 0.0, 1.33333337) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.xy).x;
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_3.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
    u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_3.w;
    u_xlat10_2.xzw = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xzw * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_3 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.zw).x;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_5.xyz * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_1.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.w = min(max(u_xlat16_1.w, 0.0), 1.0);
#else
    u_xlat16_1.w = clamp(u_xlat16_1.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1.w;
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_1 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat16_4.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_4.xxx;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec3 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _HalfCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
uvec4 u_xlatu3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_5;
mediump float u_xlat16_7;
vec3 u_xlat8;
void main()
{
    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.294117659, 0.294117659, 0.294117659);
    u_xlat16_1.w = 0.294117659;
    u_xlat10_2.x = texture(_HalfCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu3.xy = uvec2(ivec2(u_xlat8.xy));
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat8.x = texelFetch(_HalfCoCTexture, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).x;
    u_xlat16_7 = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_0.w = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_0.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxw;
    u_xlat8.y = 1.0;
    u_xlat2.xz = u_xlat8.xy * _MainTex_TexelSize.xy;
    u_xlat8.z = _CoCParams.z;
    u_xlat3.xy = u_xlat8.zx * u_xlat2.xz;
    u_xlat3.z = u_xlat3.y * _CoCParams.z;
    u_xlat1 = u_xlat3.xzxz * vec4(-0.0, -1.33333337, 0.0, 1.33333337) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.xy).x;
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_3.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.w = min(max(u_xlat16_3.w, 0.0), 1.0);
#else
    u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_3.w;
    u_xlat10_2.xzw = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xzw * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_3 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1.zw).x;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = u_xlat10_5.xyz * vec3(0.352941185, 0.352941185, 0.352941185);
    u_xlat16_4.x = (-u_xlat10_2.x) + u_xlat8.x;
    u_xlat16_1.w = (-u_xlat16_4.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.w = min(max(u_xlat16_1.w, 0.0), 1.0);
#else
    u_xlat16_1.w = clamp(u_xlat16_1.w, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1.w;
    u_xlat16_4.w = 0.352941185;
    u_xlat16_0 = u_xlat16_1 * u_xlat16_4.xxxw + u_xlat16_0;
    u_xlat16_4.x = u_xlat16_0.w + 9.99999975e-05;
    SV_Target0.xyz = u_xlat16_0.xyz / u_xlat16_4.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
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
 Pass {
  Name "Gaussian Depth Of Field Composite"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 285191
Program "vp" {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<u_xlat0.x);
#else
    u_xlatb3 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
        u_xlat16_2 = u_xlat0.x * 6.28318548;
        u_xlat16_2 = sqrt(u_xlat16_2);
        u_xlat16_5.x = min(u_xlat16_2, 1.0);
        u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
        u_xlat16_2 = (-u_xlat16_2) + 1.0;
        u_xlat16_2 = max(u_xlat16_2, 0.0);
    } else {
        u_xlat16_2 = float(1.0);
        u_xlat16_5.x = float(0.0);
        u_xlat16_5.y = float(0.0);
        u_xlat16_5.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_2) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<u_xlat0.x);
#else
    u_xlatb3 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
        u_xlat16_2 = u_xlat0.x * 6.28318548;
        u_xlat16_2 = sqrt(u_xlat16_2);
        u_xlat16_5.x = min(u_xlat16_2, 1.0);
        u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
        u_xlat16_2 = (-u_xlat16_2) + 1.0;
        u_xlat16_2 = max(u_xlat16_2, 0.0);
    } else {
        u_xlat16_2 = float(1.0);
        u_xlat16_5.x = float(0.0);
        u_xlat16_5.y = float(0.0);
        u_xlat16_5.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_2) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0<u_xlat0.x);
#else
    u_xlatb3 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat10_3.xyz = texture(_ColorTexture, vs_TEXCOORD0.xy).xyz;
        u_xlat16_2 = u_xlat0.x * 6.28318548;
        u_xlat16_2 = sqrt(u_xlat16_2);
        u_xlat16_5.x = min(u_xlat16_2, 1.0);
        u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
        u_xlat16_2 = (-u_xlat16_2) + 1.0;
        u_xlat16_2 = max(u_xlat16_2, 0.0);
    } else {
        u_xlat16_2 = float(1.0);
        u_xlat16_5.x = float(0.0);
        u_xlat16_5.y = float(0.0);
        u_xlat16_5.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_2) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat10_6;
mediump vec3 u_xlat10_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_17;
vec2 u_xlat20;
vec2 u_xlat23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<u_xlat0.x);
#else
    u_xlatb9 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb9){
        u_xlat9.xy = vs_TEXCOORD0.xy * _ColorTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat2.xy = floor(u_xlat9.xy);
        u_xlat9.xy = fract(u_xlat9.xy);
        u_xlat16_3 = (-u_xlat9.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
        u_xlat16_4.xy = u_xlat9.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
        u_xlat16_4.xy = u_xlat9.xy * u_xlat16_4.xy;
        u_xlat16_4.xy = u_xlat16_4.xy * u_xlat9.xy + vec2(0.666666687, 0.666666687);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
        u_xlat16_9.xy = (-u_xlat16_4.xy) + vec2(1.0, 1.0);
        u_xlat16_9.xy = (-u_xlat16_3.xy) + u_xlat16_9.xy;
        u_xlat16_9.xy = (-u_xlat16_3.zw) + u_xlat16_9.xy;
        u_xlat20.xy = u_xlat16_4.xy + u_xlat16_3.zw;
        u_xlat5.xy = u_xlat16_9.xy + u_xlat16_3.xy;
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat20.xy);
        u_xlat3.zw = u_xlat16_4.xy * u_xlat23.xy + vec2(-1.0, -1.0);
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat5.xy);
        u_xlat3.xy = u_xlat16_9.xy * u_xlat23.xy + vec2(1.0, 1.0);
        u_xlat4 = u_xlat2.xyxy + u_xlat3.zwxw;
        u_xlat4 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat4 = u_xlat4 * _ColorTexture_TexelSize.xyxy;
        u_xlat4 = min(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_9.xyz = textureLod(_ColorTexture, u_xlat4.xy, 0.0).xyz;
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat4.zw, 0.0).xyz;
        u_xlat6.xyz = u_xlat5.xxx * u_xlat10_6.xyz;
        u_xlat9.xyz = u_xlat20.xxx * u_xlat10_9.xyz + u_xlat6.xyz;
        u_xlat3 = u_xlat2.xyxy + u_xlat3.zyxy;
        u_xlat3 = u_xlat3 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat3 = u_xlat3 * _ColorTexture_TexelSize.xyxy;
        u_xlat3 = min(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat3.xy, 0.0).xyz;
        u_xlat10_7.xyz = textureLod(_ColorTexture, u_xlat3.zw, 0.0).xyz;
        u_xlat5.xzw = u_xlat5.xxx * u_xlat10_7.xyz;
        u_xlat2.xyz = u_xlat20.xxx * u_xlat10_6.xyz + u_xlat5.xzw;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat5.yyy;
        u_xlat9.xyz = u_xlat20.yyy * u_xlat9.xyz + u_xlat2.xyz;
        u_xlat16_8 = u_xlat0.x * 6.28318548;
        u_xlat16_8 = sqrt(u_xlat16_8);
        u_xlat16_17.x = min(u_xlat16_8, 1.0);
        u_xlat16_17.xyz = u_xlat9.xyz * u_xlat16_17.xxx;
        u_xlat16_8 = (-u_xlat16_8) + 1.0;
        u_xlat16_8 = max(u_xlat16_8, 0.0);
    } else {
        u_xlat16_8 = float(1.0);
        u_xlat16_17.x = float(0.0);
        u_xlat16_17.y = float(0.0);
        u_xlat16_17.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_8) + u_xlat16_17.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat10_6;
mediump vec3 u_xlat10_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_17;
vec2 u_xlat20;
vec2 u_xlat23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<u_xlat0.x);
#else
    u_xlatb9 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb9){
        u_xlat9.xy = vs_TEXCOORD0.xy * _ColorTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat2.xy = floor(u_xlat9.xy);
        u_xlat9.xy = fract(u_xlat9.xy);
        u_xlat16_3 = (-u_xlat9.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
        u_xlat16_4.xy = u_xlat9.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
        u_xlat16_4.xy = u_xlat9.xy * u_xlat16_4.xy;
        u_xlat16_4.xy = u_xlat16_4.xy * u_xlat9.xy + vec2(0.666666687, 0.666666687);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
        u_xlat16_9.xy = (-u_xlat16_4.xy) + vec2(1.0, 1.0);
        u_xlat16_9.xy = (-u_xlat16_3.xy) + u_xlat16_9.xy;
        u_xlat16_9.xy = (-u_xlat16_3.zw) + u_xlat16_9.xy;
        u_xlat20.xy = u_xlat16_4.xy + u_xlat16_3.zw;
        u_xlat5.xy = u_xlat16_9.xy + u_xlat16_3.xy;
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat20.xy);
        u_xlat3.zw = u_xlat16_4.xy * u_xlat23.xy + vec2(-1.0, -1.0);
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat5.xy);
        u_xlat3.xy = u_xlat16_9.xy * u_xlat23.xy + vec2(1.0, 1.0);
        u_xlat4 = u_xlat2.xyxy + u_xlat3.zwxw;
        u_xlat4 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat4 = u_xlat4 * _ColorTexture_TexelSize.xyxy;
        u_xlat4 = min(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_9.xyz = textureLod(_ColorTexture, u_xlat4.xy, 0.0).xyz;
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat4.zw, 0.0).xyz;
        u_xlat6.xyz = u_xlat5.xxx * u_xlat10_6.xyz;
        u_xlat9.xyz = u_xlat20.xxx * u_xlat10_9.xyz + u_xlat6.xyz;
        u_xlat3 = u_xlat2.xyxy + u_xlat3.zyxy;
        u_xlat3 = u_xlat3 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat3 = u_xlat3 * _ColorTexture_TexelSize.xyxy;
        u_xlat3 = min(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat3.xy, 0.0).xyz;
        u_xlat10_7.xyz = textureLod(_ColorTexture, u_xlat3.zw, 0.0).xyz;
        u_xlat5.xzw = u_xlat5.xxx * u_xlat10_7.xyz;
        u_xlat2.xyz = u_xlat20.xxx * u_xlat10_6.xyz + u_xlat5.xzw;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat5.yyy;
        u_xlat9.xyz = u_xlat20.yyy * u_xlat9.xyz + u_xlat2.xyz;
        u_xlat16_8 = u_xlat0.x * 6.28318548;
        u_xlat16_8 = sqrt(u_xlat16_8);
        u_xlat16_17.x = min(u_xlat16_8, 1.0);
        u_xlat16_17.xyz = u_xlat9.xyz * u_xlat16_17.xxx;
        u_xlat16_8 = (-u_xlat16_8) + 1.0;
        u_xlat16_8 = max(u_xlat16_8, 0.0);
    } else {
        u_xlat16_8 = float(1.0);
        u_xlat16_17.x = float(0.0);
        u_xlat16_17.y = float(0.0);
        u_xlat16_17.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_8) + u_xlat16_17.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ColorTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat10_6;
mediump vec3 u_xlat10_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_17;
vec2 u_xlat20;
vec2 u_xlat23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_MainTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat0.x = texelFetch(_FullCoCTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<u_xlat0.x);
#else
    u_xlatb9 = 0.0<u_xlat0.x;
#endif
    if(u_xlatb9){
        u_xlat9.xy = vs_TEXCOORD0.xy * _ColorTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat2.xy = floor(u_xlat9.xy);
        u_xlat9.xy = fract(u_xlat9.xy);
        u_xlat16_3 = (-u_xlat9.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
        u_xlat16_4.xy = u_xlat9.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
        u_xlat16_4.xy = u_xlat9.xy * u_xlat16_4.xy;
        u_xlat16_4.xy = u_xlat16_4.xy * u_xlat9.xy + vec2(0.666666687, 0.666666687);
        u_xlat16_3 = u_xlat9.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
        u_xlat16_9.xy = (-u_xlat16_4.xy) + vec2(1.0, 1.0);
        u_xlat16_9.xy = (-u_xlat16_3.xy) + u_xlat16_9.xy;
        u_xlat16_9.xy = (-u_xlat16_3.zw) + u_xlat16_9.xy;
        u_xlat20.xy = u_xlat16_4.xy + u_xlat16_3.zw;
        u_xlat5.xy = u_xlat16_9.xy + u_xlat16_3.xy;
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat20.xy);
        u_xlat3.zw = u_xlat16_4.xy * u_xlat23.xy + vec2(-1.0, -1.0);
        u_xlat23.xy = vec2(1.0) / vec2(u_xlat5.xy);
        u_xlat3.xy = u_xlat16_9.xy * u_xlat23.xy + vec2(1.0, 1.0);
        u_xlat4 = u_xlat2.xyxy + u_xlat3.zwxw;
        u_xlat4 = u_xlat4 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat4 = u_xlat4 * _ColorTexture_TexelSize.xyxy;
        u_xlat4 = min(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_9.xyz = textureLod(_ColorTexture, u_xlat4.xy, 0.0).xyz;
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat4.zw, 0.0).xyz;
        u_xlat6.xyz = u_xlat5.xxx * u_xlat10_6.xyz;
        u_xlat9.xyz = u_xlat20.xxx * u_xlat10_9.xyz + u_xlat6.xyz;
        u_xlat3 = u_xlat2.xyxy + u_xlat3.zyxy;
        u_xlat3 = u_xlat3 + vec4(-0.5, -0.5, -0.5, -0.5);
        u_xlat3 = u_xlat3 * _ColorTexture_TexelSize.xyxy;
        u_xlat3 = min(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlat10_6.xyz = textureLod(_ColorTexture, u_xlat3.xy, 0.0).xyz;
        u_xlat10_7.xyz = textureLod(_ColorTexture, u_xlat3.zw, 0.0).xyz;
        u_xlat5.xzw = u_xlat5.xxx * u_xlat10_7.xyz;
        u_xlat2.xyz = u_xlat20.xxx * u_xlat10_6.xyz + u_xlat5.xzw;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat5.yyy;
        u_xlat9.xyz = u_xlat20.yyy * u_xlat9.xyz + u_xlat2.xyz;
        u_xlat16_8 = u_xlat0.x * 6.28318548;
        u_xlat16_8 = sqrt(u_xlat16_8);
        u_xlat16_17.x = min(u_xlat16_8, 1.0);
        u_xlat16_17.xyz = u_xlat9.xyz * u_xlat16_17.xxx;
        u_xlat16_8 = (-u_xlat16_8) + 1.0;
        u_xlat16_8 = max(u_xlat16_8, 0.0);
    } else {
        u_xlat16_8 = float(1.0);
        u_xlat16_17.x = float(0.0);
        u_xlat16_17.y = float(0.0);
        u_xlat16_17.z = float(0.0);
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat16_8) + u_xlat16_17.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "_HIGH_QUALITY_SAMPLING" }
""
}
}
}
}
}