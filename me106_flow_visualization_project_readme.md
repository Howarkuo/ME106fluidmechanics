# ME106 Flow Visualization Project

**Authors:** Jaden Liu, Howard Kuo  
**Date:** October 21, 2026  

---

## Introduction

The goal of this project was to visualize airflow around an aircraft model and observe aerodynamic behavior that is ordinarily invisible during flight. A small aircraft model was mounted in a low-speed wind tunnel and exposed to approximately steady incoming airflow. Fog introduced upstream served as a flow tracer, making the motion of the surrounding air visible. In addition to producing an aesthetically interesting image, the experiment was intended to illustrate how the model redirects the incoming flow, alters flow near its surfaces, and potentially generates a downstream wake. The resulting image provides a qualitative basis for discussing several fundamental concepts in fluid mechanics.

---

## Methods

The experiment was conducted in a low-speed wind tunnel equipped with a viewing window. An aircraft model was mounted in the test section using a fixture that held it at a fixed position and angle of attack. The nominal freestream speed was approximately $40\text{ mph}$ ($17.9\text{ m/s}$), and the model was set to an angle of attack of $15^\circ$.

Fog was introduced upstream of the model to make portions of the airflow visible. As the fog was transported through the test section, its illuminated motion revealed changes in the flow direction around the aircraft. The image was captured with an iPhone through the tunnel's viewing window, using the available lighting to illuminate the fog. The photograph was analyzed qualitatively; it was not used to calculate local velocities or pressures.

The experimental arrangement is illustrated in Figure 1. The schematic shows the fog tube, aircraft model, supporting fixture, phone camera, and fan, as well as the model's angle of attack.

![Schematic of the low-speed wind tunnel setup](wind_tunnel_setup.png)  
*Figure 1: Schematic of the low-speed wind tunnel setup used for flow visualization. Fog is introduced upstream of the aircraft model, which is held at a fixed angle of attack by a fixture. A phone camera records the experiment, and a fan drives the airflow through the tunnel.*

---

## Results and Discussion

The experiment visualizes airflow around a stationary aircraft model at an approximately uniform upstream speed of $40\text{ mph}$ ($V_\infty = 17.9\text{ m/s}$) and an angle of attack of $15^\circ$. Fog introduced upstream traces selected regions of the flow around the model (Figure 2). The analysis proceeds from the characteristic flow regime (Reynolds number), to integral conservation of mass, and then to local acceleration and momentum conservation. The fog image is qualitative: it does not directly measure a local velocity field, pressure distribution, separation location, or aerodynamic force.

![Fog visualization of flow around fixed aircraft model](ME106-windtunnel1.png)  
*Figure 2: Fog visualization of the flow around a fixed aircraft model in a low-speed wind tunnel at approximately $40\text{ mph}$ and $15^\circ$ angle of attack. The visible tracer pattern indicates selected flow paths, not a measured velocity or pressure field.*

### Reynolds Number and Its Physical Significance

The chord-based Reynolds number compares characteristic inertial and viscous effects in flow around the wing:

$$Re_c = \frac{\rho V_\infty c}{\mu}$$

where $V_\infty$ is freestream speed, $c$ is the physical chord from leading to trailing edge (not its horizontal projection), $\rho$ is air density, and $\mu$ is dynamic viscosity. With measured $c = 60.2\text{ mm} = 0.0602\text{ m}$, and assumed room-temperature properties $\rho = 1.20\text{ kg/m}^3$ and $\mu = 1.81 \times 10^{-5}\text{ Pa}\cdot\text{s}$,

$$Re_c = \frac{(1.20\text{ kg/m}^3)(17.9\text{ m/s})(0.0602\text{ m})}{1.81 \times 10^{-5}\text{ Pa}\cdot\text{s}} \approx 7.14 \times 10^4$$

This Reynolds number provides a reproducible reference for the experimental condition even though the local velocity varies around the model. The large ratio indicates that inertia is important on the wing-chord scale. It does *not* imply that viscosity can be ignored in the thin boundary layer at the solid surface. At $15^\circ$ angle of attack, adverse pressure gradients may promote separation and modify the wake; the Reynolds number alone cannot determine whether or where separation, transition, or stall occurs.

### Conservation of Mass Using the Reynolds Transport Theorem

#### Why a Fixed Control Volume and Control Surface?

![Illustrative two-dimensional section through a fixed control volume](ME106-controlvolume.png)  
*Figure 3: Illustrative two-dimensional section through a fixed control volume. Following every individual air particle would be inconvenient. Instead, we can choose a fixed region of space and examine the mass and momentum crossing its boundaries.*

Air passes continuously through the stationary test section. Therefore, a fixed (Eulerian) control volume (CV) is convenient: it contains air around the model while mass flows across the bounding control surface (CS). Choose an upstream cross section $A_1$ before the model, a downstream section $A_2$ containing the wake, the impermeable tunnel walls, and the impermeable aircraft surface as boundaries of the fluid CV. The outward normal vector $\mathbf{n}$ determines the sign of the flux: $\mathbf{V}\cdot\mathbf{n} < 0$ at the inlet and $\mathbf{V}\cdot\mathbf{n} > 0$ at the outlet. If the CV extends to the actual tunnel walls, there is no normal flow through those walls. The solid aircraft surface likewise has zero normal flow. Small fog injection mass is neglected.

#### Derivation from RTT

For an extensive property $B$ and specific property $b = B/m$, the Reynolds Transport Theorem for a fixed control volume is

$$\frac{dB_{\text{sys}}}{dt} = \frac{d}{dt}\int_{CV}\rho b\,dV + \int_{CS}\rho b(\mathbf{V}\cdot\mathbf{n})\,dA$$

For mass, $B = m$ and $b = 1$. Since the mass of a material system is conserved, $dm_{\text{sys}}/dt = 0$, so

$$0 = \underbrace{\frac{d}{dt}\int_{CV}\rho\,dV}_{\text{mass accumulation}} + \underbrace{\int_{CS}\rho(\mathbf{V}\cdot\mathbf{n})\,dA}_{\text{net outward mass flow}}$$

Under the additional assumption of *steady* flow through a fixed CV, the mass accumulation term is zero. Incompressibility permits density to be taken as approximately constant but, by itself, is not the reason the accumulation term vanishes. Therefore,

$$\int_{CS}\rho(\mathbf{V}\cdot\mathbf{n})\,dA = 0$$

Divide the closed CS into inlet, outlet, tunnel walls, and the aircraft surface:

$$0 = \int_{A_1}\rho(\mathbf{V}\cdot\mathbf{n})\,dA + \int_{A_2}\rho(\mathbf{V}\cdot\mathbf{n})\,dA + \underbrace{\int_{CS_{\text{walls}}}\rho(\mathbf{V}\cdot\mathbf{n})\,dA}_{=0} + \underbrace{\int_{CS_{\text{aircraft}}}\rho(\mathbf{V}\cdot\mathbf{n})\,dA}_{=0}$$

For approximately uniform incoming flow aligned with $+x$, the inlet outward normal is $-\mathbf{i}$, hence $\mathbf{V}_1\cdot\mathbf{n} = -V_\infty$. At the downstream plane $\mathbf{n} = +\mathbf{i}$, and $\mathbf{V}_2\cdot\mathbf{n} = u_2(y,z)$. Substitution gives

$$0 = -\rho V_\infty A_1 + \rho\int_{A_2}u_2(y,z)\,dA$$

or

$$\dot{m}_{\text{in}} = \rho V_\infty A_1 = \rho\int_{A_2}u_2(y,z)\,dA = \dot{m}_{\text{out}}$$

#### Conditional Mass-Flow Estimate and Its Meaning

If the reported width $W = 4.0\text{ m}$ and height $H = 1.8\text{ m}$ are the *actual flow cross-section dimensions*, and if $17.9\text{ m/s}$ is the cross-sectionally uniform inlet speed, then

$$A_1 = WH = (4.0)(1.8) = 7.2\text{ m}^2$$

$$Q_{\text{in}} = V_\infty A_1 = (17.9)(7.2) \approx 128.9\text{ m}^3\text{/s}$$

$$\dot{m}_{\text{in}} = \rho Q_{\text{in}} = (1.20)(128.9) \approx 154.7\text{ kg/s}$$

This value is *conditional*, not a verified measured flow rate. If the quoted tunnel dimensions describe the overall facility rather than the test-section air passage, the appropriate inlet area must be obtained before using this numerical result.

Even when $\dot{m}_{\text{in}} = \dot{m}_{\text{out}}$, the downstream velocity profile need not be uniform: lower streamwise velocity in a wake can be accompanied by higher velocity elsewhere in the cross section. Without a measurement of $u_2(y,z)$, the outlet profile cannot be calculated. The mass balance is nevertheless valid under its assumptions.

### Fog Streaklines, Material Derivative, and Streamline Curvature

In the Eulerian description, velocity is a field $\mathbf{V}(x,y,z,t)$, whereas the Lagrangian description follows a particle position $\mathbf{x}_p(t)$ satisfying

$$\frac{d\mathbf{x}_p}{dt} = \mathbf{V}\left(\mathbf{x}_p(t),t\right)$$

If fog is continuously released from a localized upstream source, its visible filament is a *streakline*. For ideal tracers in steady flow, streaklines, particle pathlines, and streamlines coincide; they need not coincide in unsteady wake motion.

A steady freestream does not imply zero particle acceleration. The material derivative is

$$\frac{D\mathbf{V}}{Dt} = \underbrace{\frac{\partial\mathbf{V}}{\partial t}}_{\text{local acceleration}} + \underbrace{(\mathbf{V}\cdot\nabla)\mathbf{V}}_{\text{convective acceleration}}$$

For steady, two-dimensional flow with $\mathbf{V} = u\mathbf{i} + v\mathbf{j}$,

$$\frac{Du}{Dt} = u\frac{\partial u}{\partial x} + v\frac{\partial u}{\partial y}$$

$$\frac{Dv}{Dt} = u\frac{\partial v}{\partial x} + v\frac{\partial v}{\partial y}$$

As flow turns around the aircraft, the velocity vector can change direction even without a change in speed. For a curved streamline with local radius of curvature $R$,

$$a_n = \frac{V^2}{R}$$

For locally inviscid flow away from the wall, Euler's normal momentum equation (with $n$ pointing away from the center of curvature) yields

$$\frac{\partial p}{\partial n} = \rho\frac{V^2}{R}$$

Steady, incompressible, inviscid Bernoulli flow with negligible elevation change also satisfies, *along a streamline*,

$$p + \frac{1}{2}\rho V^2 = \text{constant}$$

Thus flow turning and changes in local speed are linked to pressure gradients. However, $V(x,y,z,t)$, its spatial gradients, and the local streamline radius $R$ were not measured. Accordingly, the acceleration and pressure-gradient equations explain the qualitative physics but cannot be evaluated numerically from this photograph alone. Bernoulli's relation should not be applied uncritically across separated or strongly dissipative flow.

### Conservation of Linear Momentum and Aerodynamic Forces

Using $B = m\mathbf{V}$ and $b = \mathbf{V}$ in RTT and applying Newton's second law,

$$\sum\mathbf{F}_{\text{ext}} = \frac{d}{dt}\int_{CV}\rho\mathbf{V}\,dV + \int_{CS}\rho\mathbf{V}(\mathbf{V}\cdot\mathbf{n})\,dA$$

For steady flow in the fixed CV,

$$\sum\mathbf{F}_{\text{ext}} = \int_{CS}\rho\mathbf{V}(\mathbf{V}\cdot\mathbf{n})\,dA$$

The external forces on the *fluid* include pressure and viscous tractions, the force exerted by the aircraft on the air, and tunnel-wall forces. Unlike their zero *mass* flux, the solid surfaces can exert nonzero forces. The measured or modeled momentum-flux difference alone therefore does not generally give the aircraft force unless other contributions have been evaluated or shown negligible.

For streamwise $x$-momentum and vertical $y$-momentum, respectively,

$$\sum F_x = \int_{CS}\rho u(\mathbf{V}\cdot\mathbf{n})\,dA$$

$$\sum F_y = \int_{CS}\rho v(\mathbf{V}\cdot\mathbf{n})\,dA$$

The reaction of the fluid on the aircraft provides aerodynamic drag and lift. Under additional assumptions appropriate to a far-wake survey (including recovered static pressure, a suitable control surface, and negligible unaccounted fluxes or wall forces), drag may be approximated from a downstream momentum deficit:

$$D \approx \rho \int_{A_{\text{wake}}} u_2(y,z) \left[ V_\infty - u_2(y,z) \right] dA$$

This is *not* valid for an arbitrary measurement plane without checking those assumptions. Actual evaluation requires a spatially resolved wake velocity profile and, where relevant, pressure and surface-force corrections.

An alternative drag representation is

$$D = \frac{1}{2}\rho V_\infty^2 S C_D$$

where $S$ is the specified reference area and $C_D$ is the drag coefficient referenced to that same area. Using the present assumed air properties,

$$q_\infty = \frac{1}{2}\rho V_\infty^2 \approx 192\text{ Pa}$$

giving

$$D \approx (192\text{ Pa}) S C_D$$

For a rectangular wing with planform reference area $S = bc$, the wingspan $b$ is needed; $C_D$ is also unknown. Thus no experimental drag or lift value can be inferred from the fog photograph.

### Boundary Layer, Possible Separation, and Wake

The no-slip condition makes the air velocity equal to the fixed model's surface velocity at the wall, causing a viscous boundary layer to develop. Pressure gradients along the wing can accelerate or decelerate the external flow. If an adverse pressure gradient is sufficiently strong, the near-wall flow may separate, producing an unsteady wake with a local momentum deficit and mixing. The $15^\circ$ angle of attack and chord Reynolds number make these effects important to consider, but the photograph does not prove a particular separation point, vortex pattern, or stall condition.

### Measurement Limitations and Parameters Still Needed

| Analysis | Status | Missing information or qualification |
| :--- | :--- | :--- |
| **Chord Reynolds number** | Estimated | Uses assumed $\rho$ and $\mu$; measure temperature and pressure for refined properties. |
| **Mass flow rate** | Conditional | Verify $4.0 \times 1.8\text{ m}^2$ is the test-section flow area and verify inlet velocity uniformity. |
| **Material acceleration** | Qualitative | Local velocity field and spatial gradients; time-resolved velocities if the flow is unsteady. |
| **Streamline curvature** | Qualitative | Local velocity magnitude $V$ and radius of curvature $R$ from calibrated images or a velocity-field survey. |
| **RTT momentum, lift, drag** | Qualitative | Inlet/outlet or wake velocity profiles, pressure distributions and relevant surface forces; account for lateral fluxes. |
| **Drag-coefficient method** | Not calculable | Reference area $S$ (including missing wingspan $b$ if $S = bc$) and compatible $C_D$. |

---

## Conclusions

At an approximately $40\text{ mph}$ freestream speed and $15^\circ$ angle of attack, fog illuminated selected portions of the air moving around a fixed aircraft model. Based on an assumed room-temperature air density and viscosity, the chord Reynolds number is approximately $7.14 \times 10^4$, emphasizing the importance of inertial effects while retaining viscous boundary-layer phenomena.

The Reynolds Transport Theorem shows that, for a steady fixed control volume bounded by impermeable walls, incoming and outgoing mass flow rates are equal even when the outlet velocity is nonuniform. The material derivative relates the deflection of fluid paths to convective acceleration, and the momentum form of RTT relates changes in momentum flux and external forces to aerodynamic loading.

These equations explain what the fog visualization represents, while measured velocity profiles, curvature, pressures, wing reference area, and forces would be needed to quantify acceleration, lift, or drag.