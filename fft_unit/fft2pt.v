module fft2pt #(parameter N = 16) (
    input clk,
    input signed [N-1:0] x0_real, x0_imag, x1_real, x1_imag,
    input signed [N-1:0] twiddle_real, twiddle_imag,  // Twiddle factors
    output reg signed [N-1:0] X0_real, X0_imag, X1_real, X1_imag
);
    always @(posedge clk) begin
        // // Perform the 2-point DFT
        // X0_real = x0_real + x1_real;
        // X0_imag = x0_imag + x1_imag;
        // X1_real = x0_real - x1_real;
        // X1_imag = x0_imag - x1_imag;

        // // Apply twiddle factor for the second output
        // X1_real = (X1_real * twiddle_real - X1_imag * twiddle_imag);
        // X1_imag = (X1_real * twiddle_imag + X1_imag * twiddle_real);


        // X0_real = (x0_real +(x1_real * twiddle_real));
        // X0_imag = x1;

        // X1_real = (x0_real-(x1_real*twiddle_real));
        // X1_imag = (x0_imag-(x1_imag*twiddle_imag));
        X0_real=(x0_real+(x1_real*twiddle_real)-(x1_imag*twiddle_imag));
        X0_imag=(x0_imag+(x1_real*twiddle_imag)+(x1_imag*twiddle_real));
        
        X1_real=(x0_real-(x1_real*twiddle_real)+(x1_imag*twiddle_imag));
        X1_imag=(x0_imag-(x1_real*twiddle_imag)-(x1_imag*twiddle_real));
        
       
    end
endmodule
 