local localization = BONUS.localization
local language = BONUS.language
local translation = localization[language]
local pallete = BONUS.Pallete

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
        draw.RoundedBox(0, 0, 0, w, h, pallete.bonusBackground)
    end

    local bonusMenu = vgui.Create('DFrame')
    bonusMenu:SetSize(500, 250)
    bonusMenu:SetPos(width - bonusMenu:GetWide() / 2, height - bonusMenu:GetTall() / 2)
    bonusMenu:SetTitle('')
    bonusMenu:SetVisible(true)
    bonusMenu:SetDraggable(false)
    bonusMenu:ShowCloseButton(false)
    bonusMenu:MakePopup()

    bonusMenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, bonusMenu:GetWide(), 250, pallete.bonusMenuBackground)
        draw.RoundedBoxEx(5, 0, 0, bonusMenu:GetWide(), 25, pallete.bonusMenuTop, true, true, false, false)
        draw.RoundedBox(5, 195, 35, bonusMenu:GetWide() / 1.67, 35, pallete.bonusSquares)
        draw.RoundedBox(5, 195, 75, bonusMenu:GetWide() / 1.67, 125, pallete.bonusSquares)
        draw.RoundedBox(5, 5, 35, 170, 165, pallete.bonusSquares)
        draw.SimpleText(translation.Title, 'Title', bonusMenu:GetWide() - bonusMenu:GetWide() + bonusMenu:GetWide() / 1.45, 52, pallete.bonusColorText, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(translation.SubTitle, 'SubTitle', bonusMenu:GetWide() - bonusMenu:GetWide() + bonusMenu:GetWide() / 1.45, 120, pallete.bonusColorText, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(translation.Description, 'Description', bonusMenu:GetWide() - bonusMenu:GetWide() + bonusMenu:GetWide() / 1.45, 144, pallete.bonusColorText, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    DermaAnimationArray({
        bonusBackground,
        bonusMenu
    }, 0, 255, 0.1, 0)

    local bonusMenuIMG = vgui.Create('DImage', bonusMenu)
    bonusMenuIMG:SetPos(5, 30)
    bonusMenuIMG:SetSize(170, 170)
    bonusMenuIMG:SetImage('materials/bonus-templates/present.png')

    local bonusButtonReceive = vgui.Create('DButton', bonusMenu)
    bonusButtonReceive:SetText(translation.Button)
    bonusButtonReceive:SetFont('Button')
    bonusButtonReceive:SetTextColor(Color(255, 255, 255, 200))
    bonusButtonReceive:SetPos(5, 210)
    bonusButtonReceive:SetSize(bonusMenu:GetWide() - bonusButtonReceive:GetWide() + bonusButtonReceive:GetWide() / 1.2, 35)

    DermaButtonHover(
        bonusButtonReceive, 
        5, 0, 0, pallete.bonusButtonHover, pallete.bonusButton, true, true, true, true
    )

    bonusButtonReceive.DoClick = function()
        surface.PlaySound('garrysmod/save_load1.wav')

        net.Start('bonus.giveBonus')
        net.SendToServer()

        DermaAnimationArray({
            bonusBackground,
            bonusMenu
        }, 255, 0, 0.1, 0)

        timer.Simple(0.1, function()
            DermaRemove(bonusBackground, bonusMenu)
        end)
    end

    local bonusButtonClose = vgui.Create('DButton', bonusMenu)
    bonusButtonClose:SetText('X')
    bonusButtonClose:SetFont('Button')
    bonusButtonClose:SetTextColor(pallete.bonusColorText)
    bonusButtonClose:SetPos(bonusMenu:GetWide() - bonusButtonClose:GetWide() + bonusButtonClose:GetWide() / 2.65, 0)
    bonusButtonClose:SetSize(40, 25)

    DermaButtonHover(
        bonusButtonClose, 
        5, 0, 0, pallete.bonusButtonCloseHover, pallete.bonusButtonClose, false, true, false, false
    )

    bonusButtonClose.DoClick = function() 
        DermaAnimationArray({
            bonusBackground,
            bonusMenu
        }, 255, 0, 0.1, 0)

        timer.Simple(0.1, function()
            DermaRemove(bonusBackground, bonusMenu)
        end)
    end
end

net.Receive('bonus.openMenu', panelMainMenu)