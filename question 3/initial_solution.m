%
% NAME:        initial_solution
%
% DESCRIPTION: Calculates the initial positions for agents. Initial
%              velocities is set to 0. Agents' personal best is set to
%              their initial positions.
%
% PARAMETERS:
%   population (int)
%     - Number of agents.
%   min_x (double)
%     - Min value for x.
%   max_y (double)
%     - Max value for x.
%   min_y (double)
%     - Min value for y.
%   max_y (double)
%     - Max value for y.
%
% RETURNS:
%   initial_solution
%     - Matrix representing initial population of agents.
%
function [ initial_solution ] = initial_solution( population, min_x, max_x, min_y, max_y )
    initial_solution = zeros( population, 8 );
    initial_solution( :, 1 ) = ( rand( population, 1 ) .* ( max_x - min_x ) ) + min_x;
    initial_solution( :, 2 ) = ( rand( population, 1 ) .* ( max_y - min_y ) ) + min_y;
    initial_solution( :, 3 ) = evaluate_equation( initial_solution( :, 1), initial_solution( :, 2 ) );
    
    % Set personal bests to current position.
    initial_solution( :, 6:8 ) = initial_solution( :, 1:3 );
end

