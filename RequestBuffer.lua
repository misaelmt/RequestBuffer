--[[
Request buffer to send multiple requests to a server in one call.
Copyright (c) 2015 Misael Madrigal Torres.
https://github.com/misaelmt/RequestBuffer
]]--


local buffer = {
    list = nil,
    callback = nil,
    bufferSize = nil,
    last = nil,
    
    debug = false,
}


function buffer:new(callback, bufferSize)
    self.list = {}
    self.callback = callback
    
    if bufferSize ~= nil and bufferSize > 0 then
        self.bufferSize = bufferSize
    else
        self.bufferSize = 4
    end
    
    self.last = 0
end


function buffer:sendRequest()
    if self.last > 0 then
        if self.debug then
            print('======== Payload to be send ========')
            for i = 1, self.last do
                print (self.list[i])
            end
            print('========== End of Payload ==========')
        end

        self.callback()
        self.last = 0
    end
end


function buffer:add(value)
    if value ~= nil then
        self.last = self.last + 1
        self.list[self.last] = value
        
        if self.debug then
            print('Adding ' .. value)
        end
    end
    
    if self.last >= self.bufferSize then
        self:sendRequest()
    end
end



return buffer
