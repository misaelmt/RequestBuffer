# RequestBuffer
Fast implementation of a queue that empties itself when its full. It empties using a callback function. The purpose is to save server requests and send them using only one call.
