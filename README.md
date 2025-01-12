
---

# **Celeste-Core** 🚀  

**Celeste-Core** is a specialized hardware block designed to handle **2D convolution operations** with lightning-fast performance using the **Fast Fourier Transform (FFT)** algorithm. This project leverages the **PicoRV32 RISC-V Core**, optimized with **multiplication** and **division extensions**, and focuses on efficient computation for kernel sizes of **8x8**.

---

## **🚩 Key Features**
- ⚡ **Optimized Convolution**: Implements FFT-based convolution with a time complexity of **O(NlogN)**, outperforming traditional O(N²) methods.
- 🧠 **Pipelined Architecture**: Ensures parallel execution of FFT stages, minimizing bottlenecks and latency.
- 🏋️ **Reduced Multiplications**: Optimized complex multiplications, cutting hardware requirements.
- 💻 **Built for Versatility**: Targets image processing, signal processing, and machine learning applications.

---

## **💡 Introduction**
Convolution is the heart of signal and image processing, enabling operations such as:
- **Image Processing**: Blurring, sharpening, edge detection, and feature extraction.
- **Signal Processing**: Filtering, noise reduction, and system analysis. [*Still needs to work on*]
- **Deep Learning**: Powering convolutional neural networks (CNNs) for tasks like image classification, object detection, and segmentation. [*would require a software layer*]

However, convolution is a computationally expensive operation, especially for higher resolutions and larger datasets. **Celeste-Core** addresses this challenge by integrating an optimized FFT-based approach, reducing computation cycles and resource consumption.

---

## **🎯 Project Objective**
The goal of **Celeste-Core** is to design a **hardware accelerator** for convolution operations that:
- 🚀 Achieves **faster performance** without disrupting normal ALU operation.
- 🌍 Optimizes **power efficiency** while maintaining high computational throughput.
- 🔄 Implements FFT with **pipelining** for superior resource utilization.

---

## **🧪 Algorithm Overview**
### **Convolution Theorem:**
Traditional convolution involves direct computation in the spatial domain. The **FFT algorithm** transforms the spatial domain into the frequency domain, leveraging the **Convolution Theorem** to replace convolution with element-wise multiplication. The pipeline:
1. **Forward FFT**: Transform the input data and kernel to the frequency domain.
2. **Pointwise Multiplication**: Multiply the transformed inputs in the frequency domain.
3. **Inverse FFT**: Convert the result back to the spatial domain.

### **Advantages of FFT-Based Convolution:**
- 🚀 Reduced complexity: **O(NlogN)** compared to O(N²).
- 📉 Lower memory consumption using **Decimation in Time (DIT)** methodology.
- 🔧 Resource-efficient: Shared FFT and IFFT resources with optimized multiplication.

---

## **🏗️ Hardware Design**
### **Core Highlights:**
- Implements **PicoRV32 RISC-V Core** with custom extensions.
- Fully pipelined architecture for FFT operations.

### **Architecture at a Glance:**
1. **Input Stage**: Accepts rows of the input matrix.
2. **FFT Processing**:
   - **Row-wise FFT** for the input matrix.
   - Intermediate storage in buffer.
   - **Column-wise FFT** on the transposed matrix.
3. **Inverse FFT**: Final convolution result back in the spatial domain.

---

## **⚙️ System Requirements**
- **FPGA/ASIC**: Suitable for hardware implementations on resource-constrained platforms. [*work in progress*]
- **PicoRV32 RISC-V Core**: Utilized for control logic and interfacing.

---

## **📊 Performance**
- **Kernel Size**: Optimized for **8x8 kernels**.
- **Time Complexity**: FFT convolution achieves **O(NlogN)**.
- **Resource Efficiency**: Reduced real multiplications from 4 to 3 per complex operation.

---

## **🚀 Get Started**
### **Clone the Repository**

```bash
git clone https://github.com/R0h1th-1DD4E2/Celeste-Core.git
```

### **Run Simulations**
- Use **Vivado**, **ModelSim**, or other Verilog-compatible simulators.
- Testbench provided in the repository.

---

## **📂 Repository Structure**

```python
Celeste-Core/
├── fft_unit/                # Verilog source files
├── docs/                    # Documentation and design 
├── results/                 # Performance metrics and analysis [will be soon updated]
├── conv_test/               # Program file to simulate
├── dhrystone/               # Pico testbench
├── picosoc/                 # Implementation of PICO SoC
└── README.md                # Project README
```

---

## **🛠️ Contributing**
Contributions are welcome! Feel free to fork this repository, create new features, fix bugs, or improve documentation.

1. Fork the repository.
2. Create your branch: `git checkout -b feature/awesome-feature`.
3. Commit your changes: `git commit -m 'Add awesome feature'`.
4. Push to the branch: `git push origin feature/awesome-feature`.
5. Open a pull request!

---

## **🌟 Future Enhancements**
- Support for **dynamic kernel sizes**.
- Integration with **machine learning accelerators**.
- Implementation on **ASIC** for production-level applications.

---

## **📄 License**
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

**✨ Let's redefine convolution operations, one FFT at a time!**

--- 
