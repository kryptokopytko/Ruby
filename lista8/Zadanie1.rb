class Integer
    def czynniki
        pom = self
        tab = []
        dzielnik = 1
        while pom >= dzielnik * dzielnik
            if pom % dzielnik == 0
                tab.push(dzielnik)
                tab.push(pom / dzielnik)
            end
            dzielnik += 1
        end
        tab
    end 
    def wypisz_czynniki
        puts czynniki.inspect
    end
    def ack(y)
        def ackermann(n, m)
            if n == 0
                m + 1
            elsif
                m == 0
                ackermann(n - 1, 1)
            else
                ackermann(n - 1, ackermann(n, m - 1))
            end
        end
        ackermann(self, y)
    end
    def doskonala 
        if czynniki.sum == 2 * self
            true
        else
            false
        end
    end
    def slownierev (n, tab)
        if n == 0
            tab
        else
            if n % 10 == 0
                tab.push("zero")
            elsif n % 10 == 1
                tab.push("jeden")
            elsif n % 10 == 2
                tab.push("dwa")
            elsif n % 10 == 3
                tab.push("trzy")
            elsif n % 10 == 4
                tab.push("cztery")
            elsif n % 10 == 5
                tab.push("piec")
            elsif n % 10 == 6
                tab.push("szesc")
            elsif n % 10 == 7
                tab.push("osiem")
            elsif n % 10 == 8
                tab.push("osiem")
            else
                tab.push("dziewiec")
            end
            slownierev(n / 10, tab)
        end
    end
    def slownie     
        slownierev(self, []).reverse
    end
            
end

#32.wypisz_czynniki
#puts 3.ack(2)
#puts 6.doskonala.inspect
#puts 123.slownie.inspect
