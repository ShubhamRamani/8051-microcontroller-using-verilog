`timescale 1ns / 1ps
module alu(SRC_1,SRC_2,SRC_3,opcode,p_CY,dest,CY,OX,OVF);
input [7:0]SRC_1,SRC_2,SRC_3;
input [3:0]opcode;
input p_CY;
output reg [15:0]dest;
output reg CY,OX,OVF;
reg [3:0]l_nibble,u_nibble;
reg [7:0]temp;
always@(*) begin
case(opcode) 
4'b0001 : begin  // unsigned addition
    {OX,l_nibble} = SRC_1[3:0] + SRC_2[3:0] + p_CY;
    {CY,u_nibble} = SRC_1[7:4] + SRC_2[7:4] + OX;
    dest = {u_nibble,l_nibble};
    OVF = 1'b0;
end 

4'b0010 : begin //subtraction
    temp = ~SRC_2 + 1'b1;
    {OX,l_nibble} = SRC_1[3:0] + temp[3:0];
    {CY,u_nibble} = SRC_1[7:4] + temp[7:4] + OX;
    dest = {u_nibble,l_nibble} - p_CY;
    OVF = 1'b0;
end 

4'b0011 : begin  //multiplication
dest = SRC_1 * SRC_2;
if(dest>255) begin
    OVF = 1'b1;
    CY = 1'b0;
    OX = 1'b0;
end 

else begin
    OVF = 1'b0;
    CY = 1'b0;
    OX = 1'b0;
end 
end 

4'b0100 : begin
    if(SRC_2==1'b0) begin
        dest = 16'hxxxx;
        OVF = 1'b1;
        CY = 1'b0;
        OX = 1'b0;
    end 
    else begin
        dest[15:8] = SRC_1/SRC_2;
        dest[7:0] = SRC_1%SRC_2;
        OVF = 1'b0;
        CY = 1'b0;
        OX = 1'b0;  
    end
end

4'b0101 : begin  // DA
{OX,l_nibble} = SRC_1[3:0] + SRC_2[3:0];
{CY,u_nibble} = SRC_1[7:4] + SRC_2[7:4] + OX;

if(l_nibble>9 || OX==1'b1) begin
l_nibble = l_nibble + 4'b0110;
CY = 1'b0 ;
OVF = 1'b0;
end 
if(u_nibble>9 || CY==1'b1) begin
u_nibble = u_nibble + 4'b0110;
OX = 1'b0;
OVF = 1'b0;
end
dest = {u_nibble,l_nibble};
end

4'b0110 : begin // NOT
dest = ~SRC_1;
OX = 1'b0;
OVF = 1'b0;
CY = 1'b0 ;
end 

4'b0111 : begin // AND
dest = SRC_1 & SRC_2;
OX = 1'b0;
OVF = 1'b0;
CY = 1'b0 ;
end 

4'b1000 : begin //XOR
dest = SRC_1 ^ SRC_2;
OX = 1'b0;
OVF = 1'b0;
CY = 1'b0 ;
end 

4'b1001 : begin  //OR
dest = SRC_1 | SRC_2;
OX = 1'b0;
OVF = 1'b0;
CY = 1'b0 ;
end 

4'b1010 :  begin //ROTATE LEFT
case(SRC_2) 

8'h01 : dest = {SRC_1[6:0],SRC_1[7]};

8'h02 : dest = {SRC_1[5:0],SRC_1[7:6]};

8'h03 : dest = {SRC_1[4:0],SRC_1[7:5]};

8'h04 : dest = {SRC_1[3:0],SRC_1[7:4]};

8'h05 : dest = {SRC_1[2:0],SRC_1[7:3]};

8'h06 : dest = {SRC_1[1:0],SRC_1[7:2]};

8'h07 : dest = {SRC_1[0],SRC_1[7:1]};

default : dest = SRC_1;

endcase
end 

4'b1011 : begin //ROTATE LEFT WITH CARRY
case(SRC_2) 

8'h01 : {CY,dest} = {SRC_1,p_CY}; 

8'h02 : {CY,dest} = {SRC_1[6:0],p_CY,SRC_1[7]};

8'h03 : {CY,dest} = {SRC_1[5:0],p_CY,SRC_1[7:6]};

8'h04 : {CY,dest} = {SRC_1[4:0],p_CY,SRC_1[7:5]};

8'h05 : {CY,dest} = {SRC_1[3:0],p_CY,SRC_1[7:4]};

8'h06 : {CY,dest} = {SRC_1[2:0],p_CY,SRC_1[7:3]};

8'h07 : {CY,dest} = {SRC_1[1:0],p_CY,SRC_1[7:2]};

8'h08 : {CY,dest} = {SRC_1[0],p_CY,SRC_1[7:1]};
endcase
end 

4'b1100: begin // ROTATE RIGHT
case(SRC_2) 

8'h01 : dest = {SRC_1[0],SRC_1[7:1]};

8'h02 : dest = {SRC_1[1:0],SRC_1[7:2]};

8'h03 : dest = {SRC_1[2:0],SRC_1[7:3]};

8'h04 : dest = {SRC_1[3:0],SRC_1[7:4]};

8'h05 : dest = {SRC_1[4:0],SRC_1[7:5]};

8'h06 : dest = {SRC_1[5:0],SRC_1[7:6]};

8'h07 : dest = {SRC_1[6:0],SRC_1[7]};

default : dest = SRC_1;

endcase
end 

4'b1101 : begin // ROTATE RIGHT WITH CARRY

case(SRC_2) 

8'h01 : {dest} = {SRC_1[0],p_CY,SRC_1[7:1]};

8'h02 : {CY,dest} = {SRC_1[1:0],p_CY,SRC_1[7:2]};

8'h03 : {CY,dest} = {SRC_1[2:0],p_CY,SRC_1[7:3]};

8'h04 : {CY,dest} = {SRC_1[3:0],p_CY,SRC_1[7:4]};

8'h05 : {CY,dest} = {SRC_1[4:0],p_CY,SRC_1[7:5]};

8'h06 : {CY,dest} = {SRC_1[5:0],p_CY,SRC_1[7:6]};

8'h07 : {CY,dest} = {SRC_1[6:0],p_CY,SRC_1[7]};

8'h08 : {CY,dest} = {SRC_1[7:0],p_CY};

default : {CY,dest} = SRC_1;

endcase


end

4'b1110 : begin
if(SRC_3[7] == 1'b1) dest  = {SRC_1,SRC_2} + (~({8'b00000000,SRC_3})+1'b1) ;

else if (SRC_3[7] == 1'b0)  dest = {SRC_1,SRC_2} + {8'b00000000,SRC_3};

end 

4'b1111: begin
dest = {SRC_1,SRC_2} + {8'b00000000,SRC_3};
end 


endcase
end 
endmodule
