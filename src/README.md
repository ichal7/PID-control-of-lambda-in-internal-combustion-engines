The simulation of the mean value engine model was performed using the MATLAB
software. The differential equations describing the MVEM are nonlinear delay differential
equations with general delays and for this reason, the ddesd solver has
been used.

* **dydt.m**:
In this function handle every equation of the MVEM, both differential, and algebraic,
was written in the form: dydt = ddefun(t, y,Z), where t corresponds to the current
t, y is a column vector that approximates yt and Z(:, j) approximates y(d(j)) for
delay d(j) given as component j of delays(t; y). The output is a column vector
corresponding to f(t, y(t), y(d(1),..., y(d(k))).

* **delay.m**:
The delays evaluated by this function handle are those from the crankshaft and
loading differential equation and the lamdba sensor differential equation.

* **ddehist.m**:
The history of the differential equations was filled in with the rationale of fully warm
conditions.

* **closed_loop_pid.m**:
Once the ddesd solver has its four arguments, one can obtain the change of all state
variables against time, but for certain fixed inputs.
To sufficiently control lambda a closed-loop is needed. In this case study a PID
controller is used to regulate lambda. Injected fuel mass 
flow is the manipulated variable and the throttle plate angle is considered as disturbance.
That being said, a PID controller is constructed to control lambda by alternating
the value of the injected fuel mass flow
