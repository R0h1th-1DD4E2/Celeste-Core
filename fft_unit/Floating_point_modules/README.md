# floating point modules

This document details the modules used in a floating-point processing unit designed to operate on IEEE 754 single precision (32-bit) numbers. The design includes converters, adders, multiplication modules, and comparison modules. The key feature is the precision handling and normalization routines to ensure IEEE compliance.

---

## Table of Contents
- [Overview](#overview)
- [Module: fp_add](#module-fp_add)
- [Module: FloatingCompare](#module-floatingcompare)
- [Module: fp_mul](#module-fp_mul)
- [Module: fp_2_dec](#module-fp_2_dec)
- [Module: dec_2_fp](#module-dec_2_fp)
- [Usage Considerations](#usage-considerations)
- [Future Enhancements](#future-enhancements)

---

## Overview

The floating-point unit is built to support single precision arithmetic. IEEE 754 single precision numbers consist of:
- **1 sign bit** (bit 31)
- **8 exponent bits** (bits 30-23)
- **23 fraction/mantissa bits** (bits 22-0)

An implicit `1` is assumed for normalized numbers, making the effective mantissa 24 bits wide. The modules included here perform addition, multiplication, conversion from and to decimal, and compare operations. Special cases, such as zero detection and exponent overflow/underflow, are also handled.

---

## Module: fp_add

**Description:**  
The `fp_add` module performs floating-point addition (or subtraction) on two 32-bit IEEE 754 numbers. It adjusts for exponent differences, aligns mantissas, and normalizes the result.

**Parameters:**  
- `XLEN` (default: 32): Specifies the bit-width of the floating-point numbers.

**Ports:**
- **Inputs:**
  - `A`: First 32-bit IEEE 754 floating-point operand.
  - `B`: Second 32-bit IEEE 754 floating-point operand.
- **Output:**
  - `result`: The 32-bit IEEE 754 floating-point result after addition.

**Key Internal Signals:**
- **A_swap, B_swap:** Used to ensure the number with the larger absolute value is used as the primary operand.
- **A_Mantissa, B_Mantissa:** 24-bit mantissas constructed by appending the implicit leading 1.
- **Exponent, Sign, Temp_Mantissa:** Used to compute the sum/difference of the mantissas and adjust the exponent.
- **Zero flag:** Handles edge cases where the result is zero.

**Algorithm Highlights:**
- Compare absolute values using the `FloatingCompare` module.
- Align B's mantissa with A’s exponent.
- Perform addition or subtraction based on the sign.
- Normalize the result by shifting the mantissa and adjusting the exponent.
- Manage potential carry and exponent overflow.

---

## Module: FloatingCompare

**Description:**  
This module compares two IEEE 754 floating-point numbers based on their absolute values. It helps ensure that the larger magnitude value is processed first in the addition routine.

**Ports:**
- **Inputs:**
  - `A`: First 32-bit floating-point number.
  - `B`: Second 32-bit floating-point number.
- **Output:**
  - `result`: A boolean output that is high (1) if A ≥ B, based on absolute value and sign handling.

**Implementation Details:**
- Comparison is performed in three steps:
  1. **Sign Check:** If signs differ, the positive number is deemed larger.
  2. **Exponent Comparison:** The number with the larger exponent is considered greater.
  3. **Mantissa Comparison:** If exponents are equal, the mantissas are compared.
- If the number is negative, the result of the comparison is inverted to reflect the proper ordering.

---

## Module: fp_mul

**Description:**  
The `fp_mul` module multiplies two IEEE 754 single precision numbers. It handles mantissa multiplication, exponent addition, normalization, and sign calculation.

**Ports:**
- **Inputs:**
  - `A`: First 32-bit floating-point operand.
  - `B`: Second 32-bit floating-point operand.
- **Output:**
  - `result`: The 32-bit IEEE 754 floating-point product.

**Key Internal Signals:**
- **A_Mantissa, B_Mantissa:** 24-bit representations with the implicit 1.
- **Temp_Mantissa:** 48-bit result of multiplying the two 24-bit mantissas.
- **Temp_Exponent:** Intermediate value for the combined exponent (includes bias adjustment).
- **Sign:** Determined by XOR of input signs.
- **Normalization:** If a carry is detected (MSB of Temp_Mantissa is set), the result is shifted right and the exponent is incremented.

**Algorithm Highlights:**
- Compute the product of the mantissas.
- Sum the exponents and adjust for the bias (127 for single precision).
- Normalize the mantissa if a carry occurs.
- Check and handle exponent overflow.

---

## Module: fp_2_dec

**Description:**  
Converts an IEEE 754 floating-point number to a 32-bit signed integer. It calculates the absolute value and applies the sign after conversion.

**Ports:**
- **Input:**
  - `in`: 32-bit IEEE 754 floating-point input.
- **Output:**
  - `out`: 32-bit signed integer result.

**Algorithm Highlights:**
- Extract the sign, exponent, and mantissa from the input.
- Handle special case when the input is zero.
- Calculate the effective exponent (exponent - bias).
- Shift the mantissa left or right depending on the effective exponent.
- Combine the computed absolute value with the sign to form the final integer.

---

## Module: dec_2_fp

**Description:**  
Converts a 32-bit signed integer to an IEEE 754 floating-point representation.

**Ports:**
- **Input:**
  - `dec`: 32-bit signed integer.
- **Output:**
  - `ieee_out`: 32-bit IEEE 754 floating-point result.

**Key Internal Signals:**
- **sign:** Extracted from the most significant bit of the input.
- **abs_value:** Absolute value of the input.
- **position:** Bit position of the most significant '1' (used to determine the exponent).
- **exponent:** Calculated as the bit position plus the bias (127).
- **mantissa:** Formed by aligning the absolute value to a 1.mantissa format and masking out the implicit bit.

**Algorithm Highlights:**
- Check if the input is zero.
- Determine the sign and absolute value.
- Compute the position of the most significant bit to set the exponent.
- Align the mantissa to the proper bit width (23 bits) by shifting.
- Construct the IEEE 754 number by concatenating the sign, exponent, and mantissa.

---

## Usage Considerations

- **Precision and Edge Cases:**  
  All modules include logic to handle edge cases such as zero input, exponent overflow/underflow, and normalization of mantissas.

- **Simulation and Testing:**  
  It is recommended to simulate these modules using a comprehensive testbench to ensure proper functionality over the full range of IEEE 754 inputs.


---

*This documentation is intended for engineers and developers working on hardware design and verification of floating-point units. It provides a detailed description of the design choices, implementation details, and operational characteristics of the floating-point arithmetic modules.*
