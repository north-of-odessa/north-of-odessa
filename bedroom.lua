Bedroom = {}
--by default, you have not "entered" the room. set to true by walking thru room door (if it is declared as true here it is only for debugging, or it is the starting room)
Bedroom.entered = false

function Bedroom:load()
    HallWall, BathWall, DresserWall, BedWall = Gfx.newImage("pics/bedroom/HallWall.png"), Gfx.newImage("pics/bedroom/BathWall.png"), Gfx.newImage("pics/bedroom/DresserWall.png"), Gfx.newImage("pics/bedroom/BedWall.png")
    CurrentFrame = HallWall
    Animation = NewAnimation(Gfx.newImage("pics/bedroom/doorOpenSheet.png"), 312, 232, 2)
end

function Bedroom:update(dt)

    function love.keypressed(key)
        if CurrentFrame == HallWall then
           if key == "left" then
            CurrentFrame = DresserWall
           elseif key == "right" then
            CurrentFrame = BathWall
           --use "space" to set Hallway.entered to true, then load the Hallway.
           elseif key == "space" then
            --TODO: AND if padlock is opened
                Hallway.entered = true
                Bedroom.entered = false
                if Hallway.entered then
                     Hallway:load()
                end
        end
        elseif CurrentFrame == DresserWall then
           if key == "left" then
            CurrentFrame = BedWall
           elseif key == "right" then
            CurrentFrame = HallWall
           elseif key == "up" then
                MusicBox.entered = true
                --enter the music box
                if MusicBox.entered then
                    MusicBox:load()
                end
            elseif key == "space" then
                ClosetOne.entered = true
                if ClosetOne.entered then
                    ClosetOne:load()
                end
            end
        elseif CurrentFrame == BedWall then
            if key == "left" then
             CurrentFrame = BathWall
            elseif key == "right" then
             CurrentFrame = DresserWall
            end
        elseif CurrentFrame == BathWall then
            if key == "left" then
                CurrentFrame = HallWall
            elseif key == "right" then
                CurrentFrame = BedWall
            elseif key == "space" then
                Bathroom.entered = true
                if Bathroom.entered then
                    Bathroom:load()
                end
            end
        end
    end

    Animation.currentTime = Animation.currentTime + dt
    if Animation.currentTime >= Animation.duration then
        Animation.currentTime = Animation.currentTime - Animation.duration
    end

end

function Bedroom:draw()
    SpriteNum = math.floor(Animation.currentTime / Animation.duration * #Animation.quads) + 1
    Gfx.draw(Animation.spriteSheet, Animation.quads[SpriteNum], 0, 0, 0, 1)
    --Gfx.draw(CurrentFrame, 0, 0)
end