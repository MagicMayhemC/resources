txds = engineLoadTXD ( "light.txd" )
engineImportTXD ( txds, 3895)
dffs = engineLoadDFF ( "light.dff", 3895 )
cols = engineLoadCOL("PoliceLight1.col")
engineReplaceCOL(cols, 3895)
engineReplaceModel(dffs, 3895)

addEventHandler( "onClientResourceStart", resourceRoot,
    function()

        as = dxCreateTexture ( "pd.png" )
        asshader = dxCreateShader( "as.fx" )
        engineApplyShaderToWorldTexture ( asshader, "vehiclepoldecals128" )
		engineApplyShaderToWorldTexture ( asshader, "ambulan92decal128" )
		engineApplyShaderToWorldTexture ( asshader, "firetruk92decal" )
		engineApplyShaderToWorldTexture ( asshader, "firetruk92num64" )
		engineApplyShaderToWorldTexture ( asshader, "lsfd92badge64" )
        dxSetShaderValue ( asshader, "asTexture", as )   
    end
    )