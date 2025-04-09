## DOCUMENTATION OF 2D CONVOLUTION ARCHITECTURE

| Name                                         | Function                  |
|----------------------------------------------|---------------------------|
| **Ip_0_R - Ip_63_R** <br> **Ip_0_I - Ip_63_I** | **Main Inputs**           |
| **Op_0_R - Op_63_R** <br> **Op_0_I - Op_63_I** | **Main Outputs**          |
| **ker_in_0_R - ker_in_63_R** <br> **ker_in_0_I - ker_in_63_I** | **Kernel Inputs**         |
| **rg1_0_real - rg1_63_real** <br> **rg1_0_imaginary - rg1_63_imaginary** <br><br> **rg2_0_real - rg2_63_real** <br> **rg2_0_imaginary - rg2_63_imaginary** <br><br> **rg3_0_real - rg3_63_real** <br> **rg3_0_imaginary - rg3_63_imaginary** <br><br> **rg4_0_real - rg4_63_real** <br> **rg4_0_imaginary - rg4_63_imaginary** <br><br> **rg5_0_real - rg5_63_real** <br> **rg5_0_imaginary - rg5_63_imaginary** | **Register Buffers**       |
| **FTR_0_real - FTR_63_real** <br> **FTR_0_imaginary - FTR_63_imaginary** <br><br> **FTC_0_real - FTC_63_real** <br> **FTC_0_imaginary - FTC_63_imaginary** <br><br> **IFTR_0_real - IFTR_63_real** <br> **IFTR_0_imaginary - IFTR_63_imaginary** | **FFT/IFFT Outputs**       |




## 1. Overview

The module is designed to process 32-bit vector signals representing real and imaginary parts of complex data. It employs a series of operations:

1. **Input Buffering**  
2. **Row-wise FFT Processing**  
3. **Matrix Transposition**  
4. **Column-wise FFT Processing**  
5. **Spectral Data Storage**  
6. **Kernel Multiplication (Gaussian Kernel)**  
7. **Frequency Domain Filtering**  
8. **Column-wise Inverse FFT (IFFT)**  
9. **Second Transposition and Row-wise IFFT**  
10. **Output Buffering**

Each stage is implemented via dedicated registers or dedicated FFT/IFFT modules, providing a clear and modular pipeline for both forward and inverse Fourier transforms as well as kernel-based spectral filtering.

---

## 2. Variable and Signal Naming Conventions

Unless stated otherwise, all signals are **32-bit vectors**. The following naming patterns have been adopted:

### Clock and Reset

| **Signal** | **Description**                                      |
|------------|------------------------------------------------------|
| `clk`      | Clock signal for synchronization (system clock)    |
| `rst`      | Active-high reset signal to initialize the design    |

### Main Input Signals

All main input signals are split into separate real and imaginary components:

- **Naming Pattern:** `Ip_<index>_<component>`
  
| **Range**                          | **Purpose**                                           |
|------------------------------------|-------------------------------------------------------|
| `Ip_0_real` to `Ip_63_real`        | Real component of the main complex input              |
| `Ip_0_imaginary` to `Ip_63_imaginary` | Imaginary component of the main complex input       |

### Main Output Signals

Output signals follow a similar pattern:

- **Naming Pattern:** `Op_<index>_<component>`
  
| **Range**                          | **Purpose**                                         |
|------------------------------------|-----------------------------------------------------|
| `Op_0_real` to `Op_63_real`        | Real component of the processed output               |
| `Op_0_imaginary` to `Op_63_imaginary` | Imaginary component of the processed output        |

### Kernel Input Signals

Kernel signals are used for filtering in the spectral domain. There are two key considerations:
1. **Kernel declaration (pre-assignment):**  
   The kernel is initially declared with a range of signals, for instance, `ker_in_48_R`, `ker_in_48_I`, …, `ker_in_63_R`, `ker_in_63_I`.
2. **Kernel initialization:**  
   As will be detailed in Section 3, kernel coefficients are assigned using IEEE 754 hexadecimal constants to form a Gaussian kernel.

- **Naming Pattern:** `ker_in_<index>_<component>`

| **Range**                          | **Purpose**                           |
|------------------------------------|---------------------------------------|
| `ker_in_0_real` to `ker_in_63_real`       | Real part of the kernel input            |
| `ker_in_0_imaginary` to `ker_in_63_imaginary` | Imaginary part of the kernel input       |

### Register (Buffer) Signals

Intermediate processing is managed via registers, each mapped to a specific function in the pipeline:

- **Naming Pattern:** `rg<register_number>_<index>_<component>`

| **Register** | **Purpose**                        | **Typical Role**                                               |
|--------------|------------------------------------|----------------------------------------------------------------|
| `rg1`        | **Input Buffer**                   | Stores incoming data prior to FFT processing                   |
| `rg2`        | **Transpose Buffer**               | Captures data after row-wise FFT to reorient for column FFT      |
| `rg3`        | **Spectral Data Buffer**           | Holds intermediate spectral data post FFT                     |
| `rg4`        | **Filtered Frequency Buffer**      | Stores filtered spectral data after kernel multiplication        |
| `rg5`        | **Transpose Buffer 2**             | Re-orients data prior to final IFFT processing                    |

### FFT and IFFT Output Variables

After the FFT and IFFT operations, outputs are stored with names indicating the processing direction and axis:

- **FFT Row Output:**  
  **Naming Pattern:** `FTR_<index>_<component>`

| **Range**                   | **Purpose**                             |
|-----------------------------|-----------------------------------------|
| `FTR_0_real` to `FTR_63_real`            | Real component of row-wise FFT output     |
| `FTR_0_imaginary` to `FTR_63_imaginary`  | Imaginary component of row-wise FFT output  |

- **FFT Column Output:**  
  **Naming Pattern:** `FTC_<index>_<component>`

| **Range**                   | **Purpose**                              |
|-----------------------------|------------------------------------------|
| `FTC_0_real` to `FTC_63_real`            | Real component of column-wise FFT output  |
| `FTC_0_imaginary` to `FTC_63_imaginary`  | Imaginary component of column-wise FFT output |

- **IFFT Output Variables:**  
  **Naming Pattern:** `IFTR_<index>_<component>`

| **Range**                   | **Purpose**                                 |
|-----------------------------|---------------------------------------------|
| `IFTR_0_real` to `IFTR_63_real`            | Real component of IFFT row output            |
| `IFTR_0_imaginary` to `IFTR_63_imaginary`  | Imaginary component of IFFT row output         |

---

## 3. Kernel Initialization – Gaussian Kernel (IEEE 754 Representation)

A key part of the design involves applying a Gaussian filter in the frequency domain. The kernel coefficients are represented in IEEE 754 floating point hexadecimal notation. For example, the following assignment defines a set of eight real coefficients for the Gaussian kernel:

```verilog
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GAUSSIAN KERNEL IEEE 754
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign ker_in_0_R  = 32'h3951b717, 
       ker_in_1_R  = 32'h399d4952, 
       ker_in_2_R  = 32'h3a03126f, 
       ker_in_3_R  = 32'h3b2a64c3,
       ker_in_4_R  = 32'hbc7765fe, 
       ker_in_5_R  = 32'h3b2a64c3, 
       ker_in_6_R  = 32'h3a03126f, 
       ker_in_7_R  = 32'h399d4952;
```

### Explanation

- **IEEE 754 Representation:**  
  Each hexadecimal constant represents a 32-bit floating point value corresponding to the Gaussian distribution weights.
  
- **Kernel Range and Assignment:**  
  Although the naming convention in declarations might cover a broader index range (such as `ker_in_48_R` to `ker_in_63_R` for specific application setups), the example above shows the assignment for the first eight coefficients (`ker_in_0_R` to `ker_in_7_R`). Adjustments can be made based on design requirements—either extending this pattern or remapping indices as needed.

- **Imaginary Component:**  
  It is assumed that the imaginary kernel values either are zero (if not used) or are similarly assigned in another section of the code. In many Gaussian filter designs, the kernel is real-valued; thus, corresponding imaginary assignments might be omitted or set to zero.

---

## 4. Processing Pipeline and Module Instantiation

The module instantiates several sub-modules, each handling specific parts of the signal processing chain. Here is an overview of the processing steps and the corresponding module instantiations:

### 4.1. Input Buffering

- **Module:** `Register InputBuffer`
  
  The **Input Buffer** captures and holds the incoming 32-bit vector data from the external interface before processing. This is mapped to `rg1`.

### 4.2. Row-wise FFT Processing

- **Modules:**  
  Eight instances of `fft8pt` are instantiated, named `fft_row_0` through `fft_row_7`.  

  **Purpose:**  
  Each instance performs an 8-point FFT on a row of data, converting time-domain samples into the frequency domain (row-wise processing).

### 4.3. Matrix Transposition

- **Module:** `Register TransposeBuffer`
  
  After row-wise FFT, data is transposed to align for column processing. This intermediate step is essential for two-dimensional FFT operation.

### 4.4. Column-wise FFT Processing

- **Modules:**  
  Eight instances of `fft8pt` are instantiated for column processing, named `fft_col_0` through `fft_col_7`.  

  **Purpose:**  
  These instances compute the column-wise FFT of the transposed data to yield a full 2D FFT of the input signal.

### 4.5. Spectral Data Storage

- **Module:** `SpectralRegister SpectralDataBuffer`
  
  This register stores the intermediate FFT results (spectral data). The spectral data can be used for further filtering or analysis.

### 4.6. Kernel Multiplication (Filtering)

- **Module:** `KernelMultiplier inst()`
  
  This critical stage multiplies the spectral data by the Gaussian kernel coefficients. This filtering operation is typically used to attenuate or emphasize certain frequency components.

### 4.7. Filtered Frequency Buffering

- **Module:** `Register FilteredFrequencyBuffer`
  
  After kernel multiplication, the filtered frequency data is stored temporarily in this register for subsequent inverse transform processing.

### 4.8. Inverse FFT (IFFT) – Column Processing

- **Modules:**  
  Eight instances of `ifft8pt` are instantiated, named `ifft_col_0` through `ifft_col_7`.  

  **Purpose:**  
  These modules perform the inverse FFT on the filtered spectral data by columns, reverting the frequency-domain modifications back toward the time domain.

### 4.9. Second Transposition and IFFT – Row Processing

- **Module:** `Register TransposeBuffer2`  
  A second transposition is applied to reorient the data before the final IFFT stage.
  
- **Modules:**  
  Eight instances of `ifft8pt` are instantiated, named `ifft_row_0` through `ifft_row_7`.

  **Purpose:**  
  These process the IFFT row-wise to finalize the transformation back into the time domain.

### 4.10. Final Output Buffering

- **Module:** `Register OutputBuffer`
  
  The completed processed output is captured in the Output Buffer (`rg5` can be considered analogous to this stage) before being sent out of the module as final data.

---

## 5. Detailed Block Diagram (Conceptual)

A simplified overview of the data flow through the module is as follows:

```
             ┌────────────────┐
             │   Input Data   │
             └───────┬────────┘
                     │
         ┌──────────▼─────────┐
         │  Input Buffer      │
         └──────────┬─────────┘
                     │
           ┌─────────▼─────────┐
           │ Row-wise FFTs     │ (fft_row_0 ~ fft_row_7)
           └─────────┬─────────┘
                     │
         ┌──────────▼───────────┐
         │ Transpose Buffer     │
         └──────────┬───────────┘
                     │
           ┌─────────▼─────────┐
           │ Column-wise FFTs  │ (fft_col_0 ~ fft_col_7)
           └─────────┬─────────┘
                     │
         ┌──────────▼───────────┐
         │ Spectral Data Buffer │
         └──────────┬───────────┘
                     │
            ┌────────▼─────────┐
            │ Kernel Multiplier│
            └────────┬─────────┘
                     │
         ┌──────────▼───────────┐
         │ Filtered Frequency   │
         │ Buffer               │
         └──────────┬───────────┘
                     │
            ┌────────▼─────────┐
            │ IFFT Column      │ (ifft_col_0 ~ ifft_col_7)
            └────────┬─────────┘
                     │
            ┌────────▼─────────┐
            │ Transpose Buffer 2│
            └────────┬─────────┘
                     │
            ┌────────▼─────────┐
            │ IFFT Row         │ (ifft_row_0 ~ ifft_row_7)
            └────────┬─────────┘
                     │
            ┌────────▼─────────┐
            │ Output Buffer    │
            └──────────────────┘
```

This diagram clarifies the high-level flow from input capture to final output, demonstrating how the FFT/IFFT modules, buffers, and kernel operations interconnect.

---

## 6. Conclusion

This document provides an in-depth look at the main Verilog module (`top`). It covers:

- **Signal Naming Conventions:** Clear definitions for clock/reset signals, main I/O, kernel inputs, and register buffers.  
- **Kernel Initialization:** A step-by-step explanation of how the Gaussian kernel coefficients are assigned using IEEE 754 representations.  
- **Processing Pipeline:** Detailed descriptions of sub-module instantiations that implement a complete 2D FFT, spectral filtering via kernel multiplication, and subsequent inverse FFT to yield the final output.

This refined documentation is intended to assist hardware designers and verification engineers in understanding, maintaining, and extending the functionality of the digital signal processing module.

--- 

Feel free to update or expand any sections as the design evolves or as additional features are introduced.