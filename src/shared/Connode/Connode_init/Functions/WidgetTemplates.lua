WidgetTemplates = {}
WidgetTemplates.__index = WidgetTemplates

function WidgetTemplates.Frame(Name, Parent)
    print("Making Frame: "..Name, Parent)

    local Frame = Instance.new("Frame")
    Frame.Name = Name
    Frame.Size = UDim2.fromScale(200, 200)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    Frame.Parent = Parent
end

return WidgetTemplates