classdef StraightSpringExamples < handle
    
    methods (Static)
        function [x, dxds] = fallingFibre(s, theta)
            u = theta*s;
            x = 1/theta * [cos(u) - 1, 0, sin(u)]';
            dxds = [-sin(u), 0, cos(u)]';
        end
        
        function [x, dxds] = releaseHelicalSpring(s, theta)
            u = sin(theta) * s;
            x = [sin(u), cos(u), cos(theta) * s]';
            dxds = [cos(u) * sin(theta), -sin(theta) * sin(u), cos(theta)]';
        end
        
        function [x, dxds] = rotatingRod(s, theta)
            u = theta * s;
            x = 1/theta * [cos(u) - 1, 0, sin(u)]';
            dxds = [-sin(u), 0, cos(u)]';
        end
        
        function [x, dxds] = simpleSpring(s)
            x = [sin(s), 0, cos(s)]';
            dxds = [cos(s), 0, -sin(s)]';
        end
    end
    
end