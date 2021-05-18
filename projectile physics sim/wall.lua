Wall = {} -- donald duck be like

function Wall:load()
    self.wol = {}
    self.wol.x = 1050
    self.wol.y = 0
    self.wol.width = 700 -- thicc wol; LIKE YO MAMA
    self.wol.height = 1000 --long wol
end

function Wall:update(dt)
    
end

function Wall:draw()
    love.graphics.rectangle("fill", self.wol.x,self.wol.y,self.wol.width,self.wol.height)--build da wol
end

