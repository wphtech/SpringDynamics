classdef physModel

properties (setAccess = private, getAccess = public)
  initStates
  statesHistory
  dynamics
  solver
end

methods (Abstract)
  function states = step(this)
  end

  function status = diagnostic(this)
  end

  function sim(this)

  status = this.diagnostic;
  while solver.isEnd && status
    statesHistory.add(this.step);
    status = this.diagnostic;
  end

  end

  end
end

end
