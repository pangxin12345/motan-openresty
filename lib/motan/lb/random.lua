-- Copyright (C) idevz (idevz.org)

local math = require "math"
local setmetatable = setmetatable

local _M = {
    _VERSION = "0.0.1"
}

local mt = {__index = _M}

function _M.new(self, url)
    local random = {
        url = url,
        endpoints = {},
        name = "random",
        weight = "",
        math.randomseed(os.time())
    }
    return setmetatable(random, mt)
end

function _M.on_refresh(self, endpoints)
    self.endpoints = endpoints
end

function _M.select(self, req) --luacheck:ignore
    local endpoints_temp = self.endpoints
    for i = 1, #endpoints_temp do
        local index = math.random(1, #endpoints_temp)
        local endpoint = endpoints_temp[index]
        if endpoint:is_available() then
            return endpoint
        end
    end

    --for _, endpoint in ipairs(self.endpoints) do
    --    if endpoint:is_available() then
    --        return endpoint
    --    end
    --end
end

function _M.select_array(self, req) --luacheck:ignore
end

function _M.set_weight(self, weight) --luacheck:ignore
end

function _M.select_index(self, req) --luacheck:ignore
end

return _M
