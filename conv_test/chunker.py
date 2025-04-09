#!/usr/bin/python3

import numpy as np
from PIL import Image
import os
import math

def process_image_to_chunks(image_path, output_file):
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
    
    # Open output file for writing
    with open(output_file, 'w') as f:
        f.write("// Grayscale 8x8 chunks for Verilog testbench\n")
        f.write(f"// Generated from image: {os.path.basename(image_path)}\n")
        f.write(f"// Original dimensions: {width}x{height}\n")
        f.write(f"// Total chunks: {chunks_x * chunks_y} ({chunks_x}x{chunks_y})\n\n")
        
        chunk_count = 0
        for y in range(0, padded_height, 8):
            for x in range(0, padded_width, 8):
                # Extract the 8x8 chunk
                chunk = padded_array[y:y+8, x:x+8]
                
                # Write chunk header
                f.write(f"// Chunk {chunk_count} (position: row {y//8}, col {x//8})\n")
                
                # Format for Verilog: declare a 2D array
                f.write(f"reg [7:0] pixel_data_{chunk_count} [0:7][0:7] = {{\\n") 
                # Write each row of the chunk
                for row_idx in range(8):
                    row = chunk[row_idx]
                    f.write("    {")
                    f.write(", ".join([f"8'd{pixel}" for pixel in row]))
                    f.write(f"}}{',' if row_idx < 7 else ''}\n")
                
                f.write("};\n\n")
                chunk_count += 1
        
        # Add a summary of all chunks in a flattened format (alternative format)
        f.write("// Alternative format - all pixels in a flattened array\n")
        f.write("// Format: reg [7:0] all_pixels [0:total_pixels-1] = {\n")
        
        all_pixels = []
        for y in range(0, padded_height, 8):
            for x in range(0, padded_width, 8):
                chunk = padded_array[y:y+8, x:x+8]
                for row in chunk:
                    for pixel in row:
                        all_pixels.append(str(pixel))
        
        # Print the total number of pixels
        f.write(f"// Total pixel count: {len(all_pixels)}\n\n")
        
        # Break the pixels into groups of 16 for readability
        pixel_lines = []
        for i in range(0, len(all_pixels), 16):
            line = ", ".join([f"8'd{p}" for p in all_pixels[i:i+16]])
            pixel_lines.append(line)
        
        f.write("/*\nreg [7:0] all_pixels [0:%d] = {\n" % (len(all_pixels)-1))
        for i, line in enumerate(pixel_lines):
            f.write(f"    {line}{'' if i == len(pixel_lines)-1 else ','}\n")
        f.write("};\n*/\n")

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Convert an image to 8x8 grayscale chunks for Verilog testbench')
    parser.add_argument('image_path', type=str, help='Path to the input image')
    parser.add_argument('--output', '-o', type=str, default='verilog_image_data.v', help='Output file name')
    
    args = parser.parse_args()
    
    process_image_to_chunks(args.image_path, args.output)
    print(f"Processed {args.image_path} and saved to {args.output}")
