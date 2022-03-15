---Scenes are interactable "areas" intended to live within a room.
---@field string id The id of the scene
---@field string direction The cardinal direction in regards to it's location in the room. In char form.
---@field number x The x coordinate within the room it resides in.
---@field number y The y coordinate within the room it resides in.
---@field boolean isDoor States whether the scene is a door or not. This is important in indicating
---whether any resources should be loaded as another room or if it should load "inside" a room.
---@field boolean isLocked States whether a scene is locked. Usually indicates whether resources
---for a scene will be loaded or not.
local Scene = Class {_includes = Saveable}

---@param id string The id of the scene
---@param direction string Options: n, e, s, w
---@param x number The x coordinate within the room it resides in.
---@param y number The y coordinate within the room it resides in.
---@param isDoor boolean States whether the scene is a door.
---@param isLocked boolean States whether the scene is locked.
function Scene:init(id, direction, x, y, isDoor, isLocked)
    self.id = id
    self.direction = direction
    self.x = x
    self.y = y
    self.isDoor = isDoor
    self.isLocked = isLocked
end

function Scene:enter()
    print("Entering scene " .. self.id)
end

function Scene:update(dt)
end

function Scene:draw()
    System.setFont(Fonts.pixel[30])
    System.print("Scene " .. self.id, 0, 0)
end

function Scene:exit()
    print("Exiting scene " .. self.id)
end

return Scene
