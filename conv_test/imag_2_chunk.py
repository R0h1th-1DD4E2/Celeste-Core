#!/usr/bin/python3

import numpy as np
from PIL import Image
import os
import math
import argparse
import struct

def ieee754_hex(value):
    try:
        # Convert to float in case input is int
        float_val = float(value)

        # Pack float into 4 bytes (32-bit), then unpack as unsigned int
        packed = struct.pack('>f', float_val)
        ieee754_32bit_int = struct.unpack('>I', packed)[0]

        # Format as hex (8 digits, zero-padded)
        ieee754_hex = f'{ieee754_32bit_int:08X}'  # Uppercase hex

        return ieee754_hex
    except Exception as e:
        return f"Error: {e}"

def process_image_to_mem(image_path, output_file, format_type='mem'):
    """
    Convert an image to a memory file format suitable for Verilog.
    
    Args:
        image_path: Path to the input image
        output_file: Path to the output memory file
        format_type: 'mem' for simple hex format or 'coe' for Xilinx COE format
    """
    # Open the image and convert to grayscale
    img = Image.open(image_path).convert('L')
    
    # Get image dimensions
    width, height = img.size
    
    # Convert image to numpy array
    img_array = np.array(img)
    
    # Calculate how many complete 8x8 chunks we can get
    chunks_x = math.ceil(width / 8)
    chunks_y = math.ceil(height / 8)
    
    # Create a padded array if needed (to ensure full 8x8 blocks)
    padded_height = chunks_y * 8
    padded_width = chunks_x * 8
    
    # Create a padded array filled with zeros
    padded_array = np.zeros((padded_height, padded_width), dtype=np.uint8)
    
    # Copy original image data into padded array
    padded_array[:height, :width] = img_array
    
    # Prepare output format
    if format_type == 'coe':
        with open(output_file, 'w') as f:
            # COE file header
            f.write("memory_initialization_radix=16;\n")
            f.write("memory_initialization_vector=\n")
            
            # Write metadata as comments
            f.write(f"; Image: {os.path.basename(image_path)}\n")
            f.write(f"; Dimensions: {width}x{height}\n")
            f.write(f"; Chunks: {chunks_x}x{chunks_y}\n")
            
            pixel_values = []
            # Process each 8x8 chunk
            for y in range(0, padded_height, 8):
                for x in range(0, padded_width, 8):
                    chunk = padded_array[y:y+8, x:x+8]
                    # Linearize the chunk row by row
                    for row in chunk:
                        for pixel in row:
                            # pixel_values.append(f"{pixel:02x}")
                            pixel_values.append(ieee754_hex(pixel))
            
            # Join all values with commas, last one with semicolon
            for i, value in enumerate(pixel_values):
                if i == len(pixel_values) - 1:
                    f.write(f"{value};")
                else:
                    f.write(f"{value},")
                    # Add newline every 16 values for readability
                    if (i + 1) % 16 == 0:
                        f.write("\n")
    
    else:  # Simple .mem format
        with open(output_file, 'w') as f:
            # Write metadata as comments
            f.write(f"// Image: {os.path.basename(image_path)}\n")
            f.write(f"// Dimensions: {width}x{height}\n")
            f.write(f"// Chunks: {chunks_x}x{chunks_y}\n")
            f.write(f"// Total pixels: {padded_width * padded_height}\n\n")
            
            # Format options
            f.write("// Format: one pixel per line (8-bit hex value)\n")
            
            # Process each 8x8 chunk
            for y in range(0, padded_height, 8):
                for x in range(0, padded_width, 8):
                    f.write(f"// Chunk at position ({y//8}, {x//8})\n")
                    chunk = padded_array[y:y+8, x:x+8]
                    # Linearize the chunk row by row
                    for row_idx, row in enumerate(chunk):
                        for col_idx, pixel in enumerate(row):
                            # f.write(f"{pixel:02x}\n")
                            f.write(f"{ieee754_hex(pixel)}\n")

def main():
    parser = argparse.ArgumentParser(description='Convert an image to a memory file for Verilog')
    parser.add_argument('image_path', help='Path to the input image')
    parser.add_argument('--output', '-o', default='image_data.mem', help='Output memory file')
    parser.add_argument('--format', '-f', choices=['mem', 'coe'], default='mem', 
                        help='Output format: "mem" for simple hex format or "coe" for Xilinx COE format')
    
    args = parser.parse_args()
    
    if args.format == 'mem':
        output_file = args.output
    else:
        output_file = args.output.replace('.mem', '.coe')

    process_image_to_mem(args.image_path, output_file, args.format)
    print(f"Processed {args.image_path} and saved to {output_file}")

if __name__ == "__main__":
    main()
