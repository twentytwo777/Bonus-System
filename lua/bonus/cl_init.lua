include('sh_init.lua')

-- Panel
include('panel/menu.lua')

-- Fonts
include('fonts/fonts.lua')

function DermaAnimation(derma, setAlphaVal, alphaToVal, time, delay)
    derma:SetAlpha(setAlphaVal)
    derma:AlphaTo(alphaToVal, time, delay)
end

function DermaAnimationArray(derma, setAlphaVal, alphaToVal, time, delay)
    if type(derma) == 'table' then
        for _, derma in pairs(derma) do
            DermaAnimation(derma, setAlphaVal, alphaToVal, time, delay)
        end
    else
        DermaAnimation(derma, setAlphaVal, alphaToVal, time, delay)
    end
end

function DermaButtonHover(button, radius, x, y, color, colorHovered, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight)
    local w, h = button:GetWide(), button:GetTall()

    button.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.RoundedBoxEx(radius, x, y, w, h, colorHovered, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight)
        else
            draw.RoundedBoxEx(radius, x, y, w, h, color, roundTopLeft, roundTopRight, roundBottomLeft, roundBottomRight)
        end
    end
end

function DermaRemove(...)
    for _, derma in ipairs({...}) do
        derma:Remove()
    end
end