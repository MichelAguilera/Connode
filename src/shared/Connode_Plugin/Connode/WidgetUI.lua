Widget = {}
Widget.__index = Widget

function Widget.create(Parent)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Parent

    -- MAIN FRAME CHILD
    local TabFrame = Instance.new("Frame")
    TabFrame.Name = "TabFrame"
    TabFrame.Parent = MainFrame

    -- TAB FRAME CHILDREN
    local LineButton = Instance.new("TextButton")
    LineButton.Name = "LineButton"
    LineButton.Text = "Make Line"
    LineButton.Parent = TabFrame

    local CurveButton = Instance.new("TextButton")
    CurveButton.Name = "CurveButton"
    CurveButton.Text = "Make Bezier Curve"
    CurveButton.Parent = TabFrame

    -- MAIN FRAME CHILD
    local InputFrame_Line = Instance.new("Frame")
    InputFrame_Line.Name = "InputFrame"
    InputFrame_Line.Parent = MainFrame

    -- INPUT_FRAME_Line CHILDREN
    local Angle = Instance.new("TextBox")
    Angle.Name = "Angle"
    Angle.Text = ""
    Angle.Parent = InputFrame_Line

    local Angle_btn = Instance.new("TextButton")
    Angle_btn.Name = "Angle_btn"
    Angle_btn.Text = "Set Angle"
    Angle_btn.Parent = InputFrame_Line

    local Separation = Instance.new("TextBox")
    Separation.Name = "Separation"
    Separation.Text = ""
    Separation.Parent = InputFrame_Line

    local Separation_btn = Instance.new("TextButton")
    Separation_btn.Name = "Separation_btn"
    Separation_btn.Text = "Set Angle"
    Separation_btn.Parent = InputFrame_Line

end

return Widget