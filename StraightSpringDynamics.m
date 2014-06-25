classdef StraightSpringDynamics < DynamicEquations
    
    properties (SetAccess = private, GetAccess = public)
        CurrentStates
        LastStates
        NextStates
        CustomParams
        SD_Amat
        SD_Bmat
        SD_Cmat
        SD_Umat
    end
    
    methods (Access = public)
        
        function obj = StraightSpringDynamics(lastStates, currentStates, nextStates, customParams)
            obj.LastStates = lastStates;
            obj.CurrentStates = currentStates;
            obj.NextStates = nextStates;
            obj.CustomParams = customParams;
            
            obj.computeSpaceDiscretizationMatries;
        end
        
        
        function mat = jacobian(this, states, time)
        end
        
        function mat = systemDynamics(this, states, time)
        end
        
    end
    
    methods (Access = private)
        function computeSpaceDiscretizationMatries(this)
            N = this.CurrentStates.GridNum;
            this.setSDAmat(N);
            this.setSDBmat(N);
            this.setSDCmat(N);
            this.setSDUmat(N);            
        end
        
        function setSDAmat(this, N)
            i = 1:N;
            j = 1:N;
            s = 1;
            this.SD_Amat = sparse(i, j, 1, N, N);
        end
        
        function setSDBmat(this, N)
            i = 1:N;
            j = 1:N;
            this.SD_Bmat = sparse(i, j, 1, N, N);
        end
        
        function setSDCmat(this, N)
            i = 1:N;
            j = 1:N;
            this.SD_Cmat = sparse(i, j, 1, N, N);
        end
        
        function setSDUmat(this, N)
            i = 1:N;
            j = 1:N;
            this.SD_Umat = sparse(i, j, 1, N, N);
        end
        
    end
    
end