classdef InitialStates < States
    
    properties (SetAccess = private, GetAccess = public)
        Locator
        StateFunc
    end
    
    methods
        function obj = InitialStates(stateFuncHandle, locator)
            obj.StateFunc = stateFuncHandle;
            obj.Locator = Grid(0, locator.StepSize, locator.MaxGridLength);
            obj.setStates;
        end
        
        function setStates(this, ~)
            while ~this.Locator.isEnd 
                tmp = data;
                location = this.Locater.CurrGrid;
                data = [tmp this.StateFunc(location)];
                this.Locator.advance;
            end
            setStates@States(this, this.data);
        end
        
    end
end
