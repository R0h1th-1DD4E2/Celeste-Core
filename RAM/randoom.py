import random

def generate_random_hex(num_values, output_file):
    """
    Generate random 32-bit hex values and save them to a file.
    
    Args:
        num_values (int): Number of hex values to generate
        output_file (str): Path to output file
    """
    try:
        with open(output_file, 'w') as f:
            for _ in range(num_values):
                # Generate random 32-bit value
                random_value = random.randint(0, 0xFFFFFFFF)
                # Convert to hex string, ensuring 8 digits (32 bits)
                hex_value = f"{random_value:08x}"
                # Write to file with newline
                f.write(hex_value + '\n')
                # Print for verification
                print(f"Generated: {hex_value}")
        
        print(f"\nSuccessfully generated {num_values} hex values")
        print(f"Output saved to {output_file}")
        
    except Exception as e:
        print(f"Error generating hex values: {str(e)}")

# Generate 10 random hex values and save to ram_init.hex
if __name__ == "__main__":
    # Set random seed for reproducibility (optional)
    random.seed(42)
    
    # Generate 10 values
    generate_random_hex(8000, "ram_test.hex")