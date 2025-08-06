module ROM(input [11:0]addr,input rd,output reg [7:0]out_data,input clk,input rst,input [25:0]testing_store,input [7:0]testing_limit);

integer i=0;
reg [7:0]array_rom[4096:0];
integer testing_count = 0;
always@(posedge clk)

begin



if(rst == 1'b1)
begin 

for(i=0;i<4096;i=i+1)
begin
/*
if(i<=testing_limit)begin 
array_rom[i]=testing_store[testing_count+:8];
testing_count=testing_count+8;
end
*/

 array_rom[i]=8'b00000000;


end
array_rom[0]=8'b0010_0100;
array_rom[1]=8'h05;
array_rom[2]=8'b0010_0000;
array_rom[3]=8'h02;
array_rom[4]=8'b1000_0010;
array_rom[5]=8'h30;
array_rom[6]=8'b1000_0101;
array_rom[7]=8'h18;
array_rom[8]=8'h35;
array_rom[9]=8'b0011_0011;
array_rom[10]=8'b1010_0100;
array_rom[11]=8'b1000_0000; 
array_rom[12]= 8'h50;


//array_rom[13]=8'b1011_1000;
//array_rom[14]=8'h05;
//array_rom[15]=8'h50;

end


else if(rd == 1'b1)
begin
out_data[7:0]=array_rom[addr];
end
end
endmodule

