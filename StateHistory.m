classdef StateHistory < handle
    
    properties (SetAccess = private, GetAccess = public)
        InitialStates
        Data
        TimeVec
        Timer
    end
    
    methods
        function obj = StateHistory(initialStates, timer)
            obj.addStates(initialStates);
            obj.Timer = timer;
        end
        
        function addStates(this, stateObj)
            this.TimeVec = [this.TimeVec, this.Timer.CurrGrid];
            this.Data = [this.Data; stateObj.getStates];
        end
    end
end
