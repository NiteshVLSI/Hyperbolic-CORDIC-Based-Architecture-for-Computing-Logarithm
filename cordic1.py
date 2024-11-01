import math

def cordic_iterations(v, z0, num_iterations):
    # Initialize x0 and y0 based on v
    x0 = v + 1
    y0 = v - 1
    x, y, z = x0, y0, z0

    for j in range(1, num_iterations + 1):
        sign_y = math.copysign(1, y)
        angle = math.atanh(2**-j)
        angle_divided = angle / math.log(2)
        x_next = x - sign_y * (2**-j) * y
        y_next = y - sign_y * (2**-j) * x
        z_next = z + sign_y * angle_divided
        print(x,y,z)
        x, y, z = x_next, y_next, z_next

        if j == 4 or j == 13:
            sign_y = math.copysign(1, y)
            #angle_divided = angle / math.log(2)
            x_next = x - sign_y * (2**-j) * y
            y_next = y - sign_y * (2**-j) * x
            z_next = z + sign_y * angle_divided

            x, y, z = x_next, y_next, z_next
            print(x,y,z)
    # Double the final value of z and print log2(v)
    log2_v = 2 * z
    print(f"log2({v}): {log2_v}")

# Example initialization
v = 1.9
z0 = 0.0
num_iterations = 16

# Perform the iterations and print log2(v)
cordic_iterations(v, z0, num_iterations)