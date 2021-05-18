require("ball") -- you do require bol
require("wall") -- you also require wol
function love.load()
    Ball:load()
    Wall:load()
end

function love.update(dt)
    Ball:update(dt)
    Wall:update(dt)
end

function love.draw()
    Ball:draw()
    Wall:draw()
end