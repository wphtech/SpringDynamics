classdef tStraightSpringDynamics < matlab.unittest.TestCase
    
    methods (Test)
        
        function computeSpaceDiscretizationMatries(this)
            vec = rand(3,1);
            stateObj = SpringStates(vec);
            paramObj = CustomParams(0.1, 1);
            
            obj = StraightSpringDynamics(stateObj, stateObj, stateObj, paramObj);
            
            expAMat = sparse([1 0 0; 0 1 0; 0 0 1]);            
            this.verifyEqual(obj.SD_Amat, expAMat);
            
            expBMat = sparse([1 0 0; 0 1 0; 0 0 1]);    
            this.verifyEqual(obj.SD_Bmat, expBMat);

            expCMat = sparse([1 0 0; 0 1 0; 0 0 1]);            
            this.verifyEqual(obj.SD_Cmat, expCMat);

            expUMat = sparse([1 0 0; 0 1 0; 0 0 1]);            
            this.verifyEqual(obj.SD_Umat, expUMat);            
        end
        
    end
    
end