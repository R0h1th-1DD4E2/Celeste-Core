

# IFFT Module 

## Overview
The `top_IFFT` module implements an 8-point Inverse Fast Fourier Transform (IFFT) using a hierarchical structure. Similar to the FFT implementation, the IFFT is decomposed into smaller stages: an 8-point IFFT is built using two 4-point IFFTs, which in turn are constructed from 2-point IFFTs. After computing the IFFT, the results are normalized by scaling (effectively dividing by 8) using the `fp_mul` module.

---

## Hierarchical Structure

The IFFT design is built in three main levels:

1. **8-Point IFFT (`ifft8pt`):**
   - **Decomposition:** The top-level 8-point IFFT is divided into two 4-point IFFTs.
   - **Combination:** The outputs from the 4-point IFFTs are combined using four 2-point IFFT modules with appropriate twiddle factor multiplications.
   
2. **4-Point IFFT (`ifft4pt`):**
   - **Sub-Decomposition:** Each 4-point IFFT is broken down further into two 2-point IFFT modules.
   - **Twiddle Factor Application:** Intermediate results are combined with twiddle factors before being output.
   
3. **2-Point IFFT (`ifft_2pt`):**
   - **Core Operation:** This module performs the fundamental two-point inverse DFT, using floating-point multiplications and additions.
   - **Basic Butterfly Computation:** Computes the necessary sums and differences, applying the required twiddle factors.

### Hierarchy Tree Representation

```
top_IFFT
│
└── ifft8pt
    ├── ifft4pt (Instance: ifft4_1)
    │   ├── ifft_2pt (Instance: ins1)
    │   ├── ifft_2pt (Instance: ins2)
    │   ├── ifft_2pt (Instance: ins3)
    │   └── ifft_2pt (Instance: ins4)
    │
    ├── ifft4pt (Instance: ifft4_2)
    │   ├── ifft_2pt (Instance: ins1)
    │   ├── ifft_2pt (Instance: ins2)
    │   ├── ifft_2pt (Instance: ins3)
    │   └── ifft_2pt (Instance: ins4)
    │
    ├── ifft_2pt (Instance: ifft2_1)
    ├── ifft_2pt (Instance: ifft2_2)
    ├── ifft_2pt (Instance: ifft2_3)
    └── ifft_2pt (Instance: ifft2_4)
```

---

## Detailed Explanation

### 8-Point IFFT (`ifft8pt`)
- **Function:** Computes the IFFT on eight complex inputs by first processing them through two parallel 4-point IFFTs.
- **Process:** 
  - **Stage 1:** Two instances of the 4-point IFFT process different subsets of the inputs.
  - **Stage 2:** The outputs from these 4-point modules are then combined using four 2-point IFFT modules that apply the necessary twiddle factors.
- **Normalization:** The results from `ifft8pt` are then scaled using eight instances of `fp_mul`. Each floating-point multiplier multiplies the output by the constant `32'h3e000000` (which corresponds to dividing by 8 in IEEE 754 floating-point format).

### 4-Point IFFT (`ifft4pt`)
- **Function:** Each 4-point IFFT processes four input samples.
- **Process:** 
  - It decomposes the four input samples into two pairs.
  - Two 2-point IFFT modules compute the initial transforms on these pairs.
  - A subsequent stage combines these results with twiddle factor multiplications to generate the final 4-point output.
  
### 2-Point IFFT (`ifft_2pt`)
- **Function:** Implements the basic butterfly computation for a 2-point inverse DFT.
- **Process:** 
  - Uses floating-point multipliers (`fp_mul`) to apply twiddle factors.
  - Uses floating-point adders (`fp_add`) to compute the sum and difference of the transformed pairs.
  
### Scaling with fp_mul
- After the IFFT is computed by the `ifft8pt` module, each output is normalized by dividing by 8.
- This is achieved by instantiating `fp_mul` modules that multiply each of the temporary IFFT outputs by the constant `32'h3e000000`.
- This scaling ensures the final IFFT outputs (`X0` through `X7`) are properly normalized.

---

## Inputs and Outputs

### top_IFFT Module

Here’s a more compact version of the table summarizing the four types of signals:  

| Signal Type | Direction | Width   | Description                                      |  
|-------------|-----------|---------|--------------------------------------------------|  
| `xN_real`   | Input     | 32-bit  | Real part of input sample `N` (0 to 7)          |  
| `xN_imag`   | Input     | 32-bit  | Imaginary part of input sample `N` (0 to 7)     |  
| `XN_real`   | Output    | 32-bit  | Normalized real output sample `N` (scaled)      |  
| `XN_imag`   | Output    | 32-bit  | Normalized imaginary output sample `N` (scaled) |  

This keeps the essential structure while making it concise.
---

## Instantiation and Scaling

Within the `top_IFFT` module:
- The `ifft8pt` module processes the eight complex inputs and produces temporary outputs.
- Each temporary output is scaled using an instance of `fp_mul`:
  - The scaling factor (`32'h3e000000`) corresponds to a division by 8.
  - This normalization ensures that the final IFFT outputs are properly scaled.

For example, the scaling is performed as follows:

