-- Bouncing Box test script
local box = {
    x = 100, --x -coord init
    y = 100, --y coord init
    size = 30, -- box size
    speed = 300, -- box speed
    vx = 1,  -- initial x-axis velocity
    vy = 1,  -- initial y-axis velocity 
    r = 0, -- initial red value
    g = 0, -- inital green val
    b = 0, -- initali blue val
    color = {r, g, b}, -- inital color (black)
    inc = 0.1 -- color increment
}

-- disable screen clearing
love.graphics.clear = function() end

-- Love2D init
function love.load()
    love.window.setTitle("Bouncy Box")
    love.window.setMode(640,480)
end

-- update function
function love.update(dt)
    -- Update box position based on velocity and speed
    box.x = box.x + box.vx * box.speed * dt
    box.y = box.y + box.vy * box.speed * dt
    changeColor()

    -- check for edge collision
    if box.x <= 0 or (box.x + box.size) >= love.graphics.getWidth() then
        box.vs = -box.vx --Reverse x-velocity on collision
    end
    if box.y <= 0 or (box.y + box.size) >= love.graphics.getHeight() then
        box.vy = -box.vy -- reverse y-velocity on collision
    end
end

-- Draw Function
function love.draw()
    love.graphics.setColor(box.color)
    love.graphics.rectangle("fill", box.x, box.y, box.size, box.size)
end

-- Change box color
function changeColor()
    box.r = box.r + box.inc
    if box.r > 1 then
        box.r = 0
        box.g = box.g + box.inc
    end
    if box.g > 1 then
        box.g = 0
        box.b = box.b + box.inc
    end
    if box.b > 1 then
        box.b = 0
    end
    box.color = {box.r, box.g, box.b}
end