classdef InitialStates < States
    
    properties (SetAccess = private, GetAccess = public)
        Locator
        StateFunc
    end
    
    methods
        function obj = InitialStates(stateFuncHandle, locator)
            obj.StateFunc = stateFuncHandle;
            obj.Locator = Grid(0, locator.StepSize, locator.MaxGridLength);
             
            data = obj.computeStates;
            obj.setStates(data);
        end
        
        function data = computeStates(this)
            data = [];
            while ~this.Locator.isEnd 
                tmp = data;
                location = this.Locator.CurrGrid;
                data = [tmp; this.StateFunc(location)];
                this.Locator.advance;
            end
        end
        
    end
end
