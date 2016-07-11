%
% NAME:        generate_offspring
%
% DESCRIPTION: Given parents, generate offspring by crossing and mutating
%              genes (parameters).
%
% PARAMETERS:
%  parents (Matrix: (Array of (Array: [Kp Ti Td])))
%    - A matrix that represents a subset of current population that will be
%      used to create new solutions. Each row in the matrix represents
%      a solution. Col1 represents Kp, Col2 represents Ti, Col3 represents
%      Td, and Col4 is the fitness of the solution (row).
%  crossover_probability (decimal)
%    - Probability of solution parameters crossing over.
%  mutation_probability (decimal)
%    - Probability of solution parameters mutating.
%
% RETURNS:
%   children (Matrix: (Array of (Array: [Kp Ti Td])))
%     - A matrix that represents a solutions to be added to the population
%      Each row in the matrix represents a solution. Col1 represents Kp,
%      Col2 represents Ti, Col3 represents Td, and Col4 is the fitness of
%      the solution (row).
%
function [ offspring ] = generate_offspring( parents, crossover_probability, mutation_probability )
    offspring = parents;

    for i = 1:2:( length( parents ) - 1 )
        for j = 1:3
            % Crossover
            if rand() <= crossover_probability
                tmp = offspring( i, j );
                offspring( i, j ) = offspring( i + 1, j );
                offspring( i + 1, j ) = tmp;
            end

            %mutation for first offspring
            if rand() <= mutation_probability
                switch j
                    case 1
                        offspring( i, j ) = ( max_Kp - min_Kp ) * rand() + min_Kp;
                    case 2
                        offspring( i, j ) = ( max_Ti - min_Ti ) * rand() + min_Ti;
                    case 3
                        offspring( i, j ) = ( max_Td - min_Td ) * rand() + min_Td;
                    otherwise
                        error('Unexpected j value');
                end
            end

            %mutation for second offspring
            if rand() <= mutation_probability
                switch j
                    case 1
                        offspring( i + 1, j ) = ( max_Kp - min_Kp ) * rand() + min_Kp;
                    case 2
                        offspring( i + 1, j ) = ( max_Ti - min_Ti ) * rand() + min_Ti;
                    case 3
                        offspring( i + 1, j ) = ( max_Td - min_Td ) * rand() + min_Td;
                    otherwise
                        error('Unexpected j value');
                end
            end
            
            % Calculate new fitness
            offspring( i, 4 ) = fitness( offspring( 1, : ) );
            offspring( i + 1, 4 ) = fitness( offspring( i, : ) );
        end
    end
end
