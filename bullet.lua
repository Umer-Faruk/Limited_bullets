Bullet = Object:extend()

function Bullet:new(x,y)
    self.img = love.graphics.newImage("bullet.png")
    self.x = x
    self.y = y
    self.speed = 200
end

function Bullet:update(dt)
     self.y = self.y + self.speed * dt


end

function Bullet:draw()
     love.graphics.draw(self.img,self.x,self.y)
end