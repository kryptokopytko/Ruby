class Function2D
    def initialize(function)
        @function = function
    end
    def value(x, y)
        @function.call(x, y)
    end
    def volume(a, b, c, d)
        vol = 0
        e = 0.001
        while a <= b
            cc = c
            while cc <= d
                vol += @function.call(a, cc) * e * e
                cc += e
            end
            a += e
        end
        vol
    end
    def contour_line(a, b, c, d, height)
        tab = []
        e = 0.001
        cc = c
        while a <= b
            c = cc
            while c <= d
                k = @function.call(a, c) - height 
                if (k < e && k > -e)
                    tab.push([a, c])
                end
                c += e
            end
            a += e
        end
        if tab == []
            nil
        else
          tab
        end
    end
end
blok = proc {|x, y| x}
f = Function2D.new(blok)
#puts f.value(2, 3)
#puts f.contour_line(1, 2, 1, 2, 2).inspect
#puts f.volume(0, 1, 0, 1)