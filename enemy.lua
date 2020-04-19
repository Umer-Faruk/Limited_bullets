
Enemy = Object:extend()

canShoot = true
canShootTimerMax = 0.5
canShootTimer = canShootTimerMax

local nbullet = 0
local mnbullet = 6
function Enemy:new()
     self.p1 = {x=10,y=love.graphics.getHeight()-40,width=40,heigth=40,c={1,1,1},speed = 300}
     self.bimage = love.graphics.newImage('bullet.png')
     self.bullets = {}
     
end

function Enemy:update(dt)
     if love.keyboard.isDown('d') then 
          self.p1.x = self.p1.x + self.p1.speed *dt
         elseif love.keyboard.isDown('a') then
          self.p1.x = self.p1.x - self.p1.speed *dt
     
         end
     
         local wind_width = love.graphics.getWidth()
     --     print(wind_width)
     
         if self.p1.x < 0 then
          self.p1.x = 0
         elseif self.p1.x > wind_width-self.p1.width then
          self.p1.x =  wind_width - self.p1.width 
         end


     canShootTimer = canShootTimer - (1 * dt)
     if canShootTimer < 0 then
       canShoot = true
     end
 
     if love.keyboard.isDown('w') and canShoot then
          newbullet = {x = self.p1.x+20 , y = self.p1.y, width= 2 ,height=4, img = self.bimage}

          if nbullet < mnbullet then
          table.insert(self.bullets,newbullet)
          nbullet = nbullet + 1
          end
 
          canShoot = false
            canShootTimer = canShootTimerMax
     end
 
 
     -- update the positions of bullets
     for i, bullet in ipairs(self.bullets) do
          bullet.y = bullet.y - (bulletspeed * dt)
          for j ,box in ipairs(boxs) do
               if iscollide(bullet.x,bullet.y,bullet.width,bullet.height,box.x,box.y,box.width,box.height) then
                   table.remove(boxs,j)
                   table.remove(self.bullets,i)
                   score = score+1
                   mb:createbox()
               end
          end

          if iscollide(bullet.x,bullet.y,bullet.width,bullet.height,p1bullethose.x,p1bullethose.y,p1bullethose.width,p1bullethose.height) then
               table.remove(self.bullets,i)
          end

          if bullet.y < 0 then -- remove bullets when they pass off the screen
               table.remove(self.bullets, i)
             end
     end

          --reset bullets
     if iscollide(self.p1.x,self.p1.y,self.p1.width,self.p1.heigth,p1bullethose.x,p1bullethose.y,p1bullethose.width,p1bullethose.height) then
          
          nbullet = 0
          mnbullet = 6
        end
         
     
end

function Enemy:draw()
     love.graphics.setColor(self.p1.c)
     love.graphics.rectangle("fill",self.p1.x,self.p1.y,self.p1.width,self.p1.heigth)

   

     -- love.graphics.setColor(1,0,0)
     for i, bullet in ipairs(self.bullets) do
          love.graphics.draw(bullet.img, bullet.x, bullet.y)
        end

        --bullet room
        love.graphics.setColor(0,0,0)
        love.graphics.print("left",self.p1.x,self.p1.y)
        

end

function iscollide(ax,ay,aw,ah,bx,by,bw,bh)

     return ax < bx+bw and ay < by+bh and bx < ax+aw and by < ay+ah 

end