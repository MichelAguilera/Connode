local Connode = require(game:GetService("ReplicatedStorage").Common:WaitForChild("Connode"))

local line = Connode.defineLine({

    separation = 10,

    origin_x = 0,
    origin_y = 0,
    origin_z = 0,

    angle_x = 0,
    angle_y = 45,
    angle_z = 0,

    subject_angle_x = 0,
    subject_angle_y = 0,
    subject_angle_z = 0

})

local number = 5
local curve = Connode.defineBezierCurve({

    number_of_objects = number,

    point_origin =          {x = 0, y = 0, z = 0},
    point_1 =               {x = 50, y = 0, z = 50},
    point_2 =               {x = 100, y = 0, z = 100},
    point_destination =     {x = 150, y = 0, z = 0},

    subject_angle_x = 0,
    subject_angle_y = 0,
    subject_angle_z = 0

})

-- for i = 0, 10, 1 do line:drawNodeFromLine(i) end
for i = 1, number, 1 do
    local part = Instance.new("Part")

    part.Name = "Point"..tostring(i)
    part.Anchored = true
    part.Size = Vector3.new(2,2,2)
    part.Position = curve:drawNodeFromBezier(i)

    part.Parent = game:GetService("Workspace")
end