classdef tStates < matlab.unittest.TestCase
    
    methods (Test)
        
        function setStates(this)
            vec = rand(5,1);
            stateObj1 = States(vec);
            this.verifyEqual(stateObj1.Data, vec);
            
            stateObj2 = States;
            stateObj2.setStates(vec);
            this.verifyEqual(stateObj2.Data, vec);
        end
        
    end
    
end