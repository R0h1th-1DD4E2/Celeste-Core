#!/usr/bin/python3

import numpy as np
from PIL import Image
import re
import argparse

def mem_to_image(input_file, output_file, width=None, height=None):
    """
    Convert a memory file (.mem or .coe) back to an image
    
    Args:
        input_file: Path to the input memory file
        output_file: Path to save the output image
        width: Width of the image (if None, will try to detect from metadata)
        height: Height of the image (if None, will try to detect from metadata)
    """
    # Read the file
    with open(input_file, 'r') as f:
        content = f.read()
    
    # Try to detect format
    is_coe = 'memory_initialization_vector' in content
    
    # Try to extract dimensions from metadata if not provided
    if width is None or height is None:
        # Look for dimensions in comments
        dimensions_match = re.search(r'[;/]\s*Dimensions:\s*(\d+)x(\d+)', content)
        if dimensions_match:
            detected_width = int(dimensions_match.group(1))
            detected_height = int(dimensions_match.group(2))
            width = width or detected_width
            height = height or detected_height
        
        # If still not found, look for number of chunks
        if width is None or height is None:
            chunks_match = re.search(r'[;/]\s*Chunks:\s*(\d+)x(\d+)', content)
            if chunks_match:
                chunks_x = int(chunks_match.group(1))
                chunks_y = int(chunks_match.group(2))
                width = width or (chunks_x * 8)
                height = height or (chunks_y * 8)
    
    # Extract pixel values
    pixel_values = []
    
    if is_coe:
    # For COE format
    # Find the pixel data part
        vector_start = content.find('memory_initialization_vector=')
        if vector_start != -1:
            vector_data = content[vector_start + len('memory_initialization_vector='):].strip()
        
        # Remove comments (anything after semicolon on each line)
            cleaned_data = ""
            for line in vector_data.split('\n'):
                comment_pos = line.find(';')
                if comment_pos != -1:
                    line = line[:comment_pos]
                cleaned_data += line + " "
            
        # Remove the trailing semicolon if present
            if cleaned_data.endswith(';'):
                cleaned_data = cleaned_data[:-1]
        
        # Split by commas and convert to integers
            hex_values = [x.strip() for x in cleaned_data.split(',')]
            pixel_values = [int(x, 16) for x in hex_values if x.strip()]
    else:
        # For MEM format
        # Extract all hex values (ignoring comments)
        hex_pattern = re.compile(r'^([0-9a-fA-F]{1,2})$', re.MULTILINE)
        hex_matches = hex_pattern.findall(content)
        pixel_values = [int(x, 16) for x in hex_matches]
    
    # If dimensions still not determined, try to make a square image
    if width is None or height is None:
        # Calculate dimensions for a square image
        img_size = int(np.sqrt(len(pixel_values)))
        width = width or img_size
        height = height or img_size
    
    # Ensure dimensions are valid
    if width <= 0 or height <= 0:
        raise ValueError("Invalid image dimensions. Please specify width and height manually.")
    
    # Create image array
    img_array = np.zeros((height, width), dtype=np.uint8)
    
    # Determine chunk arrangement
    chunks_x = (width + 7) // 8
    chunks_y = (height + 7) // 8
    
    # Fill the image with pixel values
    pixel_index = 0
    
    for y in range(0, chunks_y):
        for x in range(0, chunks_x):
            # Each chunk is 8x8
            for i in range(8):
                for j in range(8):
                    # Calculate position in the image
                    img_y = y * 8 + i
                    img_x = x * 8 + j
                    
                    # Skip if outside the image dimensions
                    if img_y >= height or img_x >= width:
                        continue
                    
                    # Get pixel value if available
                    if pixel_index < len(pixel_values):
                        img_array[img_y, img_x] = pixel_values[pixel_index]
                        pixel_index += 1
    
    # Create and save the image
    img = Image.fromarray(img_array)
    img.save(output_file)
    print(f"Image reconstructed and saved to {output_file}")
    return img

def flatten_pixel_data(input_file, output_file):
    """
    Parse a file with 8x8 pixel chunks and create a flattened memory file
    
    Args:
        input_file: Path to the input file with pixel chunk data
        output_file: Path to save the output memory file
    """
    with open(input_file, 'r') as f:
        content = f.read()
    
    # Extract pixel values (assuming format like your example)
    pixel_values = []
    
    # Look for pixel values in matrices
    matrices = re.findall(r'(\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s+\d+\s*\n){8}', content)
    
    for matrix in matrices:
        # Split into rows
        rows = matrix.strip().split('\n')
        for row in rows:
            # Extract numbers from each row
            values = re.findall(r'\d+', row)
            pixel_values.extend([int(v) for v in values])
    
    # If no matrices found, try to extract from the flattened format
    if not pixel_values:
        # Extract all individual numbers
        values = re.findall(r'\b\d+\b', content)
        pixel_values = [int(v) for v in values]
    
    # Write to mem file format
    with open(output_file, 'w') as f:
        for pixel in pixel_values:
            f.write(f"{pixel:02x}\n")
    
    print(f"Flattened pixel data saved to {output_file}")
    return pixel_values

def main():
    parser = argparse.ArgumentParser(description='Convert memory files to images and vice versa')
    subparsers = parser.add_subparsers(dest='command', help='Command to run')
    
    # Parser for mem-to-image command
    mem_parser = subparsers.add_parser('mem-to-image', help='Convert a memory file to an image')
    mem_parser.add_argument('input_file', help='Input memory file (.mem or .coe)')
    mem_parser.add_argument('--output', '-o', default='output_image.png', help='Output image filename')
    mem_parser.add_argument('--width', '-w', type=int, help='Image width (optional if in metadata)')
    mem_parser.add_argument('--height', '-he', type=int, help='Image height (optional if in metadata)')
    
    # Parser for flatten command
    flatten_parser = subparsers.add_parser('flatten', help='Flatten pixel chunk data to memory file')
    flatten_parser.add_argument('input_file', help='Input file with pixel chunk data')
    flatten_parser.add_argument('--output', '-o', default='flattened.mem', help='Output memory file')
    
    args = parser.parse_args()
    
    if args.command == 'mem-to-image':
        mem_to_image(args.input_file, args.output, args.width, args.height)
    elif args.command == 'flatten':
        flatten_pixel_data(args.input_file, args.output)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
