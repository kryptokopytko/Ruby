class Jawna 
    def zaszyfruj(key)
        napis = ""
        for i in 0...@napis.length
            napis += @napis[i]
        end
        key.each { |k, v| 
            for i in 0...@napis.length
                if @napis[i] == k
                    napis[i] = v
                end
            end
        }
        pom = Zaszyfrowana.new(napis)
        pom
    end
    def initialize(napis)
        @napis = napis
    end
    def to_s 
        @napis
    end
end

class Zaszyfrowana
    def odszyfruj(key)
        napis = ""
        for i in 0...@szyfr.length
            napis += @szyfr[i]
        end
        key.each { |v, k| 
            for i in 0...@szyfr.length
                if @szyfr[i] == k
                    napis[i] = v
                end
            end
        }
        pom =  Jawna.new(napis)
        pom
    end
    def initialize(szyfr)
        @szyfr = szyfr
    end 
    def to_s
        @szyfr
    end
end

a = Jawna.new("abcd efgh")
#puts a.to_s
key = { 'a' => 'b', 'b' => 'c', 'c' => 'd', 'd' => 'e'}
puts a.zaszyfruj(key)
puts a.zaszyfruj(key).odszyfruj(key)

