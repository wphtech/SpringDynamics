classdef PhysModel < handle
    
    properties (SetAccess = private, GetAccess = public)
        InitStates
        StatesHistory
        Dynamics
        Solver
    end
    
    methods (Access = public)
        function obj = PhysModel(initStates, dynamics, solver)
            if exist('initStates', 'var') && exist('dynamics', 'var') && exist('solver', 'var')
                obj.InitStates = initStates;
                obj.Dynamics = dynamics;
                obj.Solver = solver;
            else
                error('states object, dynamics object, and solver object are required for initializing PhysModel object.');
            end
        end
        
        function states = step(this)
        end
        
        function status = diagnostic(this)
        end
        
        function sim(this)
            %
            %       status = this.diagnostic;
            %       while solver.isEnd && status
            %         statesHistory.add(this.step);
            %         status = this.diagnostic;
            %       end
            
        end
        
    end
end