local buffer = require 'RequestBuffer'


local function f()
    print '-- client sending'
end


buffer.debug = true
buffer:new(f, 2)

buffer:add('hola')
buffer:add('mundo')
buffer:add('bye')
buffer:add('1')
buffer:add('2')
buffer:add('3')
buffer:sendRequest()
buffer:sendRequest()
buffer:sendRequest()
buffer:add('4')
buffer:sendRequest()
buffer:sendRequest()
buffer:sendRequest()

local myTable = {
    val1 = 1,
    valStr = "String",
    age = 34
}
buffer:add(tostring(myTable))
buffer:add(tostring("Hello\nworld"))

local str = "Hello\nworld"
print("str: " .. str:gsub("\n", ""))
