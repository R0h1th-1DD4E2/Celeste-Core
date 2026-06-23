# **Celeste-Core**  

**Celeste-Core** is a specialized **2D convolution hardware block** designed to deliver lightning-fast performance using the **Fast Fourier Transform (FFT)** algorithm. This project provides a standalone, modular convolution accelerator that can be easily integrated into various digital signal processing systems, offering maximum flexibility for building custom processing pipelines.

---

## Key Features
-  **Optimized 2D Convolution**: Implements FFT-based convolution with **O(NlogN)** time complexity, significantly outperforming traditional O(N²) spatial domain methods
-  **Fully Pipelined Architecture**: 7-stage processing pipeline ensuring efficient data flow and minimal latency
-  **Modular Design**: Standalone convolution block provides flexibility to build custom processing systems around it
-  **8x8 Kernel Optimization**: Specifically optimized for 8x8 convolution kernels with dedicated FFT units
-  **IEEE 754 Compatibility**: Built-in support for IEEE 754 floating-point kernel coefficients
-  **Real-time Processing**: Efficient buffering and register management for continuous data processing
-  **Application Ready**: Perfect for image processing, signal processing, and machine learning acceleration

---

##   Introduction
Convolution operations are fundamental to modern digital signal processing, enabling critical functions such as:
- **Image Processing**: Blurring, sharpening, edge detection, and feature extraction
- **Signal Processing**: Filtering, noise reduction, and system analysis
- **Deep Learning**: Powering convolutional neural networks (CNNs) for image classification, object detection, and segmentation

Traditional convolution implementations suffer from high computational complexity, especially for larger datasets and higher resolutions. **Celeste-Core** solves this challenge by providing a dedicated hardware block that leverages FFT-based convolution, dramatically reducing computation cycles while maintaining precision.

---

## Project Objective
The goal of **Celeste-Core** is to provide a **standalone convolution hardware block** that:
-  Delivers **high-performance convolution** with minimal resource overhead
-  Offers **maximum flexibility** for integration into custom processing systems
-  Optimizes **power efficiency** while maintaining high computational throughput
-  Implements a **fully pipelined FFT architecture** for superior resource utilization
-  Provides **modular design** allowing easy customization and extension

---

## Algorithm Overview
### **FFT-Based Convolution Pipeline:**
**Celeste-Core** implements a sophisticated 7-stage processing pipeline that transforms spatial domain convolution into efficient frequency domain operations:
<img width="1216" height="1424" alt="bd" src="https://github.com/user-attachments/assets/132c686d-5ecc-405c-a523-b06b141d1a2e" />

1. **Input Buffering** - Captures incoming 32-bit complex data
2. **Row-wise FFT Processing** - 8 parallel FFT units process matrix rows
3. **Column-wise FFT Processing** - Completes 2D FFT transformation with transposition
4. **Kernel Multiplication** - Applies Gaussian kernel filtering in frequency domain
5. **Column-wise Inverse FFT** - Begins transformation back to spatial domain
6. **Row-wise IFFT** - Completes inverse transformation with transposition
7. **Output Buffering** - Delivers final convolution results

### Technical Advantages:
-  **Reduced Complexity**: O(NlogN) vs O(N²) traditional convolution
-  **Memory Efficient**: Optimized buffer management with register-based storage
-  **Resource Optimized**: Shared FFT/IFFT resources with intelligent pipelining
-  **High Throughput**: Parallel processing units maximize data flow

---

##  Hardware Architecture

<img width="1612" height="1636" alt="archi_bd" src="https://github.com/user-attachments/assets/ccd45634-3da7-4e1e-afa4-a3deed9df69e" />

### Core Components:
- **8 Parallel FFT Units**: Dedicated 8-point FFT processors for row/column operations
- **8 Parallel IFFT Units**: Inverse FFT processors for spatial domain reconstruction  
- **5 Register Banks**: Specialized buffers (rg1-rg5) for different pipeline stages
- **Kernel Multiplier**: IEEE 754 compatible Gaussian kernel processor
- **Transpose Logic**: Efficient matrix reorientation between processing stages

### Signal Interface:
- **32-bit Complex I/O**: Separate real and imaginary components (Ip_0_R/I to Ip_63_R/I)
- **Kernel Inputs**: Configurable kernel coefficients (ker_in_0_R/I to ker_in_63_R/I)
- **Control Signals**: Standard clock and reset for system integration
- **Output Ports**: Processed results (Op_0_R/I to Op_63_R/I)

### Processing Flow:
```
Input → Buffer → Row FFT → Column FFT → 
Kernel Filter → IFFT Column → IFFT Row → Output Buffer → Result
```

---

## Technical Specifications
- **Data Width**: 32-bit IEEE 754 floating-point
- **Matrix Size**: 8x8 optimized processing
- **Kernel Support**: Gaussian kernel with configurable coefficients
- **Pipeline Depth**: 7 stages for maximum throughput
- **Clock Domain**: Single clock domain design
- **Reset**: Synchronous active-high reset
- **Interface**: Standard Verilog module with clear naming conventions

---

## Performance Metrics
- **Algorithm Complexity**: O(NlogN) FFT-based convolution
- **Kernel Size**: Optimized for 8x8 kernels
- **Processing Units**: 16 dedicated FFT/IFFT cores
- **Memory Architecture**: Register-based buffering for minimal latency
- **Continuous Processing**: Pipelined architecture with 7-stage data flow

---



### **Easy Integration**
The modular design of Celeste-Core makes it simple to integrate into existing systems:
- **Standalone Operation**: No external dependencies or complex interfaces
- **Standard Verilog**: Compatible with any FPGA or ASIC design flow
- **Configurable Kernels**: Easy kernel coefficient modification via parameter assignment
- **Scalable Design**: Architecture supports extension to larger matrix sizes

### **Customization Options**
- **Kernel Modification**: Update IEEE 754 coefficients for different filter types
- **Interface Adaptation**: Modify I/O width or add control signals as needed  
- **Pipeline Optimization**: Adjust buffer sizes for specific timing requirements
- **Resource Scaling**: Modify parallel unit count based on resource constraints


 ###  Results of applied Image filters 
<img width="1908" height="1023" alt="res1_emboss" src="https://github.com/user-attachments/assets/56355863-b25c-43f4-ac89-4850cb34bfa6" />
<img width="1892" height="952" alt="res2_edge" src="https://github.com/user-attachments/assets/6649ac55-c5d1-4209-9d7d-cdee88d518c2" />
<img width="1913" height="967" alt="res3_gaussian_blur" src="https://github.com/user-attachments/assets/4a7026a6-e0d6-4472-aaf9-b4d6aa8198f4" />


Revolutionizing convolution processing, one FFT pipeline at a time!
