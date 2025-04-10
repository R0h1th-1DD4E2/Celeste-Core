% MATLAB script for 2D FFT processing with kernel multiplication
% Input: 64 complex values (1+1i) in an 8x8 matrix
% Process: FFT row, FFT column, multiply with kernel, IFFT column, IFFT row

% Initialize input matrix with 64 complex values of 1+1i
function main()
    % Create input matrix
    input_matrix = create_input_matrix();
    
    % Perform FFT row-wise
    fft_row_result = fft_row(input_matrix);
    
    % Perform FFT column-wise on the result
    fft_col_result = fft_col(fft_row_result);
    
    % Load the kernel
    kernel = load_kernel();
    
    % Multiply with kernel
    multiplied_result = multiplier(fft_col_result, kernel);
    
    % Perform IFFT column-wise
    ifft_col_result = ifft_col(multiplied_result);
    
    % Perform IFFT row-wise
    final_result = ifft_row(ifft_col_result);
    
    % Display the final result
    disp('Final result after 2D FFT, kernel multiplication, and 2D IFFT:');
    disp(final_result);
end

% Create input matrix with 64 elements of 1+1i
function matrix = create_input_matrix()
    matrix = zeros(8, 8, 'like', complex(0,0));
    for i = 1:8
        for j = 1:8
            matrix(i, j) = complex(1, 1); % 1+1i
        end
    end
    disp('Input matrix:');
    disp(matrix);
end

% Perform FFT on each row
function result = fft_row(matrix)
    result = zeros(size(matrix), 'like', complex(0,0));
    for i = 1:8
        result(i, :) = fft(matrix(i, :), 8);
    end
    disp('Result after FFT on rows:');
    disp(result);
end

% Perform FFT on each column
function result = fft_col(matrix)
    result = zeros(size(matrix), 'like', complex(0,0));
    for j = 1:8
        result(:, j) = fft(matrix(:, j), 8);
    end
    disp('Result after FFT on columns:');
    disp(result);
end

% Load kernel from IEEE 754 32-bit hexadecimal values
function kernel = load_kernel()
    % Initialize kernel as a complex matrix
    kernel = zeros(8, 8, 'like', complex(0,0));
    
    % Real part of kernel (ker_r0 to ker_r63)
    kernel_real_hex = {
        '3951b717', '399d4952', '3a03126f', '3b2a64c3', 'bc7765fe', '3b2a64c3', '3a03126f', '399d4952',
        '399d4952', '399d4952', '3a1d4952', '3b4b295f', 'bc91d14e', '3b4b295f', '3a1d4952', '399d4952',
        '3a03126f', '3a1d4952', '3a83126f', '3bb0f27c', 'bcfec56d', '3bb0f27c', '3a83126f', '3a1d4952',
        '3b2a64c3', '3b4b295f', '3bb0f27c', '3cf9db23', 'be32e48f', '3cf9db23', '3bb0f27c', '3b4b295f',
        'bc7765fe', 'bc91d14e', 'bcfec56d', 'be32e48f', '3f800000', 'be32e48f', 'bcfec56d', 'bc91d14e',
        '3b2a64c3', '3b4b295f', '3bb0f27c', '3cf9db23', 'be32e48f', '3cf9db23', '3bb0f27c', '3b4b295f',
        '3a03126f', '3a1d4952', '3a83126f', '3bb0f27c', 'bcfec56d', '3bb0f27c', '3a83126f', '3a1d4952',
        '399d4952', '399d4952', '3a1d4952', '3b4b295f', 'bc91d14e', '3b4b295f', '3a1d4952', '399d4952'
    };
    
    % Imaginary part of kernel (all zeros in this case)
    kernel_imag_hex = cell(8, 8);
    for i = 1:8
        for j = 1:8
            kernel_imag_hex{i, j} = '0';
        end
    end
    
    % Convert hexadecimal to floating-point values
    for i = 1:8
        for j = 1:8
            idx = (i-1)*8 + j;
            real_val = hex2float(kernel_real_hex{idx});
            imag_val = hex2float(kernel_imag_hex{i, j});
            kernel(i, j) = complex(real_val, imag_val);
        end
    end
    
    disp('Kernel matrix:');
    disp(kernel);
end

% Multiply the FFT result with the kernel element-wise
function result = multiplier(matrix, kernel)
    result = matrix .* kernel;
    disp('Result after multiplication with kernel:');
    disp(result);
end

% Perform IFFT on each column
function result = ifft_col(matrix)
    result = zeros(size(matrix), 'like', complex(0,0));
    for j = 1:8
        result(:, j) = ifft(matrix(:, j), 8);
    end
    disp('Result after IFFT on columns:');
    disp(result);
end

% Perform IFFT on each row
function result = ifft_row(matrix)
    result = zeros(size(matrix), 'like', complex(0,0));
    for i = 1:8
        result(i, :) = ifft(matrix(i, :), 8);
    end
    disp('Result after IFFT on rows:');
    disp(result);
end

% Helper function to convert IEEE 754 32-bit hexadecimal to float
function float_val = hex2float(hex_str)
    % Convert hex string to uint32
    int_val = hex2dec(hex_str);
    
    % Convert uint32 to single precision float using typecast
    float_val = typecast(uint32(int_val), 'single');
end

% Run the main function
main();
