@testitem "Aqua" begin
    using Aqua, OrderedCollections
    # Aqua 0.8.17–0.8.18 cannot inspect REQUIRE-only dependency metadata (JuliaTesting/Aqua.jl#404).
    legacy = isfile(joinpath(pkgdir(OrderedCollections), "REQUIRE")) &&
        !any(name -> isfile(joinpath(pkgdir(OrderedCollections), name)), ("Project.toml", "JuliaProject.toml"))
    broken = legacy && v"0.8.17" <= pkgversion(Aqua) <= v"0.8.18"
    Aqua.test_all(ARFFFiles; persistent_tasks=(; broken))
end
