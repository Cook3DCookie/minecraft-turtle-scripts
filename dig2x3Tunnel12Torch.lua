-- Strict following of specified digging pattern
local distance = 0
local torchInterval = 12

--[[function tryDig()
    while turtle.detect() do
        if not turtle.dig() then
            sleep(0.5)
        else
            break
        end
    end
end

function tryDigUp()
    while turtle.detectUp() do
        if not turtle.digUp() then
            sleep(0.5)
        else
            break
        end
    end
end]]

function placeTorchIfNeeded()
    if distance % torchInterval ~= 0 then return end
    
    for s=1,16 do
        turtle.select(s)
        local data = turtle.getItemDetail()
        if data and data.name == "minecraft:torch" then
            if turtle.detectDown() then
                turtle.place()
            end
            break
        end
    end
end

while true do
    -- Step 1: Dig forward
    turtle.dig()
    
    -- Step 2: Turn left and dig
    turtle.turnLeft()
    turtle.dig()
    
    -- Step 3: Turn right (face forward)
    turtle.turnRight()
    
    -- Step 4: Turn right and dig
    turtle.turnRight()
    turtle.dig()
    
    -- Step 5: Turn right and maybe place torch
    turtle.turnRight()
    placeTorchIfNeeded()
    
    -- Step 6: Turn left twice
    turtle.turnLeft()
    turtle.turnLeft()
    
    -- Step 7: Dig above
    turtle.digUp()
    
    -- Step 8: Move up
    --[[while not turtle.up() do
        tryDigUp()
        sleep(0.5)
    end]]
    
    turtle.up()
    
    -- Step 9: Turn left and dig
    turtle.turnLeft()
    turtle.dig()
    
    -- Step 10: Turn right twice and dig
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    
    -- Step 11: Turn left and move down
    turtle.turnLeft()
    --[[while not turtle.down() do
        sleep(0.5)
    end]]
    
    turtle.down()
    
    -- Step 12: Move forward
    --[[while not turtle.forward() do
        tryDig()
        sleep(0.5)
    end]]
    turtle.forward()
    
    distance = distance + 1
end