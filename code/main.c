#include <stdio.h>

#define IMAGE_WIDTH 240
#define IMAGE_HEIGHT 135

/* Image data is mapped to a specific memory region defined in the linker script */
__attribute__((section(".image_data")))
volatile unsigned char image_data[IMAGE_HEIGHT][IMAGE_WIDTH];

/* Process the image data by inverting the pixel values */
void process_image() {
    printf("Processing image...\n");
    for (int y = 0; y < IMAGE_HEIGHT; y++) {
        for (int x = 0; x < IMAGE_WIDTH; x++) {
            unsigned char pixel = image_data[y][x];
            // Invert the pixel value
            image_data[y][x] = 255 - pixel;
        }
    }
    printf("Image processing completed.\n");
}

/* Display the processed image for debugging */
void display_image() {
    printf("Processed Image:\n");
    for (int y = 0; y < IMAGE_HEIGHT; y++) {
        for (int x = 0; x < IMAGE_WIDTH; x++) {
            printf("%3d ", image_data[y][x]);
        }
        printf("\n");
    }
}

int main() {
    printf("Starting program...\n");

    /* Simulate processing of the image loaded into memory */
    process_image();

    /* Optionally display the image (useful for debugging in simulation) */
    display_image();

    printf("Program finished.\n");
    return 0;
}

