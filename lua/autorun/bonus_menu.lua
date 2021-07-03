-- Created by twenty two
local function bonus(ply, strText)
    if (strText == "!bonus") then
        local bonus = vgui.Create("DFrame")
        bonus:SetTitle("")
        bonus:SetSize(500, 250)
        bonus:Center()			
        bonus:MakePopup()
        bonus:ShowCloseButton(false)
        bonus:SetBackgroundBlur(true)
        bonus:SetDraggable(false) 
        bonus.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, 600, 250, Color(87, 88, 187, 210))
            surface.SetDrawColor(68, 68, 144, 210)
            surface.DrawRect(0, 0, w, 25)
            draw.RoundedBox(5, 195, 35, 300, 35, Color(65, 66, 144, 200))
            draw.RoundedBox(5, 195, 75, 300, 125, Color(65, 66, 144, 200))
            draw.RoundedBox(5, 5, 35, 170, 165, Color(65, 66, 144, 200))
            draw.SimpleText('Бонус', "header_font", 300, 36, Color(255, 255, 255, 255))
            draw.SimpleText('Получи свой бонус!', "description_font", 255, 94, Color(255, 255, 255, 255))
            draw.SimpleText('Рандомное количество денег', "description_font", 205, 124, Color(255, 255, 255, 255))
            draw.SimpleText('От 5к$ до 60к$', "description_font", 275, 154, Color(255, 255, 255, 255))
        end
        local bonus_img = vgui.Create("DImage", bonus)
        bonus_img:SetPos(5, 30)
        bonus_img:SetSize(170, 170)
        bonus_img:SetImage("customimg/present.png")
        local givebonus = vgui.Create("DButton", bonus)
        givebonus:SetText("Получить")
        givebonus:SetFont('button_font')
        givebonus:SetTextColor(Color(255, 255, 255, 200))
        givebonus:SetPos(5, 210)
        givebonus:SetSize(490, 35)
        givebonus.Paint = function(self, w, h)
            if self:IsHovered() then
                draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144))
                givebonus:SetTextColor(Color(255, 255, 255))
            else 
                draw.RoundedBox(5, 0, 0, w, h, Color(65, 66, 144, 200))
                givebonus:SetTextColor(Color(255, 255, 255, 200))
            end
        givebonus.DoClick = function()
                net.Start('GiveBonus')
                net.SendToServer()
                surface.PlaySound("garrysmod/save_load1.wav")
                bonus:Close()
            end
        end
        local close = vgui.Create("DButton", bonus)
        close:SetText("X")
        close:SetTextColor(Color(255,255,255))
        close:SetPos(460, 0)
        close:SetSize(40, 25)
        close.Paint = function(self, w, h)
            if self:IsHovered() then
                draw.RoundedBox(0, 0, 0, w, h, Color(159, 68, 111))
            else 
                draw.RoundedBox(0, 0, 0, w, h, Color(142, 76, 118))
            end
        close.DoClick = function()
                bonus:Close()
            end
        end
	end
    if (ply != LocalPlayer()) then 
        return 
    end
    strText = string.lower(strText)
end

hook.Add('OnPlayerChat', 'bonus', bonus)
