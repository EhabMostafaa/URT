module EDGE_BIT_COUNT_URT_RX (
  input      wire        CLK_edge_bit,
  input      wire        RST_edge_bit,
  input      wire [4:0]  Prescale_edge_bit,
  input      wire        enable_edge_bit,

  output     reg  [3:0]  bit_cnt_edge_bit,
  output     reg  [3:0]  edge_cnt_edge_bit    
);

always @(posedge CLK_edge_bit or negedge RST_edge_bit )
 begin
   if(!RST_edge_bit)
       begin 
          bit_cnt_edge_bit<='b0;
          edge_cnt_edge_bit<='b0;
        end
   else if(enable_edge_bit)
         begin

    if(Prescale_edge_bit=='d8)       // Prescale 8
            begin
          if((edge_cnt_edge_bit==4'b111))
             begin
          bit_cnt_edge_bit<=bit_cnt_edge_bit+1;
          edge_cnt_edge_bit<='b0;
             end
          else
             begin
          bit_cnt_edge_bit<=bit_cnt_edge_bit;
          edge_cnt_edge_bit<=edge_cnt_edge_bit+1; 
             end   
            end

     else if(Prescale_edge_bit=='d16)     //prescale 16
            begin
              if((edge_cnt_edge_bit==4'b1111))
                begin
                   bit_cnt_edge_bit<=bit_cnt_edge_bit+1;
                   edge_cnt_edge_bit<='b0;
                 end
              else
                  begin
                   bit_cnt_edge_bit<=bit_cnt_edge_bit;
                   edge_cnt_edge_bit<=edge_cnt_edge_bit+1; 
                  end    
            end
          end  
    
    else
          begin
          bit_cnt_edge_bit<='b0;
          edge_cnt_edge_bit<='b0;
          end  

        
end
endmodule