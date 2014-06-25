classdef tPhysModel < matlab.unittest.TestCase
    
    methods (Test)
        function constructor(this)
            vec = rand(5,1);
            stateObj = SpringStates(vec);
            dynamicObj = 'toDo';
            solverObj = 'toDo';
            
            obj = PhysModel(stateObj, dynamicObj, solverObj);
            this.verifyTrue(exist('obj', 'var') == 1);
        end
    end
    
end