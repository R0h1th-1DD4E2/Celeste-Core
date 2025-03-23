import numpy as np
import struct

# Define a function to convert a float to IEEE 754 hexadecimal representation
def float_to_ieee754_hex(value):
    return format(struct.unpack('>I', struct.pack('>f', value))[0], '08X')

# Define sample sequences
N = 8  # Number of samples in each set
even_nums = np.arange(2, 2*N+1, 2)   # First set: even numbers
odd_nums = np.arange(1, 2*N, 2)      # Second set: odd numbers
multiples_3 = np.arange(3, 3*N+1, 3) # Third set: multiples of 3
multiples_4 = np.arange(4, 4*N+1, 4) # Fourth set: multiples of 4

# Compute first stage FFT
fft_even = np.fft.fft(even_nums)
fft_odd = np.fft.fft(odd_nums)
fft_mult3 = np.fft.fft(multiples_3)
fft_mult4 = np.fft.fft(multiples_4)

# Compute second stage FFT on outputs of first stage
fft_even_stage2 = np.fft.fft(fft_even)
fft_odd_stage2 = np.fft.fft(fft_odd)
fft_mult3_stage2 = np.fft.fft(fft_mult3)
fft_mult4_stage2 = np.fft.fft(fft_mult4)

# Function to format FFT output into a table
def format_fft_table(label, fft_values):
    table = f"{label}\n"
    table += "Real Part\tImaginary Part\tReal Part (IEEE 754 Hex)\tImaginary Part (IEEE 754 Hex)\n"
    for val in fft_values:
        real_part = val.real
        imag_part = val.imag
        table += f"{real_part:.6f}\t{imag_part:.6f}\t{float_to_ieee754_hex(real_part)}\t{float_to_ieee754_hex(imag_part)}\n"
    return table

# Store first stage FFT results in a file
with open("fft_results_stage1.txt", "w") as f:
    f.write(format_fft_table("FFT of Even Numbers (Stage 1):", fft_even))
    f.write("\n")
    f.write(format_fft_table("FFT of Odd Numbers (Stage 1):", fft_odd))
    f.write("\n")
    f.write(format_fft_table("FFT of Multiples of 3 (Stage 1):", fft_mult3))
    f.write("\n")
    f.write(format_fft_table("FFT of Multiples of 4 (Stage 1):", fft_mult4))

# Store second stage FFT results in another file
with open("fft_results_stage2.txt", "w") as f:
    f.write(format_fft_table("FFT of Even Numbers (Stage 2):", fft_even_stage2))
    f.write("\n")
    f.write(format_fft_table("FFT of Odd Numbers (Stage 2):", fft_odd_stage2))
    f.write("\n")
    f.write(format_fft_table("FFT of Multiples of 3 (Stage 2):", fft_mult3_stage2))
    f.write("\n")
    f.write(format_fft_table("FFT of Multiples of 4 (Stage 2):", fft_mult4_stage2))

print("Formatted FFT results have been stored in fft_results_stage1.txt and fft_results_stage2.txt")