#                  higher y
#                     ↑
#                     │
#       upper wall    │        u = 0
# ────────────────────┼────────────────────
#                     │   →        slow
#                     │   →→
#                     │   →→→
#                     │   →→→→
#                     │   →→→→→
#  centerline y = 0 ──┼──→→→→→→   maximum velocity
#                     │   →→→→→
#                     │   →→→→
#                     │   →→→
#                     │   →→
#                     │   →        slow
# ────────────────────┼────────────────────
#       bottom wall   │        u = 0
#                     │
#                     └────────────────────→ x
#                               flow

import numpy as np

# Given values
V = 2.0             # ft/s
mu = 0.04           # lb*s/ft^2
h = 0.2 / 12        # convert inch -> ft

# Locations
y_bottom = -h
y_center = 0
y_top = h

# Velocity gradient:
# u = (3V/2)*(1 - (y/h)^2)
# du/dy = -3*V*y/h^2

def du_dy(y):
    return -3 * V * y / h**2

# Shear stress
def tau(y):
    return mu * du_dy(y)

print("h =", h, "ft")

print("Bottom wall:")
print("du/dy =", du_dy(y_bottom), "1/s")
print("tau =", tau(y_bottom), "lb/ft^2")

print("\nCenterline:")
print("du/dy =", du_dy(y_center), "1/s")
print("tau =", tau(y_center), "lb/ft^2")

print("\nTop wall:")
print("du/dy =", du_dy(y_top), "1/s")
print("tau =", tau(y_top), "lb/ft^2")

# h = 0.0166667 ft

# Bottom wall:
# du/dy = 360.0 1/s
# tau = 14.4 lb/ft^2

# Centerline:
# du/dy = 0.0 1/s
# tau = 0.0 lb/ft^2

# Top wall:
# du/dy = -360.0 1/s
# tau = -14.4 lb/ft^2

