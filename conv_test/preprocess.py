#!/usr/bin/python3
from PIL import Image
import numpy as np


def preprocess_image(input_image_path, output_hex_path, block_size=8, start_address="@00022a5c"):
    # Step 1: Load the image and convert to grayscale
    image = Image.open(input_image_path).convert("L")
    image_array = np.array(image)
    print(f"Original Image Shape: {image_array.shape}")

    # Step 2: Pad the image to fit block size
    height, width = image_array.shape
    pad_height = (block_size - height % block_size) % block_size
    pad_width = (block_size - width % block_size) % block_size
    padded_image = np.pad(image_array, ((0, pad_height), (0, pad_width)), mode='constant')
    print(f"Padded Image Shape: {padded_image.shape}")

    # Step 3: Divide the image into blocks
    blocks = [
        padded_image[i:i+block_size, j:j+block_size]
        for i in range(0, padded_image.shape[0], block_size)
        for j in range(0, padded_image.shape[1], block_size)
    ]
    print(f"Number of Blocks: {len(blocks)}")

    # Step 4: Convert blocks to hex format and save to file
    with open(output_hex_path, "w") as f:
        # Write the starting address
        f.write(start_address + "\n")
        
        for block in blocks:
            block_flat = block.flatten()  # Flatten to a 1D array
            block_hex = " ".join(f"{val:02x}" for val in block_flat)  # Convert to hex
            f.write(block_hex + "\n")  # Write each block on a new line
    print(f"Hex data saved to {output_hex_path}")

    return padded_image, blocks


def validate_preprocessing(padded_image, blocks, block_size=8):
    # Reconstruct the padded image from blocks for validation
    reconstructed_image = np.zeros_like(padded_image)
    block_index = 0
    for i in range(0, padded_image.shape[0], block_size):
        for j in range(0, padded_image.shape[1], block_size):
            reconstructed_image[i:i+block_size, j:j+block_size] = blocks[block_index]
            block_index += 1

    # Save the reconstructed image for visual validation
    reconstructed_image_pil = Image.fromarray(reconstructed_image)
    reconstructed_image_pil.save("reconstructed_image.jpg")
    print("Reconstructed image saved as reconstructed_image.jpg")


if __name__ == "__main__":
    # Input and output paths
    input_image_path = "random.jpg"  # Input image path
    output_hex_path = "preprocessed_data.hex"  # Output hex file path

    # Preprocess the image
    padded_image, blocks = preprocess_image(input_image_path, output_hex_path)

    # Validate the preprocessing
    validate_preprocessing(padded_image, blocks)
