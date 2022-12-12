--Amath: all math (fmath and math)
ppls.Amath = {
    abs = function(x) 
        return x - (x-x) 
    end,

    floor = function(x) 
        return x // 1
    end,

    ceil = function(x) 
        return (x+1) // 1
    end,

    round = function(x)
        return (x + (x/x)/2) // 1
    end,

    normalize = function(x,y)
        local mag = fmath.sqrt((x*x)+(y*y))
        if mag > 0fx then
            return x/mag,y/mag
        end
    end,

    random = function(min,max)
        local arr = {}
        local num = min
        local times = 0
        for i = min, max,min/min do
            table.insert(arr,num)
            num = num + 1
            times = times + 1
        end
        local random = fmath.random_int(1, times)
        return arr[random]
    end,

    -- Special Functions
    lerp = function(a,b,t)--point a to point b, t has to be somewhere from 0 to 1
        local v = ((a/a) - t) * a + b * t
        return v--return value
    end,

    invLerp = function(a,b,v)--point a to point b, but value is used
        local t = (v - a) / (b - a)
        return t--return t
    end,

    remap = function(iMin,iMax,oMin,oMax,iv)
        local t = ppls.Amath.invLerp(iMin,iMax,iv)--get t from inputs
        return ppls.Amath.lerp(oMin,oMax,t)--return output value
    end
}