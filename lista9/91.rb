class Function
    def initialize(function)
        @function = function
    end
    def value(x)
        @function.call(x)
    end
    def zero(a, b, e)
        tab = []
        while a <= b
            y = @function.call(a)
            if (y < e && y > -e)
                tab.push(a)
            end
            a += e
        end
        if tab == []
            nil
        else
          tab
        end
    end
    def field(a, b)
        field = 0
        e = 0.00001
        while a <= b
            field += @function.call(a) * e
            a += e
        end
        field
    end
    def deriv(x)  #(y2 - y1) / (x2 - x1)
        e = 0.00001
        (@function.call(x + e) - @function.call(x - e)) / (2 * e)
    end
end
blok = proc { | x | x * x * Math.sin(x)}
a = Function.new(blok)
#puts a.value(2)
puts a.zero(0, 3, 0.000001).inspect
#puts a.field(1, 2)
#puts a.deriv(2)