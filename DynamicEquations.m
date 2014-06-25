classdef DynamicEquations < handle
    
    methods (Abstract)
        mat = jacobian(this, states, time)
        
        mat = systemDynamics(this, states, time)
        
    end
    
end
