//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/CopyDepth" {
Properties {
}
SubShader {
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "CopyDepth"
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ColorMask 0 0
  ZTest Always
  Cull Off
  GpuProgramID 377
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform highp sampler2D _CameraDepthAttachment;
varying highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture2D(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform highp sampler2D _CameraDepthAttachment;
varying highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture2D(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform highp sampler2D _CameraDepthAttachment;
varying highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture2D(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
float u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraDepthAttachment, vs_TEXCOORD0.xy).x;
    gl_FragDepth = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_2" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_2" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_2" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_2" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat2 = max(u_xlat1, 0.0);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_2" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat2 = max(u_xlat1, 0.0);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_2" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat2 = max(u_xlat1, 0.0);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_4" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_4" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_4" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_4" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_4" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_4" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_8" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_8" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_8" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 _ScaleBiasRT;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_frag_depth
#extension GL_EXT_frag_depth : enable
#endif
#define gl_FragDepth gl_FragDepthEXT

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
void main()
{
    gl_FragDepth = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_8" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 4).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 5).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 6).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 7).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_8" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 4).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 5).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 6).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 7).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_8" }
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
uniform 	mediump vec4 _ScaleBiasRT;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.y = in_POSITION0.y * _ScaleBiasRT.x;
    gl_Position.xz = in_POSITION0.xz;
    gl_Position.w = 1.0;
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
uniform 	vec4 _CameraDepthAttachment_TexelSize;
UNITY_LOCATION(0) uniform highp sampler2DMS _CameraDepthAttachment;
in highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec4 u_xlatu0;
float u_xlat1;
float u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthAttachment_TexelSize.zw;
    u_xlatu0.xy = uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 0).x;
    u_xlat1 = max(u_xlat1, 0.0);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 1).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 2).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 3).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 4).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 5).x;
    u_xlat1 = max(u_xlat1, u_xlat3);
    u_xlat3 = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 6).x;
    u_xlat0.x = texelFetch(_CameraDepthAttachment, ivec2(u_xlatu0.xy), 7).x;
    u_xlat2 = max(u_xlat1, u_xlat3);
    gl_FragDepth = max(u_xlat2, u_xlat0.x);
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
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_4" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "_DEPTH_MSAA_8" }
""
}
}
}
}
}