%
% NAME:        next_position
%
% DESCRIPTION: Calculates next position and z for agent.
%
% PARAMETERS:
%   agent
%     - Vector(Matrix) representing agent(s).
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
%   next_position [ x y z ]
%     - Next position represented by [ x y z ].
%
function [ next_position ] = next_position( agent, population, min_x, max_x, min_y, max_y )
    next_position = zeros( population, 3 );
    
    next_position( :, 1 ) = max( min( agent( :, 1 ) + agent( :, 4 ), max_x ), min_x );
    next_position( :, 2 ) = max( min( agent( : ,2 ) + agent( :, 5 ), max_y ), min_y );
    next_position( :, 3 ) = evaluate_equation( next_position( :, 1 ), next_position( :, 2 ) );
end

