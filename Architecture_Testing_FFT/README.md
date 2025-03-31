
---

# Arch_test1 Module Documentation

## Overview

**Arch_test1** is a 2D Fast Fourier Transform (FFT) architecture. It processes 64 complex input values (each represented by a real and imaginary part) and produces 64 complex output values. The design is broken down into four main stages:
  
1. **Row FFT Stage:** Four instances of an 8-point FFT (implemented by `top_module_8pt`) perform the FFT on rows of the input data.
2. **Register Stage:** Latches the row FFT outputs for proper synchronization.
3. **Column FFT Stage:** Four instances of an 8-point FFT process the registered data by columns.
4. **Spectral Register Stage:** Latches the column FFT outputs and provides the final 2D FFT output.

## Module Interface

### Inputs

- **clk:** Clock signal for synchronous operations.
- **rst:** Reset signal to initialize the registers.
- **x0 – x63 (32-bit each):** 64 input signals representing complex numbers.  
  - **Even-indexed inputs (x0, x2, …, x62):** Real parts.
  - **Odd-indexed inputs (x1, x3, …, x63):** Imaginary parts.

#Below is an excerpt of the output documentation section that has been modified to clearly indicate the FFT instance source for each set of outputs:

---

## FFT Output Details

### Row FFT Stage Outputs

The row FFT stage is divided into four instances. Each instance processes a segment of the input data and generates a corresponding set of outputs:

- **Instance 1 – row_fft0:**  
  - **Inputs:** x0–x15  
  - **Outputs:** j0 to j15  
    - *j0, j2, j4, …, j14* represent the real parts.  
    - *j1, j3, j5, …, j15* represent the imaginary parts.

- **Instance 2 – row_fft1:**  
  - **Inputs:** x16–x31  
  - **Outputs:** j16 to j31

- **Instance 3 – row_fft2:**  
  - **Inputs:** x32–x47  
  - **Outputs:** j32 to j47

- **Instance 4 – row_fft3:**  
  - **Inputs:** x48–x63  
  - **Outputs:** j48 to j63

### Column FFT Stage Outputs

After the register stage, the column FFT stage processes the data in groups corresponding to four FFT instances. The outputs from each instance are described below:

- **Instance 1 – col_fft0:**  
  - **Inputs:** k0–k15  
  - **FFT Outputs (m0–m15):**  
    - *Even-indexed outputs (m0, m2, m4, …, m14)* are the real parts.  
    - *Odd-indexed outputs (m1, m3, m5, …, m15)* are the imaginary parts.

- **Instance 2 – col_fft1:**  
  - **Inputs:** k16–k31  
  - **FFT Outputs (m16–m31):**  
    - *Even-indexed outputs (m16, m18, m20, …, m30)* are the real parts.  
    - *Odd-indexed outputs (m17, m19, m21, …, m31)* are the imaginary parts.

- **Instance 3 – col_fft2:**  
  - **Inputs:** k32–k47  
  - **FFT Outputs (m32–m47):**  
    - *Even-indexed outputs (m32, m34, m36, …, m46)* are the real parts.  
    - *Odd-indexed outputs (m33, m35, m37, …, m47)* are the imaginary parts.

- **Instance 4 – col_fft3:**  
  - **Inputs:** k48–k63  
  - **FFT Outputs (m48–m63):**  
    - *Even-indexed outputs (m48, m50, m52, …, m62)* are the real parts.  
    - *Odd-indexed outputs (m49, m51, m53, …, m63)* are the imaginary parts.

### Final Spectral Register Output

The **SpectralRegister** module latches the outputs from the column FFT stage and generates the final 2D FFT output:

- **Outputs (y0–y63):**  
  - *Even-indexed outputs (y0, y2, y4, …, y62)* represent the real parts.  
  - *Odd-indexed outputs (y1, y3, y5, …, y63)* represent the imaginary parts.

---

#Testbench  Documentation
```


# Testbench for Archtest Module

This repository contains the testbench for simulating and verifying the behavior of the `Arch_test1` module. The testbench includes input stimuli for the module, as well as a method for collecting and storing the final outputs into a file.

## Description

The `tb_Archtest` module is a Verilog testbench designed to simulate the `Arch_test1` module's behavior. The testbench generates various inputs, applies them to the `Arch_test1` module, and then writes the floating-point output results to a file. The testbench is clock-driven and includes a reset signal to initialize the simulation.

### Key Features

- **Clock Generation:** A clock signal (`clk`) toggles every 20 time units, providing the timing for the simulation.
- **Reset Signal:** The reset signal (`rst`) is activated for the first 20 time units and then deactivated to begin the simulation.
- **Input Stimuli:** The testbench applies a set of 64 input values to the module. These values represent various floating-point numbers that will be processed by the `Arch_test1` module.
- **Output Logging:** The outputs from the `Arch_test1` module are logged to a file (`final_outputs.txt`) in hexadecimal format. These outputs represent the final floating-point values processed by the module.
- **Simulation Duration:** The testbench waits for 800 time units before outputting the final results.

## How to Run the Testbench

### Prerequisites

To run the testbench, you need to have access to a Verilog simulator such as **ModelSim**, **VCS**, or **XSIM**.

This section clearly specifies which FFT instance produces each set of outputs, helping users track the data flow from the initial FFT stages through to the final spectral output.
## Sample Data

### Input Data to the Spectral Register

```
0x00000000  0x00000000  0x42dfffae  0x00000000  0x42c00000  0x00000000  0x429fffae  0x00000000
0x42800000  0x00000000  0x424000a4  0x00000000  0x42000000  0x00000000  0x41800148  0x00000000
0x41000000  0x00000000  0x42efffae  0x00000000  0x42d00000  0x00000000  0x42afffae  0x00000000
0x42900000  0x00000000  0x426000a4  0x00000000  0x42200000  0x00000000  0x41c00148  0x00000000
0x00000000  0x00000000  0x4357ffa8  0x00000000  0x43400000  0x00000000  0x431fffa9  0x00000000
0x42e00000  0x00000000  0x42a000af  0x00000000  0x42400000  0x00000000  0x41c002b6  0x00000000
0x00000000  0x00000000  0x435fffae  0x00000000  0x43400000  0x00000000  0x431fffae  0x00000000
0x43000000  0x00000000  0x42c000a4  0x00000000  0x42800000  0x00000000  0x42000148  0x00000000 
```

### Output Data from the Spectral Register 

```
0x00000000  0x42800000  0x41000000  0x42900000  0x00000000  0x42e00000  0x00000000  0x43000000
0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000 
0x42dfffae  0x424000a4  0x42efffae  0x426000a4  0x4357ffa8  0x42a000af  0x435fffae  0x42c000a4  
0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000
0x42c00000  0x42000000  0x42d00000  0x42200000  0x43400000  0x42400000  0x43400000  0x42800000
0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000
0x429fffae  0x41800148  0x42afffae  0x41c00148  0x431fffa9  0x41c002b6  0x431fffae  0x42000148
0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000  0x00000000
## Explanation of Variables

### Inputs (x0 - x63)

The inputs are 64 32-bit wide registers representing floating-point values. These are passed to the `Arch_test1` module for processing. The values are written in hexadecimal format (IEEE 754 standard).

### Outputs (y0 - y63, j0 - j63, k0 - k63, m0 - m63)

The outputs are also 64 32-bit wide registers representing the final floating-point values generated by the module. These are stored in `y`, `j`, `k`, and `m` output signals and written to the output file.

### File Output

The final floating-point outputs are saved in the `final_outputs.txt` file in hexadecimal format. You can use this file to analyze the behavior of the `Arch_test1` module.

## Customization

- You can modify the input values `x0 - x63` to test different input sets and observe how the module behaves with various floating-point values.
- You can change the output file format to CSV or any other format by updating the file writing method.

## Notes

- Ensure the `Arch_test1` module is properly instantiated and connected before running the testbench.
- The simulation time can be adjusted by modifying the `#800` delay in the `initial` block.
- The floating-point values used in the testbench follow the IEEE 754 single-precision format.

