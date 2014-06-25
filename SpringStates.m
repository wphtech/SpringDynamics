classdef SpringStates < handle
    
    properties (SetAccess = private, GetAccess = public)
        GridNum
        States
    end
    
    methods (Access = public)
        function obj = SpringStates(vec)
            if exist('vec', 'var')
                obj.setStates(vec);
            end
        end
        
        function setGridNum(this, gridnum)
            this.GridNum = gridnum;
            this.States = zeros(this.GridNum, 1);
        end
        
        function setStates(this, states)
            len = length(states);
            this.setGridNum(len);
            this.States = states;
        end
    end
    
end