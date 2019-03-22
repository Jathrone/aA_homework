  class LRUCache
    attr_accessor :memory
    def initialize(size)
        @memory = Array.new(size)

    end

    def count
        self.memory.count {|ele| !ele.nil?}
    end

    def add(el)
        self.memory.each_with_index do |curr_el, idx|
            if curr_el.nil?
                self.memory[idx] = el
                return true
            elsif curr_el == el 
                if idx == self.memory.length - 1
                    return true
                else
                    self.memory[idx], self.memory[idx + 1] = self.memory[idx + 1], self.memory[idx]
                end
            end
        end
        self.memory = self.memory.drop(1) << el
    end

    def show
        p memory
    end

    private
    # helper methods go here!

  end