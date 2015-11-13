local buffer = {
    list = nil,
    callback = nil,
    bufferSize = nil,
    first = nil,
    
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
    
    self.first = 0
end


function buffer:sendRequest()
    if self.first > 0 then
        if self.debug then
            print('======== Payload to be send ========')
            for i = 1, self.first do
                print (self.list[i])
            end
            print('========== End of Payload ==========')
        end

        self.first = 0
        self.callback()
    end
end


function buffer:add(value)
    if value ~= nil then
        self.first = self.first + 1
        self.list[self.first] = value
        
        if self.debug then
            print('Adding ' .. value)
        end
    end
    
    if self.first >= self.bufferSize then
        self:sendRequest()
    end
end



return buffer
