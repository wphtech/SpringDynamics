classdef Grid < handle
    
    properties (SetAccess = private, GetAccess = public)
        CurrGrid
        StepSize
        MaxGridLength
    end
    
    methods
        function obj = Grid(currGrid, stepSize, maxGridLength)
            obj.CurrGrid = currGrid;
            obj.StepSize = stepSize;
            obj.MaxGridLength = maxGridLength;
        end
        
        function advance(this)
            if ~this.isEnd
                this.CurrGrid = this.CurrGrid + this.StepSize;
            end                
        end
        
        function result = isEnd(this)
            if this.CurrGrid > this.MaxGridLength
                result = true;
            else
                result = false;
            end
        end
    end
end