

# Archtest2


---

## Data Flow and Block Diagram

The module can be logically divided into the following stages:

1. **Filtered Frequency Buffer:**  
   - **Inputs:** `I0` to `I63`  
   - **Outputs:** `z0` to `z63`  
   - *Description:* Inputs are stored and processed to produce a filtered frequency buffer.

2. **IFFT Processing:**  
   - The filtered outputs are divided into four groups:  
     - **Group 1:** `z0` to `z15` → IFFT instance **col_ins1** → Outputs: `s0` to `s15`
     - **Group 2:** `z16` to `z31` → IFFT instance **col_ins2** → Outputs: `t0` to `t15`
     - **Group 3:** `z32` to `z47` → IFFT instance **col_ins3** → Outputs: `u0` to `u15`
     - **Group 4:** `z48` to `z63` → IFFT instance **col_ins4** → Outputs: `v0` to `v15`

3. **Transpose Buffer:**  
   - **Inputs:** Combined IFFT outputs (`s`, `t`, `u`, `v`)
   - **Outputs:**  
     - From transpose: `e0` to `e15`, `f0` to `f15`, `g0` to `g15`, `h0` to `h15`

4. **Final IFFT (Row-wise Processing):**  
   - The transposed data is processed by four additional IFFT modules (row_ins1 to row_ins4) to produce the final outputs `O0` to `O63`.

---

## Submodules and Their Functions

### 1. Filtered Frequency Buffer
- **Instance Name:** `filteredFrequencyBuffer`  
- **Function:** Receives 64 input signals (`I0`–`I63`) and outputs a filtered set of signals (`z0`–`z63`).

### 2. IFFT Processing Blocks (Column-wise)
- **Instances:** `col_ins1`, `col_ins2`, `col_ins3`, `col_ins4`  
- **Function:** Each IFFT instance processes 8 pairs of real and imaginary components derived from the filtered signals.  
  - **col_ins1:** Processes `z0`–`z15` → produces `s0`–`s15`
  - **col_ins2:** Processes `z16`–`z31` → produces `t0`–`t15`
  - **col_ins3:** Processes `z32`–`z47` → produces `u0`–`u15`
  - **col_ins4:** Processes `z48`–`z63` → produces `v0`–`v15`

### 3. Transpose Buffer
- **Instance Name:** `transposeBuffer`  
- **Function:** Takes the outputs from the IFFT blocks (`s`, `t`, `u`, `v`) and transposes them to form new data groups (`e`, `f`, `g`, `h`).

### 4. IFFT Processing Blocks (Row-wise)
- **Instances:** `row_ins1`, `row_ins2`, `row_ins3`, `row_ins4`  
- **Function:** Process the transposed data to generate the final outputs.  
  - **row_ins1:** Processes `e0`–`e15` → produces `O0`–`O15`
  - **row_ins2:** Processes `f0`–`f15` → produces `O16`–`O31`
  - **row_ins3:** Processes `g0`–`g15` → produces `O32`–`O47`
  - **row_ins4:** Processes `h0`–`h15` → produces `O48`–`O63`

---

## Signal Mapping

### Input Signals
- **Clock and Reset:**
  - `clk`: Clock signal
  - `rst`: Reset signal
- **Data Inputs:**
  - `I0` to `I63`: 64 input data signals

### Intermediate Signals
- **Filtered Frequency Buffer Outputs:**  
  - `z0` to `z63`

- **IFFT Column-wise Outputs:**  
  - `s0` to `s15` (from `col_ins1`)  
  - `t0` to `t15` (from `col_ins2`)  
  - `u0` to `u15` (from `col_ins3`)  
  - `v0` to `v15` (from `col_ins4`)

- **Transpose Buffer Outputs:**  
  - `e0` to `e15`  
  - `f0` to `f15`  
  - `g0` to `g15`  
  - `h0` to `h15`

### Final Output Signals
- **Final IFFT (Row-wise) Outputs:**  
  - `O0` to `O63`



**Inline Comments Overview:**

- **Filtered Frequency Buffer:**  
  - `// I0-I63 go as inputs to  filteredFrequencyBuffer`  
  - `// z0-z63 is the outputs from the filteredFrequencyBuffer`

- **IFFT Instances:**  
  - `// z0-z15 inputs of IFFT col_ins1`  
  - `// z16-z31 inputs of IFFT col_ins2`  
  - `// z32-z47 inputs of IFFT col_ins3`  
  - `// z48-z63 inputs of IFFT col_ins4`  
  - `// s0-s15 outputs of IFFT col_ins1`  
  - `// t0-t15 outputs of IFFT col_ins2`  
  - `// u0-u15 outputs of IFFT col_ins3`  
  - `// v0-v15 outputs of IFFT col_ins4`

- **Transpose Buffer:**  
  - `// now s,t,u,v acts as inputs to transpose buffer giving  e,f,g,h`  
  - `// e0-e15 outputs of transpose buffer`  
  - `// f0-f15 outputs of transpose buffer`  
  - `// g0-g15 outputs of transpose buffer`  
  - `// h0-h15 outputs of transpose buffer`


