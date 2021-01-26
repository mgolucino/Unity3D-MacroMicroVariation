// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Macro Micro Variation"
{
	Properties
	{
		_Albedo("Albedo", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,0)
		_Tiling("Tiling", Float) = 0
		_NormalMap("Normal Map", 2D) = "bump" {}
		_MetallicMap("Metallic Map", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_Occlusion("Occlusion", Range( 0 , 1)) = 1
		_VariationTexture("Variation Texture", 2D) = "white" {}
		_VariationTiling("Variation Tiling", Float) = 1
		_VariationStrength("Variation Strength", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _NormalMap;
		uniform float _Tiling;
		uniform sampler2D _Albedo;
		uniform float4 _Color;
		uniform sampler2D _VariationTexture;
		uniform float _VariationTiling;
		uniform float _VariationStrength;
		uniform sampler2D _MetallicMap;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform sampler2D _OcclusionMap;
		uniform float _Occlusion;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_output_4_0_g7 = ( i.uv_texcoord * _Tiling );
			o.Normal = UnpackNormal( tex2D( _NormalMap, temp_output_4_0_g7 ) );
			float4 temp_output_28_0_g9 = ( tex2D( _Albedo, temp_output_4_0_g7 ) * _Color );
			float2 temp_cast_0 = (0.0).xx;
			float2 uv_TexCoord5_g9 = i.uv_texcoord + temp_cast_0;
			float3 _UVScale = float3(6,4,2);
			float2 temp_cast_1 = (0.0).xx;
			float2 uv_TexCoord7_g9 = i.uv_texcoord + temp_cast_1;
			float2 temp_cast_2 = (0.0).xx;
			float2 uv_TexCoord6_g9 = i.uv_texcoord + temp_cast_2;
			float4 lerpResult23_g9 = lerp( temp_output_28_0_g9 , ( temp_output_28_0_g9 * ( ( tex2D( _VariationTexture, ( uv_TexCoord5_g9 * _UVScale.x * _VariationTiling ) ).r + 0.5 ) * ( ( tex2D( _VariationTexture, ( uv_TexCoord7_g9 * _UVScale.y * _VariationTiling ) ).r + 0.5 ) * ( tex2D( _VariationTexture, ( uv_TexCoord6_g9 * _UVScale.z * _VariationTiling ) ).r + 0.5 ) ) ) ) , _VariationStrength);
			o.Albedo = lerpResult23_g9.rgb;
			float4 tex2DNode2_g7 = tex2D( _MetallicMap, temp_output_4_0_g7 );
			o.Metallic = ( tex2DNode2_g7.r * _Metallic );
			o.Smoothness = ( tex2DNode2_g7.a * _Smoothness );
			float lerpResult13_g7 = lerp( tex2D( _OcclusionMap, temp_output_4_0_g7 ).g , 1.0 , ( 1.0 - _Occlusion ));
			o.Occlusion = lerpResult13_g7;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18712
616;158;1255;657;-634.5431;574.2247;1;True;False
Node;AmplifyShaderEditor.FunctionNode;107;817.3,-384;Inherit;False;Standard PBR;0;;7;b9ce61b23a7e8054da4b2c61a27cb188;0;0;6;COLOR;0;FLOAT3;21;COLOR;28;FLOAT;17;FLOAT;18;FLOAT;20
Node;AmplifyShaderEditor.FunctionNode;108;1008,-384;Inherit;False;Macro Micro Variation;12;;9;514e39abb7b4f67468c4512e74cd80c7;3,37,0,39,0,38,0;1;28;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1251.149,-384.7975;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Macro Micro Variation;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;108;28;107;0
WireConnection;0;0;108;0
WireConnection;0;1;107;21
WireConnection;0;3;107;17
WireConnection;0;4;107;18
WireConnection;0;5;107;20
ASEEND*/
//CHKSM=B6929F01B742EAC41015C0A2DF08D31EFB2C9B8D