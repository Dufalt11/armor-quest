love.graphics.setDefaultFilter('nearest','nearest')

frame = 1
frame_Q = 5
time = 2

function love.load()
    armo_Q = 128
    armo_AT = love.graphics.newImage('armo.png')
    armo = love.graphics.newQuad(0,0,32,4,armo_AT:getDimensions())
end

function love.update(dt)
    armo:setViewport(armo_Q,0,32,4)

    if love.keyboard.isDown('a') then
        armo_Q = armo_Q - 32
        time = 0
        if armo_Q < 0 then
            armo_Q = 0
        end
    end


    if time < 2  then
         time = time + 0.5 * dt
    end

    if armo_Q < 128 and time > 2 then
        armo_Q = armo_Q + 32
        time = 0
    end
end

function love.draw()
    love.graphics.draw(armo_AT,armo,20,20,0,5)
    love.graphics.print(time,0,0)
end

