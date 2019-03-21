def sluggish_octopus(fish_arr)
    sorted = false
    while !sorted
        sorted=true
        (0...fish_arr.length-1).each do |idx1|
            if fish_arr[idx1].length > fish_arr[idx1 + 1].length
                fish_arr[idx1], fish_arr[idx1 + 1] = fish_arr[idx1 + 1],  fish_arr[idx1]
                sorted = false
            end
        end
    end
    fish_arr[-1]
end


def dominant_octopus(fish_arr, outermost = true)
    def merge(left, right)
        result = []
        until left.empty? || right.empty?
            if left.first.length < right.first.length
                result << left.shift
            else
                result << right.shift
            end
        end
        result + left + right
    end
    if !outermost
        return fish_arr if fish_arr.length < 2
    end
    mid_idx = fish_arr.length / 2
    left = dominant_octopus(fish_arr[0...mid_idx], false)
    right = dominant_octopus(fish_arr[mid_idx..-1], false)
    sorted = merge(left, right)
    if outermost
        return sorted[-1]
    else
        return sorted
    end
end

def clever_octopus(fish_arr)
    fish_arr.inject() {|ac, el| ac.length < el.length ? el : ac}
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dir, tiles_arr)
    tiles_arr.each_with_index do |tile, idx|
        return idx if tile == dir
    end
end


tiles_hash = {}
tiles_arr.each_with_index do |tile, idx|
    tiles_hash[tile] = idx
end

def constant_dance(dir, tiles_hash)
    tiles_hash[dir]
end