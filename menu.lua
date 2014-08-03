module(..., package.seeall)

--====================================================================--
-- SCENE: MAIN MENU
--====================================================================--

clean = function()
	--cleaner
end


new = function ( params )

	local facebook      = require "facebook"
    local json          = require "json"
    local localGroup    = display.newGroup()

    local btnFacebook = display.newImageRect( "btnFacebook.png", 40, 40 )
    btnFacebook.anchorX = 0
    btnFacebook.x = display.contentWidth/2 - 20
    btnFacebook.y = display.contentHeight/2
	
    local onFBTouch = function( event )
        
        if event.phase == "ended" then
            
            local function listener( event )
            
                if ( "session" == event.type ) then
                
                    if ( "login" == event.phase ) then
            
                            local attachment = {
                                message = "Score on game facebook",
                                name    = "Game Teste no Facebook",
                                caption =".",
                                link    ="https://play.google.com/store/apps/category/GAME",
                                picture ="link-da-imagem"
                            }
                            facebook.request( "me/feed", "POST", attachment )
                            facebook.logout()
                
                    end
                        
                elseif "request" == event.type then
                
                    -- texto de teste
                    local status1   = display.newText( "requisitando", 412, 107, "Helvetica",40 )
                    status1.acnhorX = 0
                    status1.x = _W/2
                    status1.y = 275
                        
                end
                
            end
            local fbAppID = "APP ID"
            local function getPermissions(event)
                if(event.type == "session") then
                    facebook.logout()
                    facebook.login( fbAppID, listener, {"publish_actions"})
                end
            end
            facebook.login( fbAppID, getPermissions )
        end

    end
    btnFacebook:addEventListener("touch", onFBTouch)

    localGroup:insert(btnFacebook)

	return localGroup
	
end
