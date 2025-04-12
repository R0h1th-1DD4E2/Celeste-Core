`timescale 1ns / 1ps

module i_o_mem;

  // File handles
  integer input_file, output_file;
  integer scan_file, status;
  
  // Parameters for image dimensions - will be updated from file comments
  integer IMG_WIDTH = 0;
  integer IMG_HEIGHT = 0;
  integer TOTAL_PIXELS = 0;
  parameter int MATRIX_SIZE = 8;
  integer CHUNK_SIZE = 0;
  
  // Storage for 8x8 matrices
  reg [7:0] input_matrix [0:MATRIX_SIZE-1][0:MATRIX_SIZE-1];
  reg [7:0] output_matrix [0:MATRIX_SIZE-1][0:MATRIX_SIZE-1];
  
  // Counters and buffers
  integer i, j, pixel_count, line_count;
  integer row_idx, col_idx, matrix_row, matrix_col;
  integer matrices_processed;
  reg [7:0] pixel_value;
  
  // For reading lines and parsing comments
  reg [8*100:1] line_buffer;
  reg in_chunk;
  integer chunk_x, chunk_y;
  integer pixel_row, pixel_col;
  
  initial begin
    // Open input and output files
    input_file = $fopen("data.mem", "r");
    output_file = $fopen("processed_image.mem", "w");
    
    if (input_file == 0 || output_file == 0) begin
      $display("Error opening files!");
      $finish;
    end
    
    // First pass: Read metadata from comments
    while ($fgets(line_buffer, input_file) != 0) begin
      // Check if line is a comment with dimension info
      if (line_buffer[8*100:8*93] == "// Dimen") begin
        // Parse the dimensions from "// Dimensions: WxH"
        scan_file = $sscanf(line_buffer, "// Dimensions: %dx%d", IMG_WIDTH, IMG_HEIGHT);
        if (scan_file == 2) begin
          $display("Found image dimensions: %dx%d", IMG_WIDTH, IMG_HEIGHT);
          TOTAL_PIXELS = IMG_WIDTH * IMG_HEIGHT;
        end
      end
      
      if (line_buffer[8*100:8*93] == "// Chunk") begin
        // Parse chunk size if present
        scan_file = $sscanf(line_buffer, "// Chunks: %dx%d", CHUNK_SIZE, CHUNK_SIZE);
        if (scan_file == 2) begin
          $display("Found chunk size: %dx%d", CHUNK_SIZE, CHUNK_SIZE);
        end
      end
      
      // Break once we have all needed metadata
      if (IMG_WIDTH > 0 && IMG_HEIGHT > 0 && CHUNK_SIZE > 0) begin
        break;
      end
    end
    
    // Check if we got the dimensions
    if (IMG_WIDTH == 0 || IMG_HEIGHT == 0) begin
      $display("Error: Could not find image dimensions in comments!");
      $finish;
    end
    
    // Reset file position to beginning for second pass
    $fseek(input_file, 0, 0);
    
    // Second pass: Process chunks of data
    in_chunk = 0;
    matrices_processed = 0;
    line_count = 0;
    
    while ($fgets(line_buffer, input_file) != 0) begin
      line_count++;
      
      // Check if line is a chunk marker
      if (line_buffer[8*100:8*93] == "// Chunk") begin
        // Extract chunk position
        scan_file = $sscanf(line_buffer, "// Chunk at position (%d, %d)", chunk_x, chunk_y);
        if (scan_file == 2) begin
          $display("Processing chunk at position (%0d, %0d)", chunk_x, chunk_y);
          in_chunk = 1;
          pixel_row = 0;
          pixel_col = 0;
          
          // Clear the input matrix for safety
          for (i = 0; i < MATRIX_SIZE; i++) begin
            for (j = 0; j < MATRIX_SIZE; j++) begin
              input_matrix[i][j] = 0;
            end
          end
        end
        continue;  // Skip to next line
      end
      
      // Process pixel data if we're in a chunk
      if (in_chunk) begin
        // Skip empty lines
        if (line_buffer[8*100:8*99] == 0 || line_buffer[8*100:8*99] == "\n") begin
          continue;
        end
        
        // Check if it's a comment line (possible end of chunk)
        if (line_buffer[8*100:8*99] == "//") begin
          // End of chunk, process the matrix
          if (pixel_row > 0) begin  // Make sure we've read some data
            // Process the matrix (here we just copy from input to output)
            // This is where you would implement your actual processing logic
            for (i = 0; i < MATRIX_SIZE; i++) begin
              for (j = 0; j < MATRIX_SIZE; j++) begin
                output_matrix[i][j] = input_matrix[i][j];
              end
            end
            
            // Print the processed matrix for debugging
            $display("Processed matrix #%0d (at position %0d, %0d):", matrices_processed, chunk_x, chunk_y);
            for (i = 0; i < MATRIX_SIZE; i++) begin
              $write("Row %0d: ", i);
              for (j = 0; j < MATRIX_SIZE; j++) begin
                $write("%h ", output_matrix[i][j]);
              end
              $write("\n");
            end
            
            // Write the processed matrix to output file
            for (i = 0; i < MATRIX_SIZE; i++) begin
              for (j = 0; j < MATRIX_SIZE; j++) begin
                $fwrite(output_file, "%h\n", output_matrix[i][j]);
              end
            end
            
            matrices_processed++;
          end
          
          in_chunk = 0;  // No longer in a chunk
          continue;
        end
        
        // Parse pixel value (assuming one hex value per line)
        scan_file = $sscanf(line_buffer, "%h", pixel_value);
        if (scan_file == 1) begin
          // Store pixel in current matrix if we have room
          if (pixel_row < MATRIX_SIZE && pixel_col < MATRIX_SIZE) begin
            input_matrix[pixel_row][pixel_col] = pixel_value;
          end
          
          // Move to next position
          pixel_col++;
          if (pixel_col >= MATRIX_SIZE) begin
            pixel_col = 0;
            pixel_row++;
          end
          
          // If we've filled an 8x8 matrix, process it
          if (pixel_row >= MATRIX_SIZE) begin
            // Process the 8x8 block immediately
            // (Same processing code as above)
            for (i = 0; i < MATRIX_SIZE; i++) begin
              for (j = 0; j < MATRIX_SIZE; j++) begin
                output_matrix[i][j] = input_matrix[i][j];
              end
            end
            
            // Write to output file
            for (i = 0; i < MATRIX_SIZE; i++) begin
              for (j = 0; j < MATRIX_SIZE; j++) begin
                $fwrite(output_file, "%h\n", output_matrix[i][j]);
              end
            end
            
            matrices_processed++;
            
            // Reset for next matrix within the chunk
            pixel_row = 0;
            pixel_col = 0;
          end
        end
      end
    end
    
    // Close files
    $fclose(input_file);
    $fclose(output_file);
    
    $display("Processing complete. Processed %0d matrices.", matrices_processed);
    $finish;
  end
endmodule