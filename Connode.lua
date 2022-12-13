Connode = {}
Connode.__index = Connode

function Connode.defineLine(
    node_number, separation, 
    origin_x, origin_y, origin_z, 
    angle_x, angle_y, angle_z, 
    subject_angle_x, subject_angle_y, subject_angle_z
)
    local self = setmetatable({}, Connode)
    self.separation = separation
    
    self.origin_x = origin_x
    self.origin_y = origin_y
    self.origin_z = origin_z
    
    self.angle_a = angle_z
    self.angle_b = angle_x
    self.angle_c = angle_y

    self.subject_angle_x = subject_angle_x or 0
    self.subject_angle_y = subject_angle_y or 0
    self.subject_angle_z = subject_angle_z or 0

    return self
end

function Connode:drawNode(node_number)

    local hypotenuse = self.separation * node_number

    local y = hypotenuse * math.sin(self.angle_a)
    local x = math.sqrt((hypotenuse)^2 - (y)^2)

    local z = 0

    local Node = Vector3.new(x, y, z)
    return Node
end

return Connode