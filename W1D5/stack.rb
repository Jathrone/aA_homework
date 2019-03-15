class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack += el
    end

    def pop
        @stack[0...-1]
    end

    def peak
        @stack[-1]
    end
end