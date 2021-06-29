local skynet = require "skynet"

skynet.start(function()
    local addr = skynet.newservice("guid_generator", 888) --0~1048575
    for i=1, 10000 do
        local uid = skynet.call(addr, "lua")
        skynet.error(uid, uid >> 33, (uid >> 13)&((1<<20)-1), uid&((1<<13)-1))
    end
end)