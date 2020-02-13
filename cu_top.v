module cu_top(
    input clk,
    input rst_n,
    output[7:0] led,

    input  usb_rx,
    output usb_tx,

    /* IO Shield outputs */
    output[7:0] io_led_0,
    output[7:0] io_led_1,
    output[7:0] io_led_2,

    output[3:0] io_led_segment_sel,
    output[7:0] io_led_segment,
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

    clock_ripple my_clock (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (led[0]),
      .clk_div4  (led[1]),
      .clk_div8  (led[2]),
      .clk_div16 (led[3]),
      .clk_div32 (led[4]),
      .clk_div64 (led[5]),
      .clk_div128(led[6]),
      .clk_div256(led[7]),
    );


    /* Section below for IO shield */

    clock_ripple my_clock_io0 (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (io_led_0[0]),
      .clk_div4  (io_led_0[1]),
      .clk_div8  (io_led_0[2]),
      .clk_div16 (io_led_0[3]),
      .clk_div32 (io_led_0[4]),
      .clk_div64 (io_led_0[5]),
      .clk_div128(io_led_0[6]),
      .clk_div256(io_led_0[7]),
    );

    clock_ripple my_clock_io1 (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (io_led_1[0]),
      .clk_div4  (io_led_1[1]),
      .clk_div8  (io_led_1[2]),
      .clk_div16 (io_led_1[3]),
      .clk_div32 (io_led_1[4]),
      .clk_div64 (io_led_1[5]),
      .clk_div128(io_led_1[6]),
      .clk_div256(io_led_1[7]),
    );

    clock_ripple my_clock_io2 (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (io_led_2[0]),
      .clk_div4  (io_led_2[1]),
      .clk_div8  (io_led_2[2]),
      .clk_div16 (io_led_2[3]),
      .clk_div32 (io_led_2[4]),
      .clk_div64 (io_led_2[5]),
      .clk_div128(io_led_2[6]),
      .clk_div256(io_led_2[7]),
    );

    clock_ripple my_clock_io_seg (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (io_led_segment[7]),
      .clk_div4  (io_led_segment[0]),
      .clk_div8  (io_led_segment[1]),
      .clk_div16 (io_led_segment[2]),
      .clk_div32 (io_led_segment[3]),
      .clk_div64 (io_led_segment[4]),
      .clk_div128(io_led_segment[5]),
      .clk_div256(io_led_segment[6]),
    );

    clock_ripple my_clock_io_seg_sel (
      .clk(slow_clock),
      .reset(rst),
      .clk_div2  (io_led_segment_sel[0]),
      .clk_div4  (io_led_segment_sel[1]),
      .clk_div8  (io_led_segment_sel[2]),
      .clk_div16 (io_led_segment_sel[3]),
    );

endmodule
