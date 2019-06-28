local running = true

local function refuel(min)
    if turtle.getFuelLevel() < min then
        print("Less than " .. tostring(min) .. " fuel. Refueling!") 
        turtle.refuel(1)
    end
end

local function mainLoop()
    local notAir = turtle.detectUp()
    if notAir then
        print("Found a block above, chopping!")
        refuel(2)
        turtle.digUp()
        turtle.up()
    elseif not turtle.detectDown() then
        print("Nothing above, moving down!")
        refuel(1)
        turtle.down()
    else
        print("Reached the bottom again!")
        running = false
    end
end

while running do
    mainLoop()
end