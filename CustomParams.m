classdef CustomParams < handle
    
    properties (Access = public)
        GridDistance
        BoundaryType
    end
    
    methods (Access = public)
        function obj = CustomParams(gridDistance, boundaryType)
            obj.GridDistance = gridDistance;
            
            obj.setBoundaryType(boundaryType);
        end
    
        function setBoundaryType(this, type)
            this.BoundaryType = type;

            switch type
                case 1
                    disp('ToDo case 1');
                case 2
                    disp('To do case 2');
                otherwise
                    disp('To do case 3');
            end
        end
    end    
    
end