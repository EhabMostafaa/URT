module DESERIALIZER_URT_RX (
    input    wire            CLK_DESERIALIZER,
    input    wire            RST_DESERIALIZER,
    input    wire            deser_en_DESERIALIZER,     
    input    wire  [4:0]     Prescale_DESERIALIZER, 
    input    wire            sampled_bit_DESERIALIZER,
    input    wire  [3:0]     edge_cnt_DESERIALIZER,

    output   reg   [7:0]     P_DATA_DESERIALIZER
   );


always @(posedge CLK_DESERIALIZER or negedge RST_DESERIALIZER )
   begin
      if(!RST_DESERIALIZER)
        begin
            P_DATA_DESERIALIZER<='b0;
        end
           
      else if (deser_en_DESERIALIZER) 
          begin
            if((Prescale_DESERIALIZER=='d8) && (edge_cnt_DESERIALIZER =='b111))
               begin
                P_DATA_DESERIALIZER<={sampled_bit_DESERIALIZER,P_DATA_DESERIALIZER[7:1]};             //if is send 0>0>1>1>1>0>1>1      it will stored p_data=8'b1101_1100              i chose this assumption
              //P_DATA_DESERIALIZER<={P_DATA_DESERIALIZER[6:0],sampled_bit_DESERIALIZER};               //if is send 0>0>1>1>1>0>1>1      it will stored p_data=8'b0011_1011        
               end
           
            else if((Prescale_DESERIALIZER=='d16) && (edge_cnt_DESERIALIZER =='b1111))
               begin
              P_DATA_DESERIALIZER<={sampled_bit_DESERIALIZER,P_DATA_DESERIALIZER[7:1]};
            //P_DATA_DESERIALIZER<={P_DATA_DESERIALIZER[6:0],sampled_bit_DESERIALIZER};

               end
            else 
               begin
                P_DATA_DESERIALIZER<=P_DATA_DESERIALIZER;
               end   
          end
       else 
           begin
              P_DATA_DESERIALIZER<=P_DATA_DESERIALIZER;
             end   
               
   end
endmodule       