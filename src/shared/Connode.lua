Connode = {}
Connode.__index = Connode

-- LINE
function Connode.defineLine(
    -- separation,
    -- origin_x, origin_y, origin_z,
    -- angle_x, angle_y, angle_z,
    -- subject_angle_x, subject_angle_y, subject_angle_z
    args
)
    print(
        "\nLine defined: \nANGLE="
        ..args.angle_y..
        "\nORIGIN="
        ..args.origin_x.." "
        ..args.origin_y.." "
        ..args.origin_z..
        "\nSEPARATION="
        ..args.separation
    )

    local self = setmetatable({}, Connode)
    self.separation = args.separation
    
    self.origin_x = args.origin_x
    self.origin_y = args.origin_y
    self.origin_z = args.origin_z
    
    self.angle_x = args.angle_x
    self.angle_y = args.angle_y
    self.angle_z = args.angle_z

    self.subject_angle_x = args.subject_angle_x or 0
    self.subject_angle_y = args.subject_angle_y or 0
    self.subject_angle_z = args.subject_angle_z or 0

    return self
end

function Connode:drawNodeFromLine(node_number)
    local hypotenuse = self.separation * node_number
    local y = 0
    local x = hypotenuse * math.sin(math.rad(self.angle_y)); print("x is", x)
    local z = math.sqrt((hypotenuse)^2 - (x)^2); print("z is", z)
    local Node = Vector3.new(x, y, z)
    return Node
end

-- BEZIER CURVE
function Connode.defineBezierCurve(
    --[[
        number_of_objects = INT,

        point_origin =          {x = FLOAT, y = FLOAT, z = FLOAT}, <- TABLE
        point_1 =               {x = FLOAT, y = FLOAT, z = FLOAT}, <- TABLE
        point_2 =               {x = FLOAT, y = FLOAT, z = FLOAT}, <- TABLE
        point_destination =     {x = FLOAT, y = FLOAT, z = FLOAT}, <- TABLE

        subject_angle_x = FLOAT,
        subject_angle_y = FLOAT,
        subject_angle_z = FLOAT
    ]]
    args
)
    local self = setmetatable({}, Connode)

    self.number_of_objects = args.number_of_objects

    self.point_origin =         {x = args.point_origin.x,       y = args.point_origin.y,        z = args.point_origin.z}
    self.point_1 =              {x = args.point_1.x,            y = args.point_1.y,             z = args.point_1.z}
    self.point_2 =              {x = args.point_2.x,            y = args.point_2.y,             z = args.point_2.z}
    self.point_destination =    {x = args.point_destination.x,  y = args.point_destination.y,   z = args.point_destination.z}

    self.subject_angle_x = args.subject_angle_x or 0
    self.subject_angle_y = args.subject_angle_y or 0
    self.subject_angle_z = args.subject_angle_z or 0

    return self
end

function Connode:drawNodeFromBezier(node_number)
    
    -- B(t) = (1 - t)^3 * P_0   +
    -- 3(1 - t)^2 * P_1         +
    -- 3(1 - t)t^2 * P_2        +
    -- t^3 * P_3, 0 <= t <= 1
    
    local t = node_number/self.number_of_objects; assert(t <= 1 and t >= 0, "Invalid 't' value in Connode:drawNodeFromBezier")

    local Bezier_x = (
          ((1 - t)^3) * self.point_origin.x)
        + (3 * ((1 - t)^2) * self.point_1.x)
        + (3 * (1 - t) * (t^2) * self.point_2.x)
        + ((t^3) * self.point_destination.x
    )

    local Bezier_z = (
          ((1 - t)^3) * self.point_origin.z)
        + (3 * ((1 - t)^2) * self.point_1.z)
        + (3 * (1 - t) * (t^2) * self.point_2.z)
        + ((t^3) * self.point_destination.z
    )

    local Bezier = Vector3.new(Bezier_x, 0, Bezier_z)
    return Bezier
end

return Connode