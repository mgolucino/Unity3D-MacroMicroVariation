// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Macro Micro Variation"
{
	Properties
	{
		_Albedo("Albedo", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,0)
		_Tiling("Tiling", Float) = 1
		_NormalMap("Normal Map", 2D) = "bump" {}
		_MetallicMap("Metallic Map", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_OcclusionMap("Occlusion Map", 2D) = "white" {}
		_Occlusion("Occlusion", Range( 0 , 1)) = 1
		_VariationTexture("Variation Texture", 2D) = "white" {}
		_VariationScale("Variation Scale", Vector) = (6,3.9,1.98,0)
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
		uniform float3 _VariationScale;
		uniform float _VariationStrength;
		uniform sampler2D _MetallicMap;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform sampler2D _OcclusionMap;
		uniform float _Occlusion;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float tilingValue91 = _Tiling;
			float2 temp_output_92_0 = ( i.uv_texcoord * tilingValue91 );
			o.Normal = UnpackNormal( tex2D( _NormalMap, temp_output_92_0 ) );
			float4 temp_output_64_0 = ( tex2D( _Albedo, ( i.uv_texcoord * tilingValue91 ) ) * _Color );
			float4 lerpResult61 = lerp( temp_output_64_0 , ( temp_output_64_0 * ( ( tex2D( _VariationTexture, ( i.uv_texcoord * _VariationScale.x ) ).r + 0.5 ) * ( ( tex2D( _VariationTexture, ( i.uv_texcoord * _VariationScale.y ) ).r + 0.5 ) * ( tex2D( _VariationTexture, ( i.uv_texcoord * _VariationScale.z ) ).r + 0.5 ) ) ) ) , _VariationStrength);
			o.Albedo = lerpResult61.rgb;
			float4 tex2DNode70 = tex2D( _MetallicMap, temp_output_92_0 );
			o.Metallic = ( tex2DNode70.r * _Metallic );
			o.Smoothness = ( tex2DNode70.a * _Smoothness );
			float lerpResult88 = lerp( tex2D( _OcclusionMap, temp_output_92_0 ).g , 1.0 , ( 1.0 - _Occlusion ));
			o.Occlusion = lerpResult88;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18712
616;158;1255;657;581.5309;1195.116;3.298635;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;-892,-592;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;23;-988,-976;Inherit;False;Property;_VariationScale;Variation Scale;10;0;Create;True;0;0;0;False;0;False;6,3.9,1.98;2,1.3,0.66;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-892,-400;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;90;-196.2679,47.59555;Inherit;False;Property;_Tiling;Tiling;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;91;-32,48;Inherit;False;tilingValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-668,-400;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.002;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;6;-1036,-1184;Inherit;True;Property;_VariationTexture;Variation Texture;9;0;Create;True;0;0;0;False;0;False;None;d4119b74f421df747b3ce022d949d2d3;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-892,-784;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-668,-592;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.05;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;97;-656,-1456;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;100;-608,-1328;Inherit;False;91;tilingValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-668,-784;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;22;-524,-464;Inherit;True;Property;_TextureSample2;Texture Sample 2;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;19;-524,-656;Inherit;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-432,-1408;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;-188,-608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-524,-848;Inherit;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;26;-188,-416;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-108,-800;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;65;-172,-1008;Inherit;False;Property;_Color;Color;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.9083292,1,0.8820755,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;29;-252,-1200;Inherit;True;Property;_Albedo;Albedo;0;0;Create;True;0;0;0;False;0;False;-1;None;35b0c97887d07a944bfd34ab9d796abb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-28,-512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;93;-48,-80;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;64;84,-1088;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;74;448,370.6;Inherit;False;Property;_Occlusion;Occlusion;8;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;176,-32;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;148,-672;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;448,96;Inherit;False;Property;_Smoothness;Smoothness;6;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;62;404,-848;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;63;372,-608;Inherit;False;Property;_VariationStrength;Variation Strength;11;0;Create;True;0;0;0;False;0;False;0.5;0.4;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;71;432,176;Inherit;True;Property;_OcclusionMap;Occlusion Map;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;70;432,-176;Inherit;True;Property;_MetallicMap;Metallic Map;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;72;448,16;Inherit;False;Property;_Metallic;Metallic;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;89;752,272;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;692,-1088;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;912,-32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;912,-176;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;88;944,112;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;67;432,-368;Inherit;True;Property;_NormalMap;Normal Map;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1251.149,-384.7975;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Macro Micro Variation;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;91;0;90;0
WireConnection;21;0;20;0
WireConnection;21;1;23;3
WireConnection;18;0;17;0
WireConnection;18;1;23;2
WireConnection;14;0;9;0
WireConnection;14;1;23;1
WireConnection;22;0;6;0
WireConnection;22;1;21;0
WireConnection;19;0;6;0
WireConnection;19;1;18;0
WireConnection;98;0;97;0
WireConnection;98;1;100;0
WireConnection;25;0;19;1
WireConnection;5;0;6;0
WireConnection;5;1;14;0
WireConnection;26;0;22;1
WireConnection;24;0;5;1
WireConnection;29;1;98;0
WireConnection;27;0;25;0
WireConnection;27;1;26;0
WireConnection;64;0;29;0
WireConnection;64;1;65;0
WireConnection;92;0;93;0
WireConnection;92;1;91;0
WireConnection;28;0;24;0
WireConnection;28;1;27;0
WireConnection;62;0;64;0
WireConnection;62;1;28;0
WireConnection;71;1;92;0
WireConnection;70;1;92;0
WireConnection;89;0;74;0
WireConnection;61;0;64;0
WireConnection;61;1;62;0
WireConnection;61;2;63;0
WireConnection;78;0;70;4
WireConnection;78;1;73;0
WireConnection;77;0;70;1
WireConnection;77;1;72;0
WireConnection;88;0;71;2
WireConnection;88;2;89;0
WireConnection;67;1;92;0
WireConnection;0;0;61;0
WireConnection;0;1;67;0
WireConnection;0;3;77;0
WireConnection;0;4;78;0
WireConnection;0;5;88;0
ASEEND*/
//CHKSM=C44AF84B89657D23C03A827107AC515F70C61015