return function(container: Frame, layoutOrder: number)
    local List = Instance.new("Frame")
    List.Name = "list"
    List.BackgroundColor3 = Color3.fromRGB(18, 18, 21)
    List.BackgroundTransparency = 0.08
    List.AutomaticSize = Enum.AutomaticSize.X
    List.Size = UDim2.fromOffset(44, 44)
    List.LayoutOrder = layoutOrder
    List.Parent = container

    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Name = "listLayout"
    ListLayout.FillDirection = Enum.FillDirection.Horizontal
    ListLayout.Padding = UDim.new(0, 6)
    ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Parent = List

    local Padding = Instance.new("UIPadding")
    Padding.Name = "padding"
    Padding.PaddingLeft = UDim.new(0, 4)
    Padding.PaddingRight = UDim.new(0, 4)
    Padding.PaddingTop = UDim.new(0, 4)
    Padding.PaddingBottom = UDim.new(0, 4)
    Padding.Parent = List

    local Corner = Instance.new("UICorner")
    Corner.Name = "corner"
    Corner.CornerRadius = UDim.new(0, 22)
    Corner.Parent = List

    return List
end