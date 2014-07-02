classdef tStraightSpringDynamics < matlab.unittest.TestCase
    
    methods (Test)
        
        function computeSpaceDiscretizationMatries(this)
            function testSameBoundaryAtEnds(boundaryType)
                stateObj = States( rand(3,1) );
                boundary = BoundaryState(boundaryType, @(t)[0, 0, 0], @(t)[0, 0, 0]);
                paramObj = CustomParams(0.1, 0, 0, 0, 0, boundary, boundary, stateObj);
                eta = paramObj.GridDistance;                
                obj = StraightSpringDynamics(stateObj, stateObj, stateObj, paramObj);
                
                expAMat = eta * [paramObj.A00 paramObj.A01 0 0;
                                            1 4 1 0;
                                            0 1 4 1;
                                            0 0 paramObj.ANNm1 paramObj.ANN];                
                expBMat = 1/eta * [-1 1 0 0;
                                                0 -1 1 0;
                                                0 0 -1 1;
                                                0 0 -1 1];                
                expCMat = eta/3 * [2 1 0 0;
                                                0 2 1 0;
                                                0 0 2 1;
                                                0 0 -1 -2];                                        
                expUMat = 1/eta * [paramObj.U00 paramObj.U01 0 0;
                                                3 -6 3 0;
                                                0 3 -6 3;
                                                0 0 paramObj.UNNm1 paramObj.UNN];
                this.verifyEqual(obj.SD_Amat, sparse(expAMat));
                this.verifyEqual(obj.SD_Bmat, sparse(expBMat));
                this.verifyEqual(obj.SD_Cmat, sparse(expCMat));
                this.verifyEqual(obj.SD_Umat, sparse(expUMat));
            end
            
            testSameBoundaryAtEnds(1);
            testSameBoundaryAtEnds(2);
            testSameBoundaryAtEnds(3);
        end
        
    end
    
end