local ply = LocalPlayer()

net.Receive('OpenMenu', function()
    -- screen width && height
    local width = ScrW() / 2
    local height = ScrH() / 2

    -- localization
    local localization = bonus.localization
    local language = bonus.language

    local bonus = vgui.Create('DFrame')
        bonus:SetSize(500, 250)
        bonus:SetPos(width - bonus:GetWide() / 2, height - bonus:GetTall() / 2)
        bonus:SetTitle('')
        bonus:SetVisible(true)
        bonus:SetDraggable(true)
        bonus:ShowCloseButton(false)
        bonus:MakePopup()

        bonus.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 0, bonus:GetWide(), 250, Color(87, 88, 187, 210))
            draw.RoundedBoxEx(5, 0, 0, bonus:GetWide(), 25, Color(65, 66, 144, 200), true, true, false, false)
            draw.RoundedBox(5, 195, 35, bonus:GetWide() / 1.67, 35, Color(65, 66, 144, 200))
            draw.RoundedBox(5, 195, 75, bonus:GetWide() / 1.67, 125, Color(65, 66, 144, 200))
            draw.RoundedBox(5, 5, 35, 170, 165, Color(65, 66, 144, 200))
            draw.SimpleText(localization[language].menuMainTitle, 'mainFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 52, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(localization[language].menuSubTitle, 'subTitleFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 120, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(localization[language].menuDescription, 'descriptionFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 144, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

    local bonus_img = vgui.Create('DImage', bonus)
        bonus_img:SetPos(5, 30)
        bonus_img:SetSize(170, 170)
        bonus_img:SetImage('img/present.png')

    local givebonus = vgui.Create('DButton', bonus)
        givebonus:SetText(localization[language].menuButton)
        givebonus:SetFont('buttonFont')
        givebonus:SetTextColor(Color(255, 255, 255, 200))
        givebonus:SetPos(5, 210)
        givebonus:SetSize(bonus:GetWide() - givebonus:GetWide() + givebonus:GetWide() / 1.2, 35)
          
        givebonus.Paint = function(self, w, h)
            if self:IsHovered() then
                draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144))
                givebonus:SetTextColor(Color(255, 255, 255))
            else 
                draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144, 200))
                givebonus:SetTextColor(Color(255, 255, 255, 200))
            end

        givebonus.DoClick = function()
                surface.PlaySound('garrysmod/save_load1.wav')

                net.Start('GiveBonus')
                    net.WriteString(ply:SteamID64())
                net.SendToServer()

                bonus:SetVisible(!bonus:IsVisible())
            end
        end

    local close = vgui.Create('DButton', bonus)
        close:SetText('X')
        close:SetTextColor(Color(255,255,255))
        close:SetPos(bonus:GetWide() - close:GetWide() + close:GetWide() / 2.65, 0)
        close:SetSize(40, 25)

        close.Paint = function(self, w, h)
            if self:IsHovered() then
                draw.RoundedBoxEx(5, 0, 0, w, h, Color(159, 68, 111), false, true, false, false)
            else 
                draw.RoundedBoxEx(5, 0, 0, w, h, Color(142, 76, 118), false, true, false, false)
            end
            
            close.DoClick = function() 
                bonus:SetVisible(!bonus:IsVisible()) 
            end
        end
end)