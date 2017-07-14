
dofile("rpc.lua")


function shaghal_rpc(args)
    if args == "1" then
        print("on")
    else
        print("off")
    end
end


rpc.add_handler("shaghal", shaghal_rpc)
rpc.call("name","1")
rpc.call("{'method':'shaghal', 'args':'1'}")