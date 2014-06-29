classdef BoundaryState < States
    
    properties (SetAccess = private, GetAccess = public)
        BoundaryType
        StateFunc
        Timer
    end
    
    methods
        function obj = BoundaryState(type, stateFuncHandle, aTimeGrid)
            obj.BoundaryType = type;
            obj.StateFunc = stateFuncHandle;
            if exist('aTimer', 'var')
                obj.Timer = aTimeGrid;
            else
                obj.Timer = Grid(0, 0, 0);
            end
        end
        
        function states = getStates(this)
            currTime = this.Timer.CurrGrid;
            data = this.StateFunc(currTime);
            this.setStates(data);
            states = getStates@States(this, this.Data);
        end
        
    end
end

