# PID-control-of-lambda-in-internal-combustion-engines

Air pollution is an ever increasing problem with high impact on human tissues.
One of its main contributors is the internal combustion engine (ICE). Taking that
into consideration it is extremely important to reduce exhaust pollutants of ICEs.
This can be achieved by the stoichiometric air-to-fuel ratio (lambda) control, which
helps determine whether the air to fuel ratio of an ICE is either rich or lean. A
PID controller is designed and tuned for this purpose. A dynamic model of a spark
ignition (SI) engine is implemented in MATLAB in order to validate the proposed
control scheme. To be more specific, the mean value engine model (MVEM) is
applied, as it is considered to be an accurate and control-oriented dynamic model.
This model describes four dynamic engine variables (states): manifold pressure, fuel
flow into combustion chamber, crankshaft speed and lambda measured by sensor.
The inputs in the MVEM are the injected fuel mass flow and the throttle plate angle.
By combining the MVEM with the PID controller lambda control is achieved. As
far as closed loop is concerned, the manipulated variable is the fuel mass 
flow into the combustion chamber, the controlled variable is lambda and the throttle plate
angle is considered as a disturbance. Two simulations are created. The first one is
a closed loop system for PID control of lambda with only one input, the injected
fuel mass flow. The second one is the same closed loop system with the difference
that in this case throttle plate angle is regarded as an input disturbance. While on
the first simulation the PID ability to control lambda is very satisfactory, lambda
response changes drastically when disturbance is inserted in the system.

Author: John Chalepoudis
