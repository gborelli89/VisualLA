using StaticArrays
using GLMakie
GLMakie.activate!()

function plotbasis(A::AbstractArray; sample::Bool=false, n=100, mult=(1,1,1))
   
    A = SMatrix{3,3}(A)
    mult = SVector{3}(mult)
   
    origin = [0,0,0]
    l1 = hcat(origin,A[:,1])
    l2 = hcat(origin,A[:,2])
    l3 = hcat(origin,A[:,3])
    fig = Figure(resolution=(600,600))
    ax = Axis3(fig[1,1], aspect=(1,1,1), perspectiveness=0.5)
    lines!(ax, l1[1,:], l1[2,:], l1[3,:], color=:black, linewidth=3)
    lines!(ax, l2[1,:], l2[2,:], l2[3,:], color=:red, linewidth=3)
    lines!(ax, l3[1,:], l3[2,:], l3[3,:], color=:green, linewidth=3)
    if sample
        x = 2.0 .* rand(3,round(n)) .- 1.0
        x = mult .* x
        x = A*x
        scatter!(ax,x[1,:], x[2,:], x[3,:], color=:blue, markersize=20)
    end
    fig
end
