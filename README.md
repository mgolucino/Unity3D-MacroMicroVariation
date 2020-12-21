# Unity3D-MacroMicroVariation
![Preview](https://user-images.githubusercontent.com/46628480/102723781-3f720580-42d0-11eb-89d1-e2b58e0838db.png)
The **Macro/Micro Variation** shader is an Amplify shader made to reduce the visibility of texture tiling on very large objects. This shader does not actually remove the tiling in your textures; however, it can hide it to a degree by introducing randomness to the base color of your object.

# Instructions
Download the **MacroMicroVariation** folder and import it into your Unity 3D project. Create a new material and use **Macro Micro Variation** as the shader. Assign textures and values to the material like any other PBR material, then assign a texture for **Variation Texture**, which will be overlayed on top of the albedo texture. This texture will be sampled three times at different scales according to the x, y, and z values of the **Variation Scale** property. Then, adjust the intensity of the overlay by using the **Variation Strength** property. Refer to the demo scene for sample material setups.
