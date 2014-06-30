classdef tBoundaryAndInitialStates < matlab.unittest.TestCase

    properties
        tMax = 10;
        tNum = 100;
        tStepSize = 0.1;
        sMax = 3*pi;
        sNum = 15;
        sStepSize = pi/5;
    end

    methods (Test)
        function fallingFibre(testcase)
            leftBoundaryType = 1;
            rightBoundaryType = 3;

            tCoordinate = Grid(0, tStepSize, tMax);
            sCoordinate = Grid(0, sStepSize, sMax);
            
            
        end
        
        function releaseHelicalSpring(testcase)
        end
        
        function rotatingRod(testcase)
        end
        
        function springUnderMovingEnd(testcase)
        end
    end
end