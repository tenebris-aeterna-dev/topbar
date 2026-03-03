local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

return function()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
    ScreenGui.DisplayOrder = 1000
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Name = "topbar"
    ScreenGui.Parent = LocalPlayer.PlayerGui

    local Container = Instance.new("Frame")
    Container.Name = "container"
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1, 0, 0, 56)
    Container.Parent = ScreenGui
    
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Name = "listLayout"
    ListLayout.FillDirection = Enum.FillDirection.Horizontal
    ListLayout.Padding = UDim.new(0, 6)
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Parent = Container

    local Padding = Instance.new("UIPadding")
    Padding.Name = "padding"
    Padding.PaddingLeft = UDim.new(0, 6)
    Padding.PaddingRight = UDim.new(0, 16)
    Padding.PaddingTop = UDim.new(0, 12)
    Padding.Parent = Container

    return Container
end