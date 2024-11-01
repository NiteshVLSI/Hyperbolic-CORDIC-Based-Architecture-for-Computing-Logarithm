import math
import csv

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

        x, y, z = x_next, y_next, z_next

        if j == 4 or j == 13:
            sign_y = math.copysign(1, y)
            x_next = x - sign_y * (2**-j) * y
            y_next = y - sign_y * (2**-j) * x
            z_next = z + sign_y * angle_divided

            x, y, z = x_next, y_next, z_next

    # Double the final value of z and return log2(v)
    log2_v = 2 * z
    return log2_v

# Function to calculate relative error
def relative_error(approx, exact):
    return abs((approx - exact) / exact)

# Open CSV file for writing
with open('log2_output_with_error2.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    
    # Write the header
    writer.writerow(["v", "num_iterations", "log2(v)", "actual_log2(v)", "relative_error"])

    # Loop over number of iterations from 14 to 21
    for num_iterations in range(14, 22):
        max_relative_error = 0  # Track the maximum relative error for the current number of iterations
        
        # Loop over values of v from 1.1 to 1.9 with step 0.1
        for v in [round(1.1 + i * 0.1, 1) for i in range(9)]:
            z0 = 0.0
            approx_log2_v = cordic_iterations(v, z0, num_iterations)  # Approximate value using CORDIC
            actual_log2_v = math.log2(v)  # Exact value using math.log2
            
            # Calculate the relative error
            error = relative_error(approx_log2_v, actual_log2_v)
            max_relative_error = max(max_relative_error, error)  # Track the maximum error

            # Write the result to the CSV file
            writer.writerow([v, num_iterations, approx_log2_v, actual_log2_v, error])
        
        # After processing all v values for the current iteration count, print the max relative error
        print(f"Max relative error for {num_iterations} iterations = {max_relative_error}")

print("Results successfully written to log2_output_with_error.csv")
