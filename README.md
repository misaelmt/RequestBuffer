# RequestBuffer
Fast implementation of a queue that empties itself when it is "full". 
It empties using a callback function. 
The purpose is to save server requests and send them using only one server request. 
This helps to reduce bandwidth and data usage. 
For an usage example look at my [LogglyBufferMod](https://github.com/misaelmt/LogglyBufferMod "LogglyBufferMod")
