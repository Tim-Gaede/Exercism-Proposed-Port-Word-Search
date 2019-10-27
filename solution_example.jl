# Returns starting and ending row and column for a word
# inside a puzzle grid of letters
function location(grid::Array{String, 1}, word::String)
    for r₀ = 1 : length(grid)
        for c₀ = 1 : length(grid[r₀])
            if grid[r₀][c₀] == word[1]
                for ➡r = -1 : 1      # direction of search in rows from origin
                    for ➡c = -1 : 1  # direction of search in cols from origin
                        if ➡r ≠ 0  ||  ➡c ≠ 0
                            mismatch_fnd = false
                            i = 2
                            while !mismatch_fnd  &&  i ≤ length(word)
                                r = r₀ + ➡r * (i-1)
                                c = c₀ + ➡c * (i-1)

                                if r ∉ range(1, stop=length(grid))     ||
                                   c ∉ range(1, stop=length(grid[r₀])) ||
                                   grid[r][c] ≠ word[i]

                                    mismatch_fnd = true

                                else
                                    i += 1
                                end
                            end
                            if !mismatch_fnd
                                r = r₀ + ➡r * (length(word)-1)
                                c = c₀ + ➡c * (length(word)-1)

                                return [r₀, c₀], [r, c]
                            end
                        end
                    end
                end
            end
        end
    end
end
