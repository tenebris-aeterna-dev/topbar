return function(container: Frame, layoutOrder: number)
    local Spacer = Instance.new("Frame")
    Spacer.Name = "spacer"
    Spacer.BackgroundTransparency = 1
    Spacer.Size = UDim2.fromOffset(44, 44)
    Spacer.LayoutOrder = layoutOrder
    Spacer.Parent = container

    local Flex = Instance.new("UIFlexItem")
    Flex.Name = "flex"
    Flex.FlexMode = Enum.UIFlexMode.Fill
    Flex.Parent = Spacer

    return Spacer
end