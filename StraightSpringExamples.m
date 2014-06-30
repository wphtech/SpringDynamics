classdef StraightSpringExamples < handle
    
    methods (Static)
        function x = fallingFibre(s, theta)
            u = theta*s;
            x = 1/theta * [cos(u) - 1, 0, sin(u)];
        end
        
        function x = releaseHelicalSpring(s, theta)
            u = sin(theta) * s;
            x = [sin(u), cos(u), cos(theta) * s];
        end
        
        function x = rotatingRod(s, theta)
            u = theta * s;
            x = 1/theta * [cos(u) - 1, 0, sin(u)];
        end
        
        function x = simpleSpring(s)
            x = [sin(s), 0, cos(s)];
        end
    end
    
end