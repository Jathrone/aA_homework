class Map
    def initialize
        @map = []
    end

    def set(key, value)
        been_set = false
        @map.each_with_index do |pair, i|
            if pair[0] == key
                @map[1] = value
                been_set = true
            end
        end
        if !been_set
            @map << [key, value]
        end
    end

    def get(key)
        @map.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
    end

    def delete(key)
        @map.filter do |pair|
            if pair[0] == key
                true
            else
                false
            end
        end
    end

    def show
        @map.each {|k, v| p "#{k} => #{v}"}
    end
end