classdef BoundaryState < States
    
    properties (SetAccess = private, GetAccess = public)
        % Boundary type. 
        %       1. Position and velocity of the boundary are known functions of t.
        %       2. Position but not the velocity of the boundary is a known function of t.
        %       3. Neither position nor velocity of the boundary is a known function of t.
        BoundaryType
        PositionFunc
        VelocityFunc
        Timer
    end
    
    methods
        function obj = BoundaryState(type, posFunc, vecFunc, aTimeGrid)
            obj.BoundaryType = type;
            obj.PositionFunc = posFunc;
            obj.VelocityFunc = vecFunc;
            
            if exist('aTimer', 'var')
                obj.Timer = aTimeGrid;
            else
                obj.Timer = Grid(0, 0, 0);
            end
        end
        
        function states = getStates(this)
            currTime = this.Timer.CurrGrid;
            data = this.PositionFunc(currTime);
            this.setStates(data);
            states = getStates@States(this);
        end
        
        function pos = getPosition(this)
            pos = this.getStates;
        end
        
        function vel = getVelocity(this)
            currTime = this.Timer.CurrGrid;
            vel = this.VelocityFunc(currTime);
        end
    end
end

