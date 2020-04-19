Mbox = Object:extend()
boxs ={}
function Mbox:new()
     self.b = {x= 100,y=100,width = 40,height= 40 , c={0,1,0} }
     local box = { }
     self.createbox()
end

function Mbox:update(dt)
     self.b.x = self.b.x + 100 *dt
     -- self.b.y  = math.random(60,300)
     for i=#boxs, 1, -1 do
          
          print(i)
          local enemy = boxs[i]
          if not enemy.removed then
            enemy.x = enemy.x + 100 *dt
            if enemy.x > 800 then
               
               self.createbox()
               table.remove(boxs,i)
               score = score - 1
            end
          end
          
        end
end

function Mbox:draw()
     
     love.graphics.rectangle("fill",self.b.x,self.b.y,self.b.width,self.b.height)
     
     for i=#boxs, 1, -1 do
          local enemy = boxs[i]
          -- draw stuff
          love.graphics.rectangle("line", enemy.x, enemy.y, enemy.width, enemy.height)
        end

    
end

function Mbox:createbox()
     local box = {width=40,height=40}
     box.x = 50
     box.y = math.random(50,500)
     box.removed = false
     
     table.insert(boxs,box)
end

function love.keypressed(key)
     if key == "f" then
         self.createbox()
     end
end