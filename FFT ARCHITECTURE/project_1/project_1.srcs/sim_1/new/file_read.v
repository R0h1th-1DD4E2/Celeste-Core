`timescale 1ns / 1ps

module file_read;
    integer input_mem, output_mem;
    string line;
    string comment_identifier = "//";
    string check_comment;
    integer pixel,comment,char_count;
    integer line_no = 0;

    integer img_height,img_width;
    integer chunk_in_x, chunk_in_y;
    integer pixel_count;
    integer chunkx, chunky;

    integer struct_count;

    integer chunk_position[2];
    integer chunk_data[8][8];

    integer i = 0, j= 0;

    typedef struct {
        integer chunk_position[2];
        integer chunk_data[8][8];
    } chunk_block_struct;

    chunk_block_struct chunk_block[8100]; // chunk_in_x*chunk_in_y

    integer b = 8099;

    initial begin
        input_mem = $fopen("data.mem", "r");

        if (input_mem) begin
            $display("Opening input_mem file: %0d", input_mem);
            $fgets(line,input_mem);
            $display("Reading line : %s", line);
        end

        while (!$feof(input_mem)) begin
            char_count = $fgets(line, input_mem);
            check_comment = line.substr(0,1);
            // $display ("char count : %d", char_count);
            if (char_count == 9 && check_comment.compare(comment_identifier)) begin
//                $display("Inside chunk data");
                chunk_block[struct_count].chunk_data[i][j] = line.atohex();
                j += 1;
                if (j == 8) begin
                    j = 0;
                    i += 1;
                end 
            end
            else if (char_count > 3) begin
                
                if (!check_comment.compare(comment_identifier)) begin
//                    $display("Found comment \n %s",line);
                    if ($sscanf(line, "// Dimensions: %0dx%0d", img_height, img_width) == 2) begin
                        $display("Found Image meta data \n Height: %d, Width: %d", img_height, img_width);
                    end
                    else if ($sscanf(line, "// Chunks: %0dx%0d", chunk_in_x, chunk_in_y) == 2) begin
                        $display("Found Chunk count \n Height: %d, Width: %d", chunk_in_x, chunk_in_y);
                    end

                    else if ($sscanf(line, "// Total pixels: %0d", pixel_count) == 1) begin
                        $display("Found pixel count \n No. of pixel: %d", pixel_count);
                    end

                    else if ($sscanf(line, "// Chunk at position (%0d, %0d)", chunkx, chunky) == 2) begin
                        $display("Currently in \n Chunk x : %d, Chunk y :", chunkx, chunky);
                        struct_count = (chunkx == 0 && chunky == 0) ? 0: struct_count + 1;
                        i = 0;
                        j = 0;
                        chunk_block[struct_count].chunk_position[0] = chunkx;
                        chunk_block[struct_count].chunk_position[1] = chunky;
                    end
                    else
                        $display("Found comment of other form\n %s",line);
                end
            end
            else
                continue;
        end

        $fclose(input_mem);

        $display("Block %0d - Coords: %0d, %0d", b,
                 chunk_block[b].chunk_position[0],
                 chunk_block[b].chunk_position[1]);
        for (int i = 0; i < 8; i++) begin
            for (int j = 0; j < 8; j++) begin
                $display("%h ", chunk_block[b].chunk_data[i][j]);
            end
            $display("\n");
        end
    end
endmodule
