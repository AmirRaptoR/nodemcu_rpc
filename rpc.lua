rpc = {}

local handlers = {}

function rpc.add_handler(name,func)
    print("RPC endpoint : "..name)
    handlers[name] = func
end

function rpc.has_handler(name)
    return handlers[name] ~= nil
end

function rpc.call(name,args)
    
    if rpc.has_handler(name) then
        return handlers[name](args)
    end
    return nil
end

function rpc.remote_call(obj)
    ok, tmp = pcall(sjson.decode,obj)

    if not ok then
        return
    end
    print(tmp)        
    method = tmp.method
    args = tmp.args

    return rpc.call(method,args)
end