///////////////////////////////////////////////////////////////////////////////////////////////////
// Petroglyph Confidential Source Code -- Do Not Distribute
///////////////////////////////////////////////////////////////////////////////////////////////////
//
//          $File: //depot/Projects/StarWars_Expansion/Art/Shaders/RSkinAdditive.fx $
//          $Author: Andre_Arsenault $
//          $DateTime: 2006/02/15 15:33:33 $
//          $Revision: #1 $
//
///////////////////////////////////////////////////////////////////////////////////////////////////
/*
	
	Rigid matrix-palette skinning with additive blending.

	
*/

string _ALAMO_RENDER_PHASE = "Transparent";
string _ALAMO_VERTEX_PROC = "RSkin";
string _ALAMO_VERTEX_TYPE = "alD3dVertRSkinNU2";
bool _ALAMO_TANGENT_SPACE = false;
bool _ALAMO_SHADOW_VOLUME = false;
int _ALAMO_BONES_PER_VERTEX = 1;

#include "AlamoEngineSkinning.fxh"
#include "Additive.fxh"

// A color that can be multiplied with the texture
float3 Color < string UIName="Color"; string UIType = "ColorSwatch"; > = {1.0f, 1.0f, 1.0f};


///////////////////////////////////////////////////////
//
// Shader Programs
//
///////////////////////////////////////////////////////

struct VS_INPUT
{
    float4  Pos             : POSITION;
    float4  Normal          : NORMAL;       // Normal.W contains skin index
    float2  Tex0            : TEXCOORD0;
};

VS_OUTPUT vs_main(VS_INPUT In)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;
    
    // look up the transform for this vertex
    int index = In.Normal.w;
    float4x3 transform = m_skinMatrixArray[index];

	// Outputs
	float3 P = mul(In.Pos,transform); 
	Out.Pos = mul(float4(P,1.0),m_viewProj);
	Out.Tex = Unpack_UV(In.Tex0) + m_time*UVScrollRate;

	Out.Diff.rgb = Color * m_lightScale.rgb;
    Out.Diff *= m_lightScale.a;
    Out.Diff.a = 1.0f;

    float3 obj_normal = normalize(In.Normal.xyz);
        
	// Fog
	Out.Fog = 1.0f; //Compute_Fog(Out.Pos.xyz);

	return Out;
}

VS_OUTPUT vs_max_main(VS_INPUT In)
{
    VS_OUTPUT Out = (VS_OUTPUT)0;

	// Transform position and normal to view space
	// In MAX we skip the skinning stuff since it rebuilds the mesh for
	// us each frame.
	float3 P = mul(In.Pos,m_world); 
	Out.Pos = mul(float4(P,1.0),m_viewProj);
	Out.Tex = In.Tex0 + m_time*UVScrollRate;;

	Out.Diff.rgb = Color * m_lightScale.rgb;
    Out.Diff *= m_lightScale.a;
    Out.Diff.a = 1.0f;
    
	// Fog
	Out.Fog = 1.0;
	
	return Out;
}

vertexshader vs_max_main_bin = compile vs_1_1 vs_max_main();
vertexshader vs_main_bin = compile vs_1_1 vs_main();
pixelshader additive_ps_main_bin = compile ps_1_1 additive_ps_main();

//////////////////////////////////////
// Techniques specs follow
//////////////////////////////////////
technique max_viewport
{
    pass max_p0
    {
        SB_START

    		// blend mode
    		ZWriteEnable=false;
    		ZFunc = LESSEQUAL;
    		AlphaBlendEnable = TRUE;
    		DestBlend = ONE;
    		SrcBlend = ONE;
    		AlphaTestEnable = FALSE;
    	
        SB_END        

        VertexShader = (vs_max_main_bin);
        PixelShader = (additive_ps_main_bin);
    }
}

technique t0 
<
	string LOD="DX8";
>
{
    pass t0_p0
    {
        SB_START

    		// blend mode
    		ZWriteEnable=false;
    		ZFunc = LESSEQUAL;
    		AlphaBlendEnable = TRUE;
    		DestBlend = ONE;
    		SrcBlend = ONE;
    		AlphaTestEnable = FALSE;
    
        SB_END        

        VertexShader = (vs_main_bin);
        PixelShader = (additive_ps_main_bin);
    }
}

technique t1
<
	string LOD="FIXEDFUNCTION";
	bool CPUSKIN=true;
>
{
	pass t1_p0
	{
        SB_START

    		// blend mode
    		ZWriteEnable = FALSE;
    		ZFunc = LESSEQUAL;
    		AlphaBlendEnable = TRUE;
    		DestBlend = ONE;
    		SrcBlend = ONE;
    		AlphaTestEnable = FALSE;
            
            ColorOp[0]=MODULATE;
    		ColorArg1[0]=TEXTURE;
    		ColorArg2[0]=TFACTOR;
    		AlphaOp[0]=SELECTARG1;
    		AlphaArg1[0]=TEXTURE;
    
    		ColorOp[1]=DISABLE;
    		AlphaOp[1]=DISABLE;

        SB_END        

        VertexShader = NULL;
        PixelShader  = NULL;

        Texture[0]=(BaseTexture);
		TextureFactor=(float4(
                                Color.r * m_lightScale.r * m_lightScale.a,
                                Color.g * m_lightScale.g * m_lightScale.a,
                                Color.b * m_lightScale.b * m_lightScale.a,
                                1.0f
                       ));

    }
}


