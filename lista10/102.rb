class Wezel
    def initialize (wartosc, poprzedni, nastepny)
        @poprzedni = poprzedni
        @nastepny = nastepny
        @wartosc = wartosc
    end
    def get_poprzedni
        @poprzedni
    end
    def get_nastepny
        @nastepny
    end
    def get_wartosc
        @wartosc
    end
    def set_poprzedni(poprzedni)
        @poprzedni = poprzedni
    end
    def set_nastepny(nastepny)
        @nastepny = nastepny
    end
    def set_wartosc(wartosc)
        @wartosc = wartosc
    end
end

class Kolekcja
    def initialize
        @pierwszy = @ostatni = nil
        @liczba = 0
    end
    def add(elem)
        @liczba += 1
        if @pierwszy == nil
            @pierwszy = @ostatni = Wezel.new(elem, nil, nil)
        else
            pomocniczy = @pierwszy
            while pomocniczy.get_nastepny!= nil && pomocniczy.get_nastepny.get_wartosc < elem  
                pomocniczy = pomocniczy.get_nastepny
            end
            if pomocniczy.get_nastepny != nil
                pomocniczy.set_nastepny( Wezel.new(elem, pomocniczy, pomocniczy.get_nastepny))
                pomocniczy.get_nastepny.get_nastepny.set_poprzedni(pomocniczy.get_nastepny)
            else
                pomocniczy.set_nastepny( Wezel.new(elem, nil, nil) )
                @ostatni = pomocniczy.get_nastepny
                @ostatni.set_poprzedni(pomocniczy)
            end
        end
    end
    def display
        tab = []
        pom = @pierwszy
        while pom != nil
            tab.push( pom.get_wartosc )
            pom = pom.get_nastepny
        end
        puts tab.inspect
    end
    def ity_elem(i)
        if i >= @liczba 
            raise 'index out of range!'
        else
            pom = @pierwszy
            for j in 0...i
                pom = pom.get_nastepny
            end
            pom.get_wartosc
        end
    end
    def get_rozmiar
        @liczba
    end
end

class Wyszukiwanie
    def wyszukiwanie1(kolekcja, elem)
        i = 0
        while kolekcja.ity_elem(i) < elem
            i += 1
        end
        if kolekcja.ity_elem(i) == elem
            i
        else
            false
        end
    end
    def wyszukiwanie2(kolekcja, elem)
        bin(kolekcja, 0, kolekcja.get_rozmiar, elem)
    end
    def bin(kolekcja, l, r, elem)
        if r < l
            false
        end
        mid = l + (r - l) / 2
        war = kolekcja.ity_elem(mid)
        if (war == elem)
            mid
        elsif (war > elem)
            bin(kolekcja, l, mid - 1, elem)
        else
            bin(kolekcja, mid + 1, r, elem)
        end
    end 
end


k = Kolekcja.new()
k.add(1)
k.add(2)

for i in 0...10
    k.add(20 - i)
end

k.add(13)
k.add(21)
k.add(7)

k.display 

w = Wyszukiwanie.new()
puts w.wyszukiwanie1(k, 12)
puts w.wyszukiwanie2(k, 12)
