# FFT

## Module: `top_FFT`

### Overview
The `top_FFT` module implements an 8-point Fast Fourier Transform (FFT). The design follows a hierarchical structure by decomposing an 8-point FFT into two 4-point FFTs, which are further decomposed into 2-point FFTs.

## Hierarchical Structure
The FFT implementation follows a structured approach:

1. **8-point FFT (`fft8pt`)**
   - Composed of two 4-point FFT modules (`fft4pt`)
   - Final stage consists of four 2-point FFTs (`fft_2pt`) to combine results
2. **4-point FFT (`fft4pt`)**
   - Composed of two 2-point FFT modules (`fft_2pt`)
   - Intermediate results are processed using twiddle factors
3. **2-point FFT (`fft_2pt`)**
   - Performs basic two-point DFT computation
   - Uses floating-point multiplication and addition for twiddle factor application

### Hierarchy Tree Representation:
```
top_FFT
│
└── fft8pt
    ├── fft4pt (fft4_1)
    │   ├── fft_2pt (ins1)
    │   ├── fft_2pt (ins2)
    │   ├── fft_2pt (ins3)
    │   └── fft_2pt (ins4)
    │
    ├── fft4pt (fft4_2)
    │   ├── fft_2pt (ins1)
    │   ├── fft_2pt (ins2)
    │   ├── fft_2pt (ins3)
    │   └── fft_2pt (ins4)
    │
    ├── fft_2pt (fft2_1)
    ├── fft_2pt (fft2_2)
    ├── fft_2pt (fft2_3)
    └── fft_2pt (fft2_4)
```

---

## Detailed Explanation

### 8-Point FFT (`fft8pt`)
This module implements an 8-point FFT using two 4-point FFTs (`fft4pt`). The outputs of these 4-point FFTs are combined using four 2-point FFT modules (`fft_2pt`) with appropriate twiddle factors.

#### Inputs and Outputs:
| Signal Name | Direction | Width | Description |
|-------------|----------|-------|-------------|
| `xr0` - `xr7` | Input | 32-bit | Real part of input samples |
| `xi0` - `xi7` | Input | 32-bit | Imaginary part of input samples |
| `Xr0` - `Xr7` | Output | 32-bit | Real part of FFT output samples |
| `Xi0` - `Xi7` | Output | 32-bit | Imaginary part of FFT output samples |

This module instantiates:
- Two `fft4pt` modules for initial decomposition.
- Four `fft_2pt` modules for final stage computation.
- Uses predefined twiddle factors for proper FFT computation.

### 4-Point FFT (`fft4pt`)
Each `fft4pt` module further decomposes its inputs using two `fft_2pt` modules.

#### Inputs and Outputs:
| Signal Name | Direction | Width | Description |
|-------------|----------|-------|-------------|
| `xr0` - `xr3` | Input | 32-bit | Real part of input samples |
| `xi0` - `xi3` | Input | 32-bit | Imaginary part of input samples |
| `Xr0` - `Xr3` | Output | 32-bit | Real part of FFT output samples |
| `Xi0` - `Xi3` | Output | 32-bit | Imaginary part of FFT output samples |

Each `fft4pt` module:
- Instantiates two `fft_2pt` modules.
- Applies twiddle factors in the second stage.

### 2-Point FFT (`fft_2pt`)
The `fft_2pt` module is the smallest computation unit in the FFT hierarchy. It computes a basic two-point Discrete Fourier Transform (DFT) using:
- Floating-point multiplication (`fp_mul`) for twiddle factor application.
- Floating-point addition (`fp_add`) for summation of transformed values.

#### Inputs and Outputs:
| Signal Name | Direction | Width | Description |
|-------------|----------|-------|-------------|
| `x0_real`, `x0_imag` | Input | 32-bit | First complex input |
| `x1_real`, `x1_imag` | Input | 32-bit | Second complex input |
| `twiddle_real`, `twiddle_imag` | Input | 32-bit | Twiddle factor values |
| `X0_real`, `X0_imag` | Output | 32-bit | First transformed output |
| `X1_real`, `X1_imag` | Output | 32-bit | Second transformed output |

Each `fft_2pt` module performs:
- Multiplication of `x1` with twiddle factors.
- Addition/subtraction operations to compute DFT results.

### Summary
The `top_FFT` module provides an efficient hierarchical implementation of an 8-point FFT by breaking it down into 4-point and 2-point FFT computations. The modular design allows for scalability to larger FFT sizes and optimized computation using floating-point arithmetic.

