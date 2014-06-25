classdef tSpringStates < matlab.unittest.TestCase
    
    methods (Test)
        
        function setStates(this)
            vec = rand(5,1);
            stateObj1 = SpringStates(vec);
            this.verifyEqual(stateObj1.States, vec);
            
            stateObj2 = SpringStates;
            stateObj2.setStates(vec);
            this.verifyEqual(stateObj2.States, vec);
        end
        
    end
    
end