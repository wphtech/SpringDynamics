classdef CustomParams < handle
    
    properties (SetAccess = private, GetAccess = public)
        GridDistance
        GridNum
        UnitMass
        Elasticity
        DampFactor
        LeftBoundary
        RightBoundary
        InitialStates
        A00
        A01
        ANNm1
        ANN
        U00
        U01
        UNNm1
        UNN
        Z0
        ZN
    end
    
    methods (Access = public)
        function obj = CustomParams(gridDistance,  gridNum, unitMass, elasticity, dampFactor, ...
                leftBoundary, rightBoundary, initialStates)
            obj.GridDistance = gridDistance;
            obj.GridNum = gridNum;
            obj.UnitMass = unitMass;
            obj.Elasticity = elasticity;
            obj.DampFactor = dampFactor;
            obj.InitialStates= initialStates;
            
            obj.setBoundaryType(leftBoundary, rightBoundary);
        end
    
        % Set the boundary type. 
        %       1. Position and velocity of the boundary are known functions of t.
        %       2. Position but not the velocity of the boundary is a known function of t.
        %       3. Neither position nor velocity of the boundary is a known function of t.
        function setBoundaryType(this, leftBoundary, rightBoundary)
            this.LeftBoundary = leftBoundary;
            this.RightBoundary = rightBoundary;

            switch this.LeftBoundary.BoundaryType
                case 1
                    this.A00 = 2; 
                    this.A01 = 1;
                    this.U00 = -3;
                    this.U01 = 3;
                    this.Z0 = this.LeftBoundary.getVelocity;
                case {2, 3}
                    this.A00 = 1/this.GridDistance; 
                    this.A01 = 0;
                    this.U00 = 0;
                    this.U01 = 0;
                    this.Z0 = [0, 0, 0];
                otherwise
                    error('Unknown boundary type on the initialEnd!');
            end
            
            switch this.RightBoundary.BoundaryType
                case 1
                    this.ANNm1 = 1; 
                    this.ANN = 2;
                    this.UNNm1 = 3;
                    this.UNN = -3;
                    this.ZN = this.RightBoundary.getVelocity;
                case {2, 3}
                    this.ANNm1 = 0; 
                    this.ANN = 1/this.GridDistance;
                    this.UNNm1 = 0;
                    this.UNN = 0;
                    this.ZN = [0, 0, 0];
                otherwise
                    error('Unknown boundary type on the initialEnd!');
            end            
        end
    end    
    
end