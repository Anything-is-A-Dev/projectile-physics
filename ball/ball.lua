require("wall")
local coll = require('collision')
Ball = {}

function Ball:load()
    self.bol = {}
    self.bol.x = 100
    self.bol.y = 200
    self.bol.radius = 20
    self.bol.mass = 1.5
    self.bol.vely = 0
    self.bol.velx = 0

    self.state = "paused"
    self.bol.state = "norm"
end

function Ball:update(dt)
    self:keyinputs()
    self:DISTANCE()
    if self.state == "play" then
        self:Gravity(dt)
        self:throw()
        self:Process(dt)

    end

end

function Ball:draw()
    love.graphics.circle("line", self.bol.x, self.bol.y, self.bol.radius)
    love.graphics.circle("fill", self.bol.x, self.bol.y, self.bol.radius)
end

function Ball:Gravity(dt)
    self.gravity = self.bol.mass * 308 *dt
    self.bol.vely = self.gravity + self.bol.vely 
end

function Ball:throw()
    self.bol.velx = 1000
 
    if isColl then
        self.bol.state = "bounce"
    end
    if self.bol.state == "bounce" then
        self.bol.velx = -1*self.bol.velx
    end

end



function Ball:Process(dt)
    self.bol.x =  self.bol.x + self.bol.velx  *dt
    self.bol.y = self.bol.y + self.bol.vely  *dt
    print(self.distance)


end


function Ball:keyinputs()
    if love.keyboard.isDown("space") then
        self.state = "play"
    elseif love.keyboard.isDown("r") then
        Ball:load()
    end
end

function Ball:DISTANCE() -- idk why i screamed this
    isColl  = coll.collide(self.bol.x, self.bol.y, self.bol.radius, self.bol.radius, Wall.wol.x, Wall.wol.y, Wall.wol.width, Wall.wol.height)
end