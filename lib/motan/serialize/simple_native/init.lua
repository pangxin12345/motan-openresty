local cmotan = require "cmotan"
local _M = {
    _VERSION = "0.0.1"
}

function _M.serialize(params)
    return cmotan.simple_serialize({params})
end

function _M.serialize_multi(params)
    if #params == 0 then
        return nil, nil
    end
    local stat, result = pcall(cmotan.simple_serialize, params)
    if not stat then
        return nil, result
    end
    return result, nil
end

function _M.deserialize(data)
    local stat, result = pcall(cmotan.simple_deserialize, data)
    if not stat then
        return nil, result
    end
    if result == nil or #result == 0 then
        return nil, nil
    end
    return result[1], nil -- index from 1
end

function _M.deserialize_multi(data, args_num)
    local stat, result = pcall(cmotan.simple_deserialize, data)
    if not stat then
        return nil, result
    end
    return result, nil
end

return _M
