class Collection
    def initialize(n)
        @liczby = []
        for i in 0...n
            @liczby.push(i)
        end
    end
    def swap(i, j)
        pom = @liczby[i]
        @liczby[i] = @liczby[j]
        @liczby[j] = pom
    end
    def length
        @liczby.length
    end
    def get(i)
        @liczby[i]
    end
    def add(k)
        @liczby.push(k)
    end
    def display
        puts @liczby.inspect
    end
    def is_greater?(i, j)
        if @liczby[i] < @liczby[j]
            true
        else
            false
        end
    end
end

class Sorter
    def sort1(kolekcja)  #bubble
        len = kolekcja.length
        for i in 0...len
            for j in 0...(len - 1)
                if kolekcja.is_greater?(j + 1, j)
                    kolekcja.swap(j + 1, j)
                end
            end
        end
    end

    def sort2(kolekcja)    #selection      odrobine szybszy
        len = kolekcja.length
        for i in 1...(len - 1)
            min_id = i
            j = i - 1
            for j in (i + 1)...len
                if  kolekcja.is_greater?(j, min_id)
                    min_id = j
                end
            end
            kolekcja.swap(min_id, i)
        end
    end
end


a = Collection.new(12)
for i in 7...20
    a.add(i % 9)
end
a.display

s = Sorter.new

s.sort2(a)

a.display
