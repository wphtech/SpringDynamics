classdef CustomParams < handle
    
    properties (SetAccess = private, GetAccess = public)
        GridDistance
        InitialEndBoundaryType
        FinalEndBoundaryType
        A00
        A01
        ANNm1
        ANN
        U00
        U01
        UNNm1
        UNN
    end
    
    methods (Access = public)
        function obj = CustomParams(gridDistance,  initialEndType, finalEndType)
            obj.GridDistance = gridDistance;
            
            obj.setBoundaryType(initialEndType, finalEndType);
        end
    
        % Set the boundary type. 
        %       1. Position and velocity of the boundary are known functions of t.
        %       2. Position but not the velocity of the boundary is a known function of t.
        %       3. Neither position nor velocity of the boundary is a known function of t.
        function setBoundaryType(this, initialEndType, finalEndType)
            this.InitialEndBoundaryType = initialEndType;
            this.FinalEndBoundaryType = finalEndType;

            switch this.InitialEndBoundaryType
                case 1
                    this.A00 = 2; 
                    this.A01 = 1;
                    this.U00 = -3;
                    this.U01 = 3;
                case {2, 3}
                    this.A00 = 1/this.GridDistance; 
                    this.A01 = 0;
                    this.U00 = 0;
                    this.U01 = 0;
                otherwise
                    error('Unknown boundary type on the initialEnd!');
            end
            
            switch this.FinalEndBoundaryType
                case 1
                    this.ANNm1 = 1; 
                    this.ANN = 2;
                    this.UNNm1 = 3;
                    this.UNN = -3;
                case {2, 3}
                    this.ANNm1 = 0; 
                    this.ANN = 1/this.GridDistance;
                    this.UNNm1 = 0;
                    this.UNN = 0;
                otherwise
                    error('Unknown boundary type on the initialEnd!');
            end            
        end
    end    
    
end