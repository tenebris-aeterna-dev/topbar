local spr = require(script.Parent.Parent.packages.spr)
local Types = require(script.Parent.Parent.types)

local DAMPING_RATIO = 0.6
local FREQUENCY = 4

return function(container: Frame, layoutOrder: number, inactiveIcon: number, activeIcon: number)
    local state: Types.ItemState = "Deselected"

    local hasInactive = inactiveIcon ~= nil
    local hasActive = activeIcon ~= nil

    if not hasInactive and not hasActive then
        error("Item created without icons. Please provide at least one valid asset ID.")
    end

    if not hasInactive then
        inactiveIcon = activeIcon
    end
    if not hasActive then
        activeIcon = inactiveIcon
    end

    local Item = Instance.new("ImageButton")
    Item.Name = "item"
    Item.AutoButtonColor = false
    Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Item.LayoutOrder = layoutOrder
    Item.Size = UDim2.fromOffset(38, 38)
    Item.BackgroundTransparency = 1
    Item.ImageTransparency = 1
    Item.Parent = container

    local Corner = Instance.new("UICorner")
    Corner.Name = "corner"
    Corner.CornerRadius = UDim.new(0, 22)
    Corner.Parent = Item

    local InactiveIcon = Instance.new("ImageLabel")
    InactiveIcon.Name = "inactiveIcon"
    InactiveIcon.BackgroundTransparency = 1
    InactiveIcon.Size = UDim2.fromOffset(26, 26)
    InactiveIcon.Position = UDim2.fromScale(0.5, 0.5)
    InactiveIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    InactiveIcon.Image = "rbxassetid://" .. inactiveIcon
    InactiveIcon.Parent = Item

    local ActiveIcon = Instance.new("ImageLabel")
    ActiveIcon.Name = "activeIcon"
    ActiveIcon.BackgroundTransparency = 1
    ActiveIcon.Size = UDim2.fromOffset(0, 0)
    ActiveIcon.Position = UDim2.fromScale(0.5, 0.5)
    ActiveIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    ActiveIcon.Image = "rbxassetid://" .. activeIcon
    ActiveIcon.ImageTransparency = 1
    ActiveIcon.Parent = Item

    local function updateVisuals()
        local targetBgTransparency = 1
        if state == "Selected" then
            targetBgTransparency = 0.88
        elseif state == "Viewing" then
            targetBgTransparency = 0.94
        end

        spr.target(Item, DAMPING_RATIO, FREQUENCY, { 
            BackgroundTransparency = targetBgTransparency 
        })

        if state == "Selected" then
            spr.target(InactiveIcon, DAMPING_RATIO, FREQUENCY, { ImageTransparency = 1, Size = UDim2.fromOffset(0, 0) })
            spr.target(ActiveIcon, DAMPING_RATIO, FREQUENCY, { ImageTransparency = 0, Size = UDim2.fromOffset(26, 26) })
        else
            spr.target(ActiveIcon, DAMPING_RATIO, FREQUENCY, { ImageTransparency = 1, Size = UDim2.fromOffset(0, 0) })
            spr.target(InactiveIcon, DAMPING_RATIO, FREQUENCY, { ImageTransparency = 0, Size = UDim2.fromOffset(26, 26) })
        end
    end

    Item.MouseEnter:Connect(function()
        if state == "Deselected" then
            state = "Viewing"
            updateVisuals()
        end
    end)

    Item.MouseLeave:Connect(function()
        if state == "Viewing" then
            state = "Deselected"
            updateVisuals()
        end
    end)

    Item.MouseButton1Click:Connect(function()
        if state == "Deselected" or state == "Viewing" then
            state = "Selected"
        elseif state == "Selected" then
            state = "Deselected"
        end
        updateVisuals()
    end)

    return Item
end