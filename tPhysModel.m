classdef tPhysModel < matlab.unittest.TestCase
    
    methods (Test)
        function constructor(this)
            vec = rand(5,1);
            stateObj = States(vec);
            dynamicObj = 'toDo';
            solverObj = 'toDo';
            
            obj = PhysModel(stateObj, dynamicObj, solverObj);
            this.verifyTrue(exist('obj', 'var') == 1);
        end
    end
    
end