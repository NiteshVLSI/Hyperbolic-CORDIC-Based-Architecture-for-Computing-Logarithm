# Hyperbolic CORDIC-Based Architecture for Computing Logarithm

This project presents a novel hyperbolic CORDIC (Coordinate Rotation Digital Computer) architecture designed to compute base-2 logarithms of floating-point numbers efficiently. The design, referred to as **THV-CORDIC**, builds upon the Generalized Hyperbolic CORDIC (GH-b CORDIC) with enhancements that enable high precision and low area requirements, making it suitable for hardware implementations in applications requiring real-time performance.

## Overview

Traditional methods of computing logarithms (e.g., table-based, polynomial, and digit-recurrence approaches) present limitations in precision, area, or speed when used in hardware. The THV-CORDIC architecture is developed to address these limitations by using shift-and-add operations, resulting in a high-speed and area-efficient solution.

## Key Features

- **Precision**: Achieves high accuracy with an average relative error (ARE) of `2.09 x 10^-6`.
- **Efficiency**: Implemented in a pipelined structure, resulting in reduced area-delay product (ADP).
- **Iteration Control**: Allows the adjustment of iteration count to balance precision and hardware area.

## Architecture

The THV-CORDIC architecture computes the logarithm of a floating-point number `R` by breaking it into two parts: the exponent and the mantissa. It leverages a transformation that allows calculation within the limited convergence range of the hyperbolic CORDIC algorithm.

For a floating-point input `R`, represented as:

`R = 1.Min × 2^Ein`

The base-2 logarithm can be computed as:

`log2(R) = Ein + log2(1.Min)`

This method allows THV-CORDIC to compute logarithms over a broad range by only directly calculating `log2(1.Min)` with THV-CORDIC and then adding the exponent.

### THV-CORDIC Iterative Equations

The THV-CORDIC architecture adapts GH-b CORDIC for logarithmic computation through the following iterative formulas, where `j` represents the iteration number:

- `x_(j+1) = x_j - sign(y_j) * (2^-j * y_j)`
- `y_(j+1) = y_j - sign(y_j) * (2^-j * x_j)`
- `z_(j+1) = z_j + sign(y_j) * (tanh^(-1)(2^-j) / ln(2))`

These iterations are applied until `y` converges towards zero, resulting in `x` and `z` values that approximate the desired logarithmic function.

### Convergence Condition

For the CORDIC algorithm to converge correctly, specific iterations (e.g., `j = 4, 13, 40`) must be repeated. The convergence range of THV-CORDIC is given by:

`|tanh^(-1)(y_0 / x_0)| <= ∑_(j=1)^n tanh^(-1)(2^-j)`

where `y_0 = V - 1` and `x_0 = V + 1` are initialized based on the input.

## Hardware Implementation

The design employs a pipelined architecture for high throughput, with each stage of the pipeline performing a single iteration of THV-CORDIC. Key components include:

- **Floating-Point Conversion Unit (FCU)**: Separates the exponent and mantissa.
- **THV-CORDIC Module**: Calculates `log2(1.Min)` using the iterative THV-CORDIC process.
- **Addition Unit (AU)**: Combines the results from the THV-CORDIC module with the exponent to produce the final `log2(R)`.

![THV-CORDIC Architecture Diagram](https://github.com/user-attachments/assets/8a8a0e6f-71b7-4787-b8fc-c14eb18f0d64
)

### Implementation Results

The hardware was synthesized under SMIC 65nm CMOS technology, achieving the following:

- **Area**: 
- **Computation Time**: 
- **Area-Delay Product (ADP)**: 
- **Relative Error**: Average Relative Error (ARE) = 

## Conclusion

The THV-CORDIC architecture offers a balanced tradeoff between precision and hardware efficiency for logarithmic computations, making it an excellent choice for digital signal processing systems. Its simplicity, based on shift-and-add operations, and ability to scale precision by adjusting iterations make it a versatile design for various real-time applications.

## References

1. Hui Chen, Kaifeng Cheng, Zhonghai Lu, Yuxiang Fu, and Li Li. "Hyperbolic CORDIC-Based Architecture for Computing Logarithm and Its Implementation." IEEE Transactions on Circuits and Systems II, 67(11): 2652-2657, 2020.
