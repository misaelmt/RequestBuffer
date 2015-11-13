local buffer = {
    list = nil,
    callback = nil,
    bufferSize = nil,
    first = nil,
    
    debug = false,
}


function buffer:new(callback, bufferSize)
    buffer.list = {}
    buffer.callback = callback
    
    if bufferSize ~= nil and bufferSize > 0 then
        buffer.bufferSize = bufferSize
    else
        buffer.bufferSize = 4
    end
    
    buffer.first = 0
end


function buffer:sendRequest()
    if buffer.first > 0 then
        if buffer.debug then
            print('======== Payload to be send ========')
            for i = 1, buffer.first do
                print (buffer.list[i])
            end
            print('========== End of Payload ==========')
        end

        buffer.first = 0
        buffer.callback()
    end
end


function buffer:add(jsonValue)
    if jsonValue ~= nil then
        buffer.first = buffer.first + 1
        buffer.list[buffer.first] = jsonValue
        
        if buffer.debug then
            print('Adding ' .. jsonValue)
        end
    end
    
    if buffer.first >= buffer.bufferSize then
        buffer:sendRequest()
    end
end


return buffer
