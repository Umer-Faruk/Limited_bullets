
Player = Object.extend(Object)
-- canShoot = true
-- canShootTimerMax = 0.5
-- canShootTimer = canShootTimerMax
bulletspeed = 400


local  nbullet = 0
     local mnbullet = 6
img = love.graphics.newImage("sheep.png")

function Player:new()
     Object = require "classic"
               require "mvbox"
     mb = Mbox()
     self.p1 = {x=10,y=10,width=40,heigth=40,c={1,0,1},speed = 300}
     -- self.BL ={}
   

     mb:createbox()
     self.bimage = love.graphics.newImage('bullet.png')
    self.bullets = {}
--     print(p1bullethose.x,p1bullethose.y,p1bullethose.width,p1bullethose.height)


     
end

function Player:update(dt)

     mb:update(dt)

    if love.keyboard.isDown("right") then 
     self.p1.x = self.p1.x + self.p1.speed *dt
    elseif love.keyboard.isDown("left") then
     self.p1.x = self.p1.x - self.p1.speed *dt

    end

    local wind_width = love.graphics.getWidth()


    if self.p1.x < 0 then
     self.p1.x = 0
    elseif self.p1.x > wind_width-self.p1.width then
     self.p1.x =  wind_width - self.p1.width 
    end


    canShootTimer = canShootTimer - (1 * dt)
     if canShootTimer < 0 then
           canShoot = true
     end
     --bullet creation
    if love.keyboard.isDown('up') and  canShoot then 
          newbullet = { x= self.p1.x,y = self.p1.y ,width =2 ,height=4, img = self.bimage}
         

          if nbullet < mnbullet then
     
          table.insert(self.bullets,newbullet)
          nbullet = nbullet + 1
          end
          
          canShoot = false
          canShootTimer = canShootTimerMax

    end

    for i, bullet in ipairs(self.bullets) do
     bullet.y = bullet.y + (bulletspeed * dt)
          for j , box in ipairs(boxs) do
               if iscollide(bullet.x,bullet.y,bullet.width,bullet.height,box.x,box.y,box.width,box.height) then
                    table.remove(boxs,j)
                    table.remove(self.bullets,i)
                    mb:createbox()
                    
               end
          end

     if iscollide(bullet.x,bullet.y,bullet.width,bullet.height,p2bullethose.x,p2bullethose.y,p2bullethose.width,p2bullethose.height) then 
          table.remove(self.bullets,i)
     end

 
     if bullet.y > 800 then -- remove bullets when they pass off the screen
       table.remove(self.bullets, i)
     end
   end
   --reset  ullets
   if iscollide(self.p1.x,self.p1.y,self.p1.width,self.p1.heigth,p2bullethose.x,p2bullethose.y,p2bullethose.width,p2bullethose.height) then
     nbullet = 0
     mnbullet = 6
   end
    
    



end

function Player:draw()
     mb:draw()
     love.graphics.setColor(self.p1.c)
     love.graphics.rectangle("fill",self.p1.x,self.p1.y,self.p1.width,self.p1.heigth)

  
     love.graphics.setColor(self.p1.c)

     for i, bullet in ipairs(self.bullets) do

          love.graphics.draw(bullet.img, bullet.x, bullet.y)
        end
      
        love.graphics.setColor(0,0,0)
        love.graphics.print("right",self.p1.x,self.p1.y)
     



end

function iscollide(ax,ay,aw,ah,bx,by,bw,bh)

     return ax < bx+bw and ay < by+bh and bx < ax+aw and by < ay+ah 

end

