# Run-length-encoding is a simple form of data compression:
#   if an element (e) occurs (n) consecutive times in input stream replace the consecutive
#   occurrences with a single pair (ne)
#
# Examples:
#   a    -> 1a
#   aa   -> 2a
#   aabb -> 2a2b
#   abc  -> 1a1b1c

def compress(input_stream)
    input_stream.chars.chunk_while { |x, y| x == y }.flat_map { |e| [e.size, e.first] }.join
end

pp compress("a")
pp compress("aa")
pp compress("aabb")
pp compress("abc")
