module URT_TOP #(parameter DATA_SIZE =8 , PRESCALE_WIDTH =5) (
input     wire                         CLK_TX,
input     wire  [7:0]                  P_DATA_TX,        
input     wire                         TX_Valid_IN,

output    wire                         TX_Valid_OUT,
output    wire                         TX_OUT,


input     wire                         CLK_RX,
input     wire                         RX_IN,
input     wire  [PRESCALE_WIDTH-1:0]   Prescale,

output    wire  [7:0]                  P_DATA_RX,        
output    wire                         RX_Valid,


input     wire                         RST,
input     wire                         PAR_EN,
input     wire                         PAR_TYP,
output    wire                         PAR_ERR
);

TOP_uart_tx 
#(
    .DATA_SIZE_top (DATA_SIZE )
)
u_TOP_uart_tx(
    .CLK_top        (CLK_TX         ),
    .RST_top        (RST            ),
    .P_DATA_top     (P_DATA_TX      ),
    .Data_Valid_top (TX_Valid_IN    ),
    .PAR_EN_top     (PAR_EN         ),
    .PAR_TYP_top    (PAR_TYP        ),
    .TX_OUT_top     (TX_OUT         ),
    .Busy_top       (TX_Valid_OUT   )
);

TOP_URT_RX u_TOP_URT_RX(
    .CLK_TOP        (CLK_RX     ),
    .RST_TOP        (RST        ),
    .RX_IN_TOP      (RX_IN      ),
    .PAR_EN_TOP     (PAR_EN     ),
    .PAR_TYP_TOP    (PAR_TYP    ),
    .Prescale_TOP   (Prescale   ),
    .P_DATA_TOP     (P_DATA_RX  ),
    .data_valid_TOP (RX_Valid   )
);

endmodule
