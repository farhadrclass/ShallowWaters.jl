function ghost_points_u_nonperiodic_halo1!(u)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # u[1,:] = 0.
    # u[end,:] = 0.

    @views u[:,1] .= one_minus_α*u[:,2]
    @views u[:,end] .= one_minus_α*u[:,end-1]
end

function ghost_points_u_periodic_halo1!(u)

    @views u[1,:] .= u[end-1,:]
    @views u[end,:] .= u[2,:]

    @views u[:,1] .= one_minus_α*u[:,2]
    @views u[:,end] .= one_minus_α*u[:,end-1]
end

function ghost_points_u_nonperiodic_halo2!(u)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # u[1,:] = 0.
    # u[2,:] = 0.
    # u[end-1,:] = 0.
    # u[end,:] = 0.

    @views u[:,1] .= one_minus_α*u[:,4]
    @views u[:,2] .= one_minus_α*u[:,3]
    @views u[:,end-1] .= one_minus_α*u[:,end-2]
    @views u[:,end] .= one_minus_α*u[:,end-3]
end

function ghost_points_u_periodic_halo2!(u)

    @views u[1,:] .= u[end-3,:]
    @views u[2,:] .= u[end-2,:]
    @views u[end-1,:] .= u[3,:]
    @views u[end,:] .= u[4,:]

    @views u[:,1] .= one_minus_α*u[:,4]
    @views u[:,2] .= one_minus_α*u[:,3]
    @views u[:,end-1] .= one_minus_α*u[:,end-2]
    @views u[:,end] .= one_minus_α*u[:,end-3]
end

function ghost_points_v_nonperiodic_halo1!(v)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # v[:,1] = 0.
    # v[:,end] = 0.

    @views v[1,:] .= one_minus_α*v[2,:]
    @views v[end,:] .= one_minus_α*v[end-1,:]
end

function ghost_points_v_periodic_halo1!(v)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # v[:,1] = 0.
    # v[:,end] = 0.

    @views v[1,:] .= v[end-1,:]
    @views v[end,:] .= v[2,:]
end

function ghost_points_v_nonperiodic_halo2!(v)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # v[:,1] = 0.
    # v[:,2] = 0.
    # v[:,end-1] = 0.
    # v[:,end] = 0.

    @views v[1,:] .= one_minus_α*v[4,:]
    @views v[2,:] .= one_minus_α*v[3,:]
    @views v[end-1,:] .= one_minus_α*v[end-2,:]
    @views v[end,:] .= one_minus_α*v[end-3,:]
end

function ghost_points_v_periodic_halo2!(v)

    # kinematic boundary condition
    # these values shouldn't change during a time step
    # v[:,1] = 0.
    # v[:,2] = 0.
    # v[:,end-1] = 0.
    # v[:,end] = 0.

    @views v[1,:] .= v[end-3,:]
    @views v[2,:] .= v[end-2,:]
    @views v[end-1,:] .= v[3,:]
    @views v[end,:] .= v[4,:]
end

function ghost_points_η_nonperiodic_halo1!(η)

    # corner points are copied twice, but it's faster!
    @views η[1,:] .= η[2,:]
    @views η[end,:] .= η[end-1,:]

    @views η[:,1] .= η[:,2]
    @views η[:,end] .= η[:,end-1]
end

function ghost_points_η_periodic_halo1!(η)

    # corner points are copied twice, but it's faster!
    @views η[1,:] .= η[end-1,:]
    @views η[end,:] .= η[2,:]

    @views η[:,1] .= η[:,2]
    @views η[:,end] .= η[:,end-1]
end

function ghost_points!(u,v,η)

    ghost_points_u!(u)
    ghost_points_v!(v)
    ghost_points_η!(η)

end





# function ghost_points_η_nonperiodic_loop!(η)
#
#     m, n = size(η)
#
#     for i ∈ 1:n
#         η[1,i] = η[2,i]
#         η[end,i] = η[end-1,i]
#     end
#
#     for j ∈ 1:m
#         η[j,1] = η[j,2]
#         η[j,end] = η[j,end-1]
#     end
# end
