classdef States < handle
    
    properties (SetAccess = private, GetAccess = public)
        Size
        Data
    end
    
    methods (Access = public)
        function obj = States(vec)
            if exist('vec', 'var')
                obj.setStates(vec);
            end
        end
        
        function setStates(this, states)
            if exist('states', 'var')
                this.Size = length(states);
                this.Data = states;
            end
        end
        
        function states = getStates(this)
            states = this.Data;
        end
    end
    
end