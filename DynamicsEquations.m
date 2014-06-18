classdef dynamicEquations

methods (Abstract)
  function mat = Jacobian(this, states, time)  
  end

  function mat = SystemDynamics(this, states, time)
  end

end

end
