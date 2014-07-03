classdef StraightSpringDynamics < DynamicEquations
    
    properties (SetAccess = private, GetAccess = public)
        CurrentStates
        LastStates
        NextStates
        CustomParams
        SD_Kmat
        SD_Amat
        SD_Bmat
        SD_Cmat
        SD_Umat
        SD_Zvec
        SD_D1
        SD_D2
    end
    
    methods (Access = public)
        
        function obj = StraightSpringDynamics(lastStates, currentStates, nextStates, customParams)
            obj.LastStates = lastStates;
            obj.CurrentStates = currentStates;
            obj.NextStates = nextStates;
            obj.CustomParams = customParams;
            
            obj.computeSpaceDiscretizationMatries;
        end
            
        function mat = systemDynamics(this, states, costates, time)
        end
        
        function mat = jacobian(this, states, costates, time)
        end
        
    end
    
    methods (Access = private)
        function computeSpaceDiscretizationMatries(this)
            N = this.CurrentStates.Size;
            this.setSDAmat(N);
            this.setSDBmat(N);
            this.setSDCmat(N);
            this.setSDUmat(N);            
            this.setSDZvec(N);
            this.setSDDmat;
        end
        
        function setSDAmat(this, N)
            len = N+1;
            eta = this.CustomParams.GridDistance;
            A00 = this.CustomParams.A00;
            A01 = this.CustomParams.A01;
            ANNm1 = this.CustomParams.ANNm1;
            ANN = this.CustomParams.ANN;
            B1 = sparse(1:len, 1:len, 4, len, len);
            B2 = sparse(1:N, 2:len, 1,  len, len);
            B3 = sparse(2:len, 1:N, 1,  len, len);
            B4 = sparse([1 1 len len], [1 2 N len], ...
                                [-4+A00, -1+A01, -1+ANNm1, -4+ANN], ...
                                len, len);
            this.SD_Amat = eta * kron(B1 + B2 + B3 + B4, eye(3));
        end
        
        function setSDBmat(this, N)
            len = N+1;
            eta = this.CustomParams.GridDistance;            
            B1 = sparse(1:len, 1:len, -1, len, len);
            B2 = sparse(1:N, 2:len, 1,  len, len);
            B3 = sparse([len len], [N len], [-1 2], len, len);
            this.SD_Bmat = kron(B1 + B2 + B3, eye(3))/eta;
        end
        
        function setSDCmat(this, N)
            len = N+1;
            eta = this.CustomParams.GridDistance;
            B1 = sparse(1:len, 1:len, 2, len, len);
            B2 = sparse(1:N, 2:len, 1,  len, len);
            B3 = sparse([len len], [N len], [-1 -4], len, len);            
            this.SD_Cmat = eta/3.0*kron(B1 + B2 + B3, eye(3));
        end
        
        function setSDUmat(this, N)
            len = N+1;
            eta = this.CustomParams.GridDistance;
            U00 = this.CustomParams.U00;
            U01 = this.CustomParams.U01;
            UNNm1 = this.CustomParams.UNNm1;
            UNN = this.CustomParams.UNN;
            B1 = sparse(1:len, 1:len, -6, len, len);
            B2 = sparse(1:N, 2:len, 3,  len, len);
            B3 = sparse(2:len, 1:N, 3,  len, len);
            B4 = sparse([1 1 len len], [1 2 N len], ...
                                [6+U00, -3+U01, -3+UNNm1, 6+UNN], ...
                                len, len);
            this.SD_Umat = kron(B1 + B2 + B3 + B4, eye(3))/eta;
        end
        
        function setSDZvec(this, N)
            this.SD_Zvec = [this.CustomParams.Z0, ...
                zeros(1, 3*(N-1)), ...
                this.CustomParams.ZN]';
        end
        
        function setSDDmat(this)
            A = this.SD_Amat;
            B = this.SD_Bmat;
            C = this.SD_Cmat;
            U = this.SD_Umat;
            
            tmp = A \ U;
            this.SD_D1 = B - C * tmp;
            this.SD_D2 = 2 * tmp;
        end
            
    end
    
end