//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Graphs/rotate_shader" {
Properties {
Speed ("speed", Float) = 4
Texture2D2 ("Texture2D", 2D) = "white" { }
}
SubShader {
 Tags { "QUEUE" = "Geometry+0" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "Pass"
  Tags { "QUEUE" = "Geometry+0" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 33446
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform lowp sampler2D Texture2D2;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat10_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0 = in_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump sampler2D Texture2D2;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(Texture2D2, vs_TEXCOORD0.xy).xyz;
    SV_TARGET0.xyz = u_xlat16_0.xyz;
    SV_TARGET0.w = 1.0;
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
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRLIGHTMAP_COMBINED" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
}
}
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Geometry+0" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 124137
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	float Speed;
uniform 	vec3 _LightDirection;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	float Speed;
uniform 	vec3 _LightDirection;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	float Speed;
uniform 	vec3 _LightDirection;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat9;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
 Pass {
  Name "DepthOnly"
  Tags { "LIGHTMODE" = "DepthOnly" "QUEUE" = "Geometry+0" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 194536
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _TimeParameters;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float Speed;
attribute highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _TimeParameters;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM float Speed;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec3 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _TimeParameters.x * Speed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.x = dot(u_xlat2.xy, in_POSITION0.xz);
    u_xlat3.x = dot(u_xlat2.yz, in_POSITION0.xz);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
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
Fallback "Hidden/Shader Graph/FallbackError"
}