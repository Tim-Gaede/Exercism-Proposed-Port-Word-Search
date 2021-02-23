using Test

include("word_search.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.1

println("\n"^2, "-"^60, "\n"^3)
puzzle_main = ["jefblpepre",
               "camdcimgtc",
               "oivokprjsm",
               "pbwasqroua",
               "rixilelhrs",
               "wolcqlirpc",
               "Screeaumgr",
               "alxhpburyi",
               "jalaycalmp",
               "clojurermt"]

@testset "Accepts initial game puzzle and target word." begin
    puzzle = ["jefblpepre"]
    @test location(puzzle, "clojure") == nothing
end
println()

@testset "One word written left-to-right." begin
    puzzle = ["clojurermt"]
    @test location(puzzle, "clojure") == ([1, 1], [1, 7])
end
println()

@testset "Same word in a different position." begin
    puzzle = ["mtclojurer"]
    @test location(puzzle, "clojure") == ([1, 3], [1, 9])
end
println()

@testset "Another left-to-right word." begin
    puzzle = ["coffeelplx"]
    @test location(puzzle, "coffee") == ([1, 1], [1, 6])
end
println()

@testset "The left-to-right word in another puzzle." begin
    puzzle = ["xcoffeezlp"]
    @test location(puzzle, "coffee") == ([1, 2], [1, 7])
end
println()

@testset "A left-to-right word in two line puzzle." begin
    puzzle = ["jefblpepre", "tclojurerm"]
    @test location(puzzle, "clojure") == ([2, 2], [2, 8])

end
println()

@testset "A left-to-right word in three line puzzle." begin
    puzzle = ["camdcimgtc", "jefblpepre", "clojurermt"]
    @test location(puzzle, "clojure") == ([3, 1], [3, 7])
end
println()

@testset "A left-to-right word in ten line puzzle." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
end
println()


@testset "Same word in different ten line puzzle." begin
    puzzle = ["jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua",
              "rixilelhrs", "wolcqlirpc", "Screeaumgr", "alxhpburyi",
              "clojurermt", "jalaycalmp"]

    @test location(puzzle, "clojure") == ([9, 1], [9, 7])
end
println()

@testset "Another left-to-right word in a ten line puzzle." begin
    puzzle = ["jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua",
              "rixilelhrs", "wolcqlirpc", "fortranftw", "alxhpburyi",
              "clojurermt", "jalaycalmp"]

    @test location(puzzle, "fortran") == ([7, 1], [7, 7])
end
println()

@testset "Two words." begin
    puzzle = ["jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua",
              "rixilelhrs", "wolcqlirpc", "fortranftw", "alxhpburyi",
              "jalaycalmp", "clojurermt"]


    @test location(puzzle, "fortran") == ([7, 1], [7, 7])
    @test location(puzzle, "clojure") == ([10, 1], [10, 7])

end
println()

@testset "A single word written right-to-left." begin
    puzzle = ["rixilelhrs"]
    @test location(puzzle, "elixir") == ([1, 6], [1, 1])
end
println()

@testset "Two words written horizontally." begin
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
end
println()

@testset "Words written top to bottom." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
end
println()

@testset "Words written bottom to top." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
end
println()

@testset "Words written top left to bottom right." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
    @test location(puzzle_main, "java") == ([1, 1], [4, 4])
end
println()

@testset "Words written bottom right to top left." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
    @test location(puzzle_main, "java") == ([1, 1], [4, 4])
    @test location(puzzle_main, "lua") == ([9, 8], [7, 6])
end
println()

@testset "Words written bottom left to top right." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
    @test location(puzzle_main, "java") == ([1, 1], [4, 4])
    @test location(puzzle_main, "lua") == ([9, 8], [7, 6])
    @test location(puzzle_main, "lisp") == ([6, 3], [3, 6])
end
println()

@testset "Words written top right to bottom left." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
    @test location(puzzle_main, "java") == ([1, 1], [4, 4])
    @test location(puzzle_main, "lua") == ([9, 8], [7, 6])
    @test location(puzzle_main, "lisp") == ([6, 3], [3, 6])
    @test location(puzzle_main, "ruby") == ([6, 8], [9, 5])
end
println()

@testset "Fails to locate a word not in the puzzle." begin
    @test location(puzzle_main, "clojure") == ([10, 1], [10, 7])
    @test location(puzzle_main, "elixir") == ([5, 6], [5, 1])
    @test location(puzzle_main, "ecmascript") == ([1, 10], [10, 10])
    @test location(puzzle_main, "rust") == ([5, 9], [2, 9])
    @test location(puzzle_main, "java") == ([1, 1], [4, 4])
    @test location(puzzle_main, "lua") == ([9, 8], [7, 6])
    @test location(puzzle_main, "lisp") == ([6, 3], [3, 6])
    @test location(puzzle_main, "ruby") == ([6, 8], [9, 5])

    @test location(puzzle_main, "haskell") == nothing
end
println()
