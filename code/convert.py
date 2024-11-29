#!/usr/bin/python3
import argparse
from PIL import Image
import numpy as np

def image_to_file(input_image_path, output_file_path, width=240):
    """
    Converts an image to a grayscale text file with pixel values.
    """
    img = Image.open(input_image_path).convert('L')  # Convert to grayscale
    aspect_ratio = img.height / img.width
    height = int(width * aspect_ratio)
    img = img.resize((width, height))
    
    pixel_values = np.array(img, dtype=np.uint8)
    img.save("resized_image.png") 
    
    with open(output_file_path, 'w') as f:
        # Write the width and height as the first line
        f.write(f"{width} {height}\n")  # Added this line to store dimensions
        
        # Write the pixel values
        for row in pixel_values:
            f.write(" ".join(map(str, row)) + "\n")

    print(f"Converted image to file: {output_file_path}")

def file_to_image(input_file_path, output_image_path):
    """
    Converts a grayscale text file with pixel values back into an image.
    """
    with open(input_file_path, 'r') as f:
        data = f.readlines()

    # Extract width and height from the first line
    width, height = map(int, data[0].split())  # This line was missing in your original code
    
    # Initialize an empty list to store the pixel values
    pixel_values = []
    
    # Read pixel values from subsequent lines
    for line in data[1:]:
        # Skip empty lines
        if not line.strip():
            continue
        
        pixel_values.append(list(map(int, line.split())))
    
    # Check if the number of rows and columns are correct
    if len(pixel_values) != height:
        raise ValueError(f"Mismatch in height: expected {height}, got {len(pixel_values)}")
    if any(len(row) != width for row in pixel_values):
        raise ValueError(f"Mismatch in width: each row should have {width} values.")
    
    # Convert the list of pixel values to a numpy array
    pixel_values = np.array(pixel_values, dtype=np.uint8)
    
    # Create an image from the pixel array
    img = Image.fromarray(pixel_values, 'L')
    img.save(output_image_path)
    print(f"Converted file to image: {output_image_path}")


def main():
    parser = argparse.ArgumentParser(description="Convert images to grayscale values file or vice versa.")
    subparsers = parser.add_subparsers(dest="command", help="Choose an operation: 'image_to_file' or 'file_to_image'.")

    # Subcommand: image_to_file
    parser_img_to_file = subparsers.add_parser("image_to_file", help="Convert an image to a grayscale text file.")
    parser_img_to_file.add_argument("input_image", help="Path to the input image file.")
    parser_img_to_file.add_argument("output_file", help="Path to the output text file.")
    parser_img_to_file.add_argument("--width", type=int, default=240, help="Width to resize the image (default: 240).")

    # Subcommand: file_to_image
    parser_file_to_img = subparsers.add_parser("file_to_image", help="Convert a grayscale text file to an image.")
    parser_file_to_img.add_argument("input_file", help="Path to the input text file.")
    parser_file_to_img.add_argument("output_image", help="Path to the output image file.")

    args = parser.parse_args()

    if args.command == "image_to_file":
        image_to_file(args.input_image, args.output_file, args.width)
    elif args.command == "file_to_image":
        file_to_image(args.input_file, args.output_image)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
