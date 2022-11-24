//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/LutBuilderLdr" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "LutBuilderLdr"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 12339
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
uniform lowp sampler2D _CurveHueVsSat;
uniform lowp sampler2D _CurveSatVsSat;
uniform lowp sampler2D _CurveLumVsSat;
uniform lowp sampler2D _CurveHueVsHue;
uniform lowp sampler2D _CurveMaster;
uniform lowp sampler2D _CurveRed;
uniform lowp sampler2D _CurveGreen;
uniform lowp sampler2D _CurveBlue;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
lowp float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
lowp float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(ivec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * -1);
    u_xlati3.xyz = ivec3(ivec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * -1);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture2D(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
    u_xlatb10 = 1.0<u_xlat1.x;
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
    u_xlatb1 = u_xlat1.x<0.0;
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture2D(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture2D(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat10_28;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture2D(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
    SV_Target0.w = 1.0;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
uniform lowp sampler2D _CurveHueVsSat;
uniform lowp sampler2D _CurveSatVsSat;
uniform lowp sampler2D _CurveLumVsSat;
uniform lowp sampler2D _CurveHueVsHue;
uniform lowp sampler2D _CurveMaster;
uniform lowp sampler2D _CurveRed;
uniform lowp sampler2D _CurveGreen;
uniform lowp sampler2D _CurveBlue;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
lowp float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
lowp float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(ivec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * -1);
    u_xlati3.xyz = ivec3(ivec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * -1);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture2D(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
    u_xlatb10 = 1.0<u_xlat1.x;
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
    u_xlatb1 = u_xlat1.x<0.0;
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture2D(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture2D(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat10_28;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture2D(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
    SV_Target0.w = 1.0;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
uniform lowp sampler2D _CurveHueVsSat;
uniform lowp sampler2D _CurveSatVsSat;
uniform lowp sampler2D _CurveLumVsSat;
uniform lowp sampler2D _CurveHueVsHue;
uniform lowp sampler2D _CurveMaster;
uniform lowp sampler2D _CurveRed;
uniform lowp sampler2D _CurveGreen;
uniform lowp sampler2D _CurveBlue;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
lowp float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
lowp float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
lowp float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(ivec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * -1);
    u_xlati3.xyz = ivec3(ivec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * -1);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture2D(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
    u_xlatb10 = 1.0<u_xlat1.x;
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
    u_xlatb1 = u_xlat1.x<0.0;
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture2D(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture2D(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat10_28;
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture2D(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture2D(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
    u_xlat1.x = texture2D(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture2D(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
    SV_Target0.w = 1.0;
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat3.y>=u_xlat3.z);
#else
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3.x>=u_xlat16_4.x);
#else
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(1.0<u_xlat1.x);
#else
    u_xlatb10 = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.yz = min(max(u_xlat16_2.yz, 0.0), 1.0);
#else
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.x = min(max(SV_Target0.x, 0.0), 1.0);
#else
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.yz = min(max(SV_Target0.yz, 0.0), 1.0);
#else
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
#endif
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat3.y>=u_xlat3.z);
#else
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3.x>=u_xlat16_4.x);
#else
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(1.0<u_xlat1.x);
#else
    u_xlatb10 = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.yz = min(max(u_xlat16_2.yz, 0.0), 1.0);
#else
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.x = min(max(SV_Target0.x, 0.0), 1.0);
#else
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.yz = min(max(SV_Target0.yz, 0.0), 1.0);
#else
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
#endif
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
uniform 	vec4 _Lut_Params;
uniform 	vec4 _ColorBalance;
uniform 	mediump vec4 _ColorFilter;
uniform 	mediump vec4 _ChannelMixerRed;
uniform 	mediump vec4 _ChannelMixerGreen;
uniform 	mediump vec4 _ChannelMixerBlue;
uniform 	vec4 _HueSatCon;
uniform 	vec4 _Lift;
uniform 	vec4 _Gamma;
uniform 	vec4 _Gain;
uniform 	vec4 _Shadows;
uniform 	vec4 _Midtones;
uniform 	vec4 _Highlights;
uniform 	vec4 _ShaHiLimits;
uniform 	mediump vec4 _SplitShadows;
uniform 	mediump vec4 _SplitHighlights;
UNITY_LOCATION(0) uniform mediump sampler2D _CurveMaster;
UNITY_LOCATION(1) uniform mediump sampler2D _CurveRed;
UNITY_LOCATION(2) uniform mediump sampler2D _CurveGreen;
UNITY_LOCATION(3) uniform mediump sampler2D _CurveBlue;
UNITY_LOCATION(4) uniform mediump sampler2D _CurveHueVsHue;
UNITY_LOCATION(5) uniform mediump sampler2D _CurveHueVsSat;
UNITY_LOCATION(6) uniform mediump sampler2D _CurveSatVsSat;
UNITY_LOCATION(7) uniform mediump sampler2D _CurveLumVsSat;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat10_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat10_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump float u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec2 u_xlat16_18;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_28;
mediump float u_xlat10_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_Lut_Params.yz);
    u_xlat1.x = u_xlat0.y * _Lut_Params.x;
    u_xlat0.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat0.x / _Lut_Params.x;
    u_xlat0.w = u_xlat0.y + (-u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xzw * _Lut_Params.www;
    u_xlat16_2.x = dot(vec3(0.390404999, 0.549941003, 0.00892631989), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(0.070841603, 0.963172019, 0.00135775004), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(0.0231081992, 0.128021002, 0.936245024), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.xyz * _ColorBalance.xyz;
    u_xlat16_2.x = dot(vec3(2.85846996, -1.62879002, -0.0248910002), u_xlat0.xyz);
    u_xlat16_2.y = dot(vec3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0.xyz);
    u_xlat16_2.z = dot(vec3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(-0.0275523961, -0.0275523961, -0.0275523961);
    u_xlat0.xyz = u_xlat16_0.xyz * _HueSatCon.zzz + vec3(0.413588405, 0.413588405, 0.413588405);
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.386036009, -0.386036009, -0.386036009);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(13.6054821, 13.6054821, 13.6054821);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-0.0479959995, -0.0479959995, -0.0479959995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.179999992, 0.179999992, 0.179999992);
    u_xlat16_0.xyz = u_xlat16_2.xyz * _ColorFilter.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.454545468, 0.454545468, 0.454545468);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_1.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
    u_xlat16_4.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_0.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_27 = u_xlat16_2.x + _SplitShadows.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_28 = (-u_xlat16_27) + 1.0;
    u_xlat16_4.xyz = _SplitShadows.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = sqrt(u_xlat0.xyz);
    u_xlat16_4.xyz = _SplitHighlights.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = vec3(u_xlat16_27) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat3.xyz;
    u_xlatb5.xyz = greaterThanEqual(u_xlat4.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
    u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
    u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
    u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat1.x = dot(u_xlat0.xyz, _ChannelMixerRed.xyz);
    u_xlat1.y = dot(u_xlat0.xyz, _ChannelMixerGreen.xyz);
    u_xlat1.z = dot(u_xlat0.xyz, _ChannelMixerBlue.xyz);
    u_xlat0.xyz = u_xlat1.xyz * _Midtones.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat3.xy = u_xlat16_2.xx + (-_ShaHiLimits.xz);
    u_xlat21.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
    u_xlat21.xy = vec2(1.0, 1.0) / u_xlat21.xy;
    u_xlat3.xy = u_xlat21.xy * u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat21.xy = u_xlat3.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat27 = (-u_xlat21.x) * u_xlat3.x + 1.0;
    u_xlat28 = (-u_xlat27) + 1.0;
    u_xlat28 = (-u_xlat21.y) * u_xlat3.y + u_xlat28;
    u_xlat3.x = u_xlat3.y * u_xlat21.y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat28);
    u_xlat12.xyz = u_xlat1.xyz * _Shadows.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Highlights.xyz;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat27) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Gain.xyz + _Lift.xyz;
    u_xlati1.xyz = ivec3(uvec3(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyzx).xyz) * 0xFFFFFFFFu);
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat0.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat0.xyz = log2(abs(u_xlat0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * _Gamma.xyz;
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati3.xyz;
    u_xlat1.xyz = vec3(u_xlati1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat16_2.xy = u_xlat1.yz * u_xlat0.yz + (-u_xlat3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat3.y>=u_xlat3.z);
#else
    u_xlatb27 = u_xlat3.y>=u_xlat3.z;
#endif
    u_xlat16_20 = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_20);
    u_xlat16_4.xy = u_xlat1.zy * u_xlat0.zy + u_xlat16_2.xy;
    u_xlat16_5.w = (-u_xlat3.x);
    u_xlat16_2.x = float(1.0);
    u_xlat16_2.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_20) * u_xlat16_2.xy + vec2(-1.0, 0.666666687);
    u_xlat16_5.xyz = (-u_xlat16_4.xyw);
    u_xlat16_2.yzw = u_xlat16_4.yzx + u_xlat16_5.yzw;
    u_xlat16_2.x = u_xlat1.x * u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3.x>=u_xlat16_4.x);
#else
    u_xlatb0 = u_xlat3.x>=u_xlat16_4.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_29 = u_xlat16_7.x * u_xlat16_2.w + u_xlat3.x;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz + u_xlat16_4.xyw;
    u_xlat16_7.x = dot(u_xlat3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_25 = min(u_xlat16_2.y, u_xlat16_29);
    u_xlat16_11.x = (-u_xlat16_2.y) + u_xlat16_29;
    u_xlat16_29 = u_xlat16_2.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_29 * 6.0 + 9.99999975e-05;
    u_xlat16_11.x = u_xlat16_11.x / u_xlat16_25;
    u_xlat16_0.x = u_xlat16_11.x + u_xlat16_2.z;
    u_xlat1.x = abs(u_xlat16_0.x) + _HueSatCon.x;
    u_xlat16_0.x = abs(u_xlat16_0.x);
    u_xlat1.y = 0.0;
    u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1.xy).x;
    u_xlat16_11.x = u_xlat10_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + -0.5;
    u_xlat1.x = u_xlat1.x + u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(1.0<u_xlat1.x);
#else
    u_xlatb10 = 1.0<u_xlat1.x;
#endif
    u_xlat16_11.xy = u_xlat1.xx + vec2(1.0, -1.0);
    u_xlat16_20 = (u_xlatb10) ? u_xlat16_11.y : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    u_xlat16_11.x = (u_xlatb1) ? u_xlat16_11.x : u_xlat16_20;
    u_xlat16_8.xyz = u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_18.x = u_xlat16_29 / u_xlat16_11.x;
    u_xlat16_11.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.xyz = u_xlat16_2.xxx * u_xlat16_11.xyz + (-vec3(u_xlat16_25));
    u_xlat16_0.y = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy).x;
    u_xlat10_3 = texture(_CurveSatVsSat, u_xlat16_18.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat10_28;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
    u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_28 = dot(u_xlat16_2.xx, u_xlat16_11.xx);
    u_xlat16_7.y = 0.0;
    u_xlat10_3 = texture(_CurveLumVsSat, u_xlat16_7.xy).x;
    u_xlat16_2.x = u_xlat10_3;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat28 = u_xlat16_28 * _HueSatCon.y;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat16_1.xyz + vec3(u_xlat16_25);
    u_xlat0.xyz = u_xlat1.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveMaster, u_xlat0.xw).x;
    u_xlat16_2.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveMaster, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveMaster, u_xlat0.zw).x;
    u_xlat16_2.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.yz = min(max(u_xlat16_2.yz, 0.0), 1.0);
#else
    u_xlat16_2.yz = clamp(u_xlat16_2.yz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat16_2.xyz + vec3(0.00390625, 0.00390625, 0.00390625);
    u_xlat0.w = 0.0;
    u_xlat10_1 = texture(_CurveRed, u_xlat0.xw).x;
    SV_Target0.x = u_xlat10_1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.x = min(max(SV_Target0.x, 0.0), 1.0);
#else
    SV_Target0.x = clamp(SV_Target0.x, 0.0, 1.0);
#endif
    u_xlat1.x = texture(_CurveGreen, u_xlat0.yw).x;
    u_xlat1.y = texture(_CurveBlue, u_xlat0.zw).x;
    SV_Target0.yz = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.yz = min(max(SV_Target0.yz, 0.0), 1.0);
#else
    SV_Target0.yz = clamp(SV_Target0.yz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
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