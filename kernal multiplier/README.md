# Complex Kernel Multiplier Implementation combinational

## Overview
This module implements a high-performance 16-point complex number multiplication kernel in Verilog. The design performs element-wise multiplication of two 16-element complex number arrays, with each complex number represented using 32-bit floating-point format for both real and imaginary components.

## Architecture
The system is organized hierarchically with the following modules:

### 1. Main Kernel Multiplier (`cmpx_mul.v`)
- Top-level module that orchestrates the complete 16-point complex multiplication
- Handles 16 pairs of complex numbers simultaneously
- Input/Output:
  - 16 pairs of 32-bit complex numbers from array x (x0_real/imag through x15_real/imag)
  - 16 pairs of 32-bit complex numbers from array y (y0_real/imag through y15_real/imag)
  - 16 pairs of 32-bit complex multiplication results (X0_real/imag through X15_real/imag)

### 2. Complex Multiplier Unit (`cmpx_mul_2.v`)
- Performs multiplication of two complex numbers
- Implements the complex multiplication formula:
  - Real = (a_real × b_real) - (a_imag × b_imag)
  - Imaginary = (a_real × b_imag) + (a_imag × b_real)
- Inputs: Two complex numbers (32-bit real and imaginary parts)
- Outputs: Complex multiplication result (32-bit real and imaginary parts)

### 3. Floating-Point Multiplier (`fp_mul.v`)
- Performs IEEE-754 single-precision floating-point multiplication
- 32-bit input and output format
- Handles sign, exponent, and mantissa calculations
- Includes normalization and rounding

### 4. Floating-Point Adder (`fp_add.v`)
- Performs IEEE-754 single-precision floating-point addition/subtraction
- 32-bit input and output format
- Features:
  - Exponent alignment
  - Mantissa addition/subtraction
  - Result normalization
  - Rounding support

### Data Format
- All numbers use IEEE-754 single-precision floating-point format (32-bit)
- Complex numbers are represented as pairs of floating-point numbers

## Notes
- All arithmetic operations comply with IEEE-754 standards
- The design prioritizes accuracy and throughput
- Error handling for special cases (NaN, infinity) is implemented
