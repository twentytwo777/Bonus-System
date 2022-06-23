local localization = BONUS.localization
local language = BONUS.language
local translation = localization[language]

local function panelMainMenu()
    local ply = LocalPlayer()
    local sw, sh = ScrW(), ScrH()
    local width = ScrW() / 2
    local height = ScrH() / 2
    local verifyPlayer = not ply:IsValid() or not ply:IsPlayer()

    if verifyPlayer then
        return
    end

    local bonusBackground = vgui.Create('DFrame')
    bonusBackground:SetSize(sw, sh)
    bonusBackground:SetPos(0, 0)
    bonusBackground:SetTitle('')
    bonusBackground:SetDraggable(false)
    bonusBackground:ShowCloseButton(false)
    bonusBackground:SetVisible(true)
    bonusBackground.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
    end

    local bonus = vgui.Create('DFrame')
    bonus:SetSize(500, 250)
    bonus:SetPos(width - bonus:GetWide() / 2, height - bonus:GetTall() / 2)
    bonus:SetTitle('')
    bonus:SetVisible(true)
    bonus:SetDraggable(false)
    bonus:ShowCloseButton(false)
    bonus:MakePopup()

    bonus.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, bonus:GetWide(), 250, Color(87, 88, 187, 210))
        draw.RoundedBoxEx(5, 0, 0, bonus:GetWide(), 25, Color(65, 66, 144, 200), true, true, false, false)
        draw.RoundedBox(5, 195, 35, bonus:GetWide() / 1.67, 35, Color(65, 66, 144, 200))
        draw.RoundedBox(5, 195, 75, bonus:GetWide() / 1.67, 125, Color(65, 66, 144, 200))
        draw.RoundedBox(5, 5, 35, 170, 165, Color(65, 66, 144, 200))
        draw.SimpleText(translation.Title, 'mainFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 52, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(translation.SubTitle, 'subTitleFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 120, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(translation.Description, 'descriptionFont', bonus:GetWide() - bonus:GetWide() + bonus:GetWide() / 1.45, 144, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    DermaAnimationArray({
        bonusBackground,
        bonus
    }, 0, 255, 0.1, 0)

    local bonus_img = vgui.Create('DImage', bonus)
    bonus_img:SetPos(5, 30)
    bonus_img:SetSize(170, 170)
    bonus_img:SetImage('resource/bonus-templates/present.png')

    local givebonus = vgui.Create('DButton', bonus)
    givebonus:SetText(translation.Button)
    givebonus:SetFont('buttonFont')
    givebonus:SetTextColor(Color(255, 255, 255, 200))
    givebonus:SetPos(5, 210)
    givebonus:SetSize(bonus:GetWide() - givebonus:GetWide() + givebonus:GetWide() / 1.2, 35)
          
    givebonus.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144))
            givebonus:SetTextColor(color_white)
        else 
            draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144, 200))
            givebonus:SetTextColor(Color(255, 255, 255, 200))
        end
    end

    givebonus.DoClick = function()
        surface.PlaySound('garrysmod/save_load1.wav')

        net.Start('bonus.giveBonus')
        net.SendToServer()

        DermaAnimationArray({
            bonusBackground,
            bonus
        }, 255, 0, 0.1, 0)

        timer.Simple(0.1, function()
            DermaRemove(bonusBackground, bonus)
        end)
    end

    local close = vgui.Create('DButton', bonus)
    close:SetText('X')
    close:SetFont('buttonFont')
    close:SetTextColor(Color(255,255,255))
    close:SetPos(bonus:GetWide() - close:GetWide() + close:GetWide() / 2.65, 0)
    close:SetSize(40, 25)

    close.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBoxEx(5, 0, 0, w, h, Color(159, 68, 111), false, true, false, false)
        else 
            draw.RoundedBoxEx(5, 0, 0, w, h, Color(142, 76, 118), false, true, false, false)
        end
    end

    close.DoClick = function() 
        DermaAnimationArray({
            bonusBackground,
            bonus
        }, 255, 0, 0.1, 0)

        timer.Simple(0.1, function()
            DermaRemove(bonusBackground, bonus)
        end)
    end
end

net.Receive('bonus.openMenu', panelMainMenu)