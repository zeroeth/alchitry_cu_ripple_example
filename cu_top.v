module cu_top(
    input clk,
    input rst_n,
    output[7:0] led,
    input usb_rx,
    output usb_tx
    );

    wire rst;

    reset_conditioner reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));

    assign usb_tx = usb_rx;


    /* Your below code here */

    reg slow_clock;

    blinker my_blinker (
      .clk(clk),
      .rst(rst),
      .blink(slow_clock)
    );

    assign led[0] = slow_clock;

    clock_ripple my_clock (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2(led[1]),
      .clk_div4(led[2]),
      .clk_div8(led[3]),
      .clk_div16(led[4]),
      .clk_div32(led[5]),
      .clk_div64(led[6]),
      .clk_div128(led[7]),
    );

endmodule
