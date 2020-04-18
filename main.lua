p1bullethose = {x=730,y=530,width=70,height=70}
p2bullethose = {x=0,y=0,width=70,height=70}
myfount1 = love.graphics.newFont(20)
background = {x=10,y=10,width=780,height=580,c={.2,.45,.14}}
function love.load()
     Object = require "classic"
               require "player"
               require "enemy"
               require "bullet"
               require "mvbox"

     p=Player()
     e= Enemy()
     b = Bullet(p.p1.x,p.p1.y)
     b1 = Bullet(p.p1.x,p.p1.y)
     -- box = Mbox()
     -- box.createbox()
     -- BL ={}
     print(p1bullethose.x,p1bullethose.y,p1bullethose.width,p1bullethose.height)

    
end


function love.update(dt)
     p:update(dt)
     e:update(dt)
     -- box:update(dt)
     
     
    

end


function love.draw()
    
     p:draw()
     e:draw()
     
     love.graphics.setColor(1,0,0)
     love.graphics.rectangle("line",p1bullethose.x,p1bullethose.y,p1bullethose.width,p1bullethose.height)

     
     love.graphics.rectangle("line",p2bullethose.x,p2bullethose.y,p2bullethose.width,p2bullethose.height)

     love.graphics.setColor(1,0,0)
     love.graphics.setFont(myfount1)

     
     love.graphics.print("load \n bullet",p1bullethose.x,p1bullethose.y)
     love.graphics.print("load \n bullet",p2bullethose.x,p2bullethose.y)

     -- box:draw()

     
     -- love.graphics.setColor(background.c)
     -- love.graphics.rectangle("fill",background.x,background.y,background.width,background.height)
     





end
