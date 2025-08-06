`timescale 1ns / 1ps
// 128 to 255 for SFR

module ram (
    input clk,
    input rst,
    input rd,
    input wr,
    input is_bit_addr,
    input in_bit_data,
    input [7:0] in_data,
    input [7:0] addr,
    output reg [2:0]bit_select,
    output reg out_bit_data,
    output reg [7:0] out_data
);

reg [7:0] Address; // for accessing bit addressable memory
reg [7:0] buffer; // to store data of bit addressable byte

reg [7:0]mem[0:255];
integer i;
always@(posedge clk) begin
if(rst) begin
    for(i=0;i<256;i=i+1) begin
        mem[i] = 8'h02;
    end
    
   
//    mem[1] = 8'h07;
//    mem[2] = 8'h13;
//    mem[3] = 8'h35;



end 

else begin  // rst low
    if(is_bit_addr) begin  // for bit addressable
        bit_select = addr[2:0]; 
        Address = {3'b000,addr[7:3]};
        
            if(rd) begin  // for read bit from sfr
                if(addr>127 && addr<256) begin
                   
                   // for SFR  
                
                end
                else begin // for read bit from buffer
                    Address = {4'b0010,addr[6:3]}; 
                    buffer = mem[Address];
                    out_data = buffer;
                    out_bit_data = out_data[bit_select];
                end
            end  
            
            else begin  //rd = 0
                if(wr) begin // write bit in to sfr
                    if(addr>127 && addr<256) begin
                   
                   // for SFR  
                
                 end
                 else begin //write bit in to buffer                            
                        Address = {2'b0010,addr[6:3]}; 
                        buffer = mem[Address];
                        buffer[bit_select] = in_bit_data;
                        mem[Address] = buffer;
                 end  
            end
                       
            end   
        
    end
     else begin // for byte select
         if(rd) begin  // read
            if(addr>127 && addr<256) begin  // read data from sfr
                   
                   // for SFR  
                
            end
            
            else begin // read data from byte
                out_data = mem[addr];
           
            end 
         end
         
         else begin  // for write data into location
             if(addr>127 && addr<256) begin  // write data into sfr
                   
                   // for SFR  
                
            end
            
            else begin
                mem[addr] = in_data;
            end
         end 
         
     end
end
    
end 
endmodule
