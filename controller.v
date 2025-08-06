
`define ALU_NOT   4'b0110
`define ALU_OR    4'b1001
`define ALU_XOR   4'b1000
`define ALU_AND   4'b0111

//op_code [4:0]
`define ACALL 	8'bxxx1_0001 // absolute call
`define AJMP 	8'bxxx0_0001 // absolute jump  *


//REGISTER ADDRESSING MODE	
//op_code [7:3]
`define INC_R 	8'b0000_1xxx // increment Rn
`define DEC_R 	8'b0001_1xxx // decrement reg Rn=Rn-1
`define ADD_R 	8'b0010_1xxx // add A=A+Rx
`define ADDC_R 	8'b0011_1xxx // add A=A+Rx+c
`define ORL_R 	8'b0100_1xxx // or A=A or Rn
`define ANL_R 	8'b0101_1xxx // and A=A^Rx
`define XRL_R 	8'b0110_1xxx // XOR A=A XOR Rn
`define MOV_IR 	8'b0111_1xxx // move Rn=constant(WHERE IR IS IMMEDIATE TO REGISTER)
`define MOV_RD 	8'b1000_1xxx // move (direct)=Rn(WHERE REGISTER TO DIRECT)
`define SUBB_R 	8'b1001_1xxx // substract with borrow  A=A-c-Rn
`define MOV_DR 	8'b1010_1xxx // move Rn=(direct)
`define CJNE_R 	8'b1011_1xxx // compare and jump if not equal; Rx<>constant  *
`define XCH_R 	8'b1100_1xxx // exchange A<->Rn
`define DJNZ_R 	8'b1101_1xxx // decrement and jump if not zero  *
`define MOV_RA 	8'b1110_1xxx // move A=Rn
`define MOV_AR 	8'b1111_1xxx // move Rn=A

//op_code [7:1]
`define INC_I 	8'b0000_011x // increment @Ri
`define DEC_I 	8'b0001_011x // decrement indirect @Ri=@Ri-1
`define ADD_I 	8'b0010_011x // add A=A+@Ri
`define ADDC_I 	8'b0011_011x // add A=A+@Ri+c
`define ORL_I 	8'b0100_011x // or A=A or @Ri
`define ANL_I 	8'b0101_011x // and A=A^@Ri
`define XRL_I 	8'b0110_011x // XOR A=A XOR @Ri
`define CJNE_I 	8'b1011_011x // compare and jump if not equal; @Ri<>constant * 
`define MOV_I 	8'b1110_011x // move A=@Ri
`define MOV_ID 	8'b1000_011x // move (direct)=@Ri
`define MOV_AI 	8'b1111_011x // move @Ri=A
`define MOV_DI 	8'b1010_011x // move @Ri=(direct)
`define MOV_CI 	8'b0111_011x // move @Ri=constant
`define MOVX_IA 8'b1110_001x // move A=(@Ri)
`define MOVX_AI 8'b1111_001x // move (@Ri)=A
`define SUBB_I 	8'b1001_011x // substract with borrow  A=A-c-@Ri
`define XCH_I 	8'b1100_011x // exchange A<->@Ri
`define XCHD 	8'b1101_011x // exchange digit A<->Ri


//op_code [7:0]
`define ADD_D 	8'b0010_0101 // add A=A+(direct)
`define ADD_C 	8'b0010_0100 // add A=A+constant
`define ADDC_D 	8'b0011_0101 // add A=A+(direct)+c
`define ADDC_C 	8'b0011_01000 // add A=A+constant+c
`define ANL_D 	8'b0101_0101 // and A=A^(direct)
`define ANL_C 	8'b0101_0100 // and A=A^constant
`define ANL_AD 	8'b0101_0010 // and (direct)=(direct)^A
`define ANL_DC 	8'b0101_0011 // and (direct)=(direct)^constant
`define ANL_B 	8'b1000_0010 // and c=c^bit
`define ANL_NB 	8'b1011_0000 // and c=c^!bit
`define CJNE_D 	8'b1011_0101 // compare and jump if not equal; a<>(direct)    *
`define CJNE_C 	8'b1011_0100 // compare and jump if not equal; a<>constant    *
`define CLR_A 	8'b1110_0100 // clear accumulator
`define CLR_C 	8'b1100_0011 // clear carry
`define CLR_B 	8'b1100_0010 // clear bit
`define CPL_A 	8'b1111_0100 // complement accumulator
`define CPL_C 	8'b1011_0011 // complement carry
`define CPL_B 	8'b1011_0010 // complement bit
`define DA 		8'b1101_0100 // decimal adjust (A)
`define DEC_A 	8'b0001_0100 // decrement accumulator a=a-1
`define DEC_D 	8'b0001_0101 // decrement direct (direct)=(direct)-1
`define DIV 	8'b1000_0100 // divide
`define DJNZ_D 	8'b1101_0101 // decrement and jump if not zero (direct)      *
`define INC_A 	8'b0000_0100 // increment accumulator
`define INC_D 	8'b0000_0101 // increment (direct)
`define INC_DP 	8'b1010_0011 // increment data pointer
`define JB 		8'b0010_0000 // jump if bit set									*
`define JBC	 	8'b0001_0000 // jump if bit set and clear bit    // baki he
`define JC 		8'b0100_0000 // jump if carry is set     *
`define JMP_D 	8'b0111_0011 // jump direct     *
`define JNB 	8'b0011_0000 // jump if bit not set   *
`define JNC 	8'b0101_0000 // jump if carry not set *
`define JNZ 	8'b0111_0000 // jump if accumulator not zero  *
`define JZ 		8'b0110_0000 // jump if accumulator zero  *
`define LCALL 	8'b0001_0010 // long call
`define LJMP 	8'b0000_0010 // long jump  *
`define MOV_D 	8'b1110_0101 // move A=(direct)
`define MOV_C 	8'b0111_0100 // move A=constant
`define MOV_AD 	8'b1111_0101 // move (direct)=A
`define MOV_DD 	8'b1000_0101 // move (direct)=(direct)
`define MOV_CD 	8'b0111_0101 // move (direct)=constant
`define MOV_BC 	8'b1010_0010 // move c=bit
`define MOV_CB 	8'b1001_0010 // move bit=c
`define MOV_DP 	8'b1001_0000 // move dptr=constant(16 bit)
`define MOVC_DP 8'b1001_0011 // move A=dptr+A 
`define MOVC_PC 8'b1000_0011 // move A=pc+A
`define MOVX_PA 8'b1110_0000 // move A=(dptr)
`define MOVX_AP 8'b1111_0000 // move (dptr)=A
`define MUL 	8'b1010_0100 // multiply a*b
`define NOP 	8'b0000_0000 // no operation
`define ORL_D 	8'b0100_0101 // or A=A or (direct)
`define ORL_C 	8'b0100_0100 // or A=A or constant
`define ORL_AD 	8'b0100_0010 // or (direct)=(direct) or A
`define ORL_CD 	8'b0100_0011 // or (direct)=(direct) or constant
`define ORL_B 	8'b0111_0010 // or c = c or bit
`define ORL_NB 	8'b1010_0000 // or c = c or !bit
`define POP 	8'b1101_0000 // stack pop
`define PUSH 	8'b1100_0000 // stack push
`define RET 	8'b0010_0010 // return from subrutine
`define RETI 	8'b0011_0010 // return from interrupt
`define RL 		8'b0010_0011 // rotate left    *
`define RLC 	8'b0011_0011 // rotate left thrugh carry *
`define RR 		8'b0000_0011 // rotate right  * 
`define RRC 	8'b0001_0011 // rotate right thrugh carry  *
`define SETB_C 	8'b1101_0011 // set carry
`define SETB_B 	8'b1101_0010 // set bit
`define SJMP 	8'b1000_0000 // short jump    *
`define SUBB_D 	8'b1001_0101 // substract with borrow  A=A-c-(direct)
`define SUBB_C 	8'b1001_0100 // substract with borrow  A=A-c-constant
`define SWAP 	8'b1100_0100 // swap A(0-3) <-> A(4-7)
`define XCH_D 	8'b1100_0101 // exchange A<->(direct)
`define XRL_D 	8'b0110_0101 // XOR A=A XOR (direct)
`define XRL_C 	8'b0110_0100 // XOR A=A XOR constant
`define XRL_AD 	8'b0110_0010 // XOR (direct)=(direct) XOR A
`define XRL_CD 	8'b0110_0011 // XOR (direct)=(direct) XOR constant



//ALU OPCDOE 

`define PCU_ADD 4'b1111
`define ADD   4'b0001




module controller(
input CONTROLLER_Reset,
input CONTROLLER_Clock,
output reg [7:0]P0,
output reg [7:0]P1,
output reg [7:0]P2,
output reg [7:0]P3,
output reg [7:0]SP,
output reg [7:0]A,
output reg [15:0]PC,
output reg [7:0]PSW,
output reg [15:0]DPTR,
output reg [1:0]Current_Phase,
output reg [3:0]Current_State

);
//reg [7:0]P0,P1,P2,P3,SP;


localparam CS0 = 2'b00,CS1=2'b01,CS2=2'b10,CS3=2'b11;


//Variable Declaration for 8051 microcontroller
/*
reg [7:0]A,B;
reg [15:0]PC;
reg [7:0]PSW;
*/
reg [7:0]B;
reg [11:0]CONTROLLER_PC_TEMP;


//variable declaration for instatation
//FOR RAM
reg CONTROLLER_rd;
reg CONTROLLER_wr;
reg   CONTROLLER_is_bit_addr;
reg   CONTROLLER_in_bit_data;
reg   [7:0]CONTROLLER_in_data;
reg   [7:0] CONTROLLER_addr;
wire   CONTROLLER_out_bit_data;
wire   [7:0] CONTROLLER_out_data;
reg TEMP_RAM_DATA;  // for 3 byte instruction
//reg  CONTROLLER_out_bit_data_temp;     // for bit clear in JBC

//FOR ROM

reg [11:0]CONTROLLER_rom_addr;
reg  CONTROLLER_rom_rd;
wire  [7:0]CONTROLLER_rom_data;

//FOR ALU
reg [7:0]CONTROLLER_SRC_1,CONTROLLER_SRC_2,CONTROLLER_SRC_3;
reg [3:0]CONTROLLER_ALU_OPCODE;
reg CONTROLLER_p_CY,CONTROLLER_p_AX;
wire [15:0]CONTROLLER_dest;
wire CONTROLLER_CY , CONTROLLER_AX , CONTROLLER_OVF;

reg [7:0]CONTROLLER_OPERAND1,CONTROLLER_OPERAND2,CONTROLLER_OPERAND3;


//***************************************************************************************************************
localparam ES0=4'b0000,ES1=4'b0001,ES2=4'b0010,ES3=4'b0011,ES4=4'b0100,ES5=4'b0101,ES6=4'b0110,ES7=4'b0111,IES4=4'b1000,IES5=4'b1001,IES6=4'b1010,CJNE = 4'b1111,CJNE1 = 4'b1110; 
//reg [1:0]Current_Phase;
//reg [2:0]Current_State;
reg [3:0]Next_State;
reg [1:0]Next_Phase;
reg [7:0]CONTROLLER_OPCODE;           //stores the current instruction opcode
reg [7:0]CONTROLLER_TEMP_STORED_DATA;
reg CANNOT_USED_A_REGISTER;
reg CONTROLLER_A_NOT_USED;
reg [7:0]TEMPRARY_ROM_ADDRESS_STORED;
reg [7:0]TEMPRARY_RAM_ADDRESS_STORED;
reg CONTROLLER_DIRECT_ADDRSSING_A_NOT_USED;
reg CONTROLLER_ALU_NOT_NEEDED;
reg CONTROLLER_ROM_NEEDED;
reg CONTROLLER_IS_BIT_ADDRESSABLE;
reg CONTROLLER_INDIRECT_ADDRESSING_USED;
reg [7:0]TEMP_ROM_DATA;
reg [7:0]AJMP_OPCODE = `AJMP; 
reg CONTROLLER_JUMP_TYPE; // to slice define AJMP
//all module instatation



reg CONTROLLER_INT_NEEDED;
ROM CONTROLLER1 (
     .addr(CONTROLLER_rom_addr),
	  .rd(CONTROLLER_rom_rd),
	  .out_data(CONTROLLER_rom_data),
	  .clk(CONTROLLER_Clock),
	  .rst(CONTROLLER_Reset)
	  );

	  
	  
	 
 ram CONTROLLER2 (
    .clk(CONTROLLER_Clock),
    .rst(CONTROLLER_Reset),
    .rd(CONTROLLER_rd),
     .wr(CONTROLLER_wr),
     .is_bit_addr(CONTROLLER_is_bit_addr),
      .in_bit_data(CONTROLLER_in_bit_data),
     .in_data(CONTROLLER_in_data),
      .addr(CONTROLLER_addr),
      .out_bit_data(CONTROLLER_out_bit_data),
    .out_data(CONTROLLER_out_data)
);



alu F98(
        //.clock(CONTROLLER_CLOCK),
        .SRC_1(CONTROLLER_SRC_1),
		  .SRC_2(CONTROLLER_SRC_2),
		  .SRC_3(CONTROLLER_SRC_3),
		  .p_CY(CONTROLLER_p_CY),
		  //.p_AX(CONTROLLER_p_AX),
		  .opcode(CONTROLLER_ALU_OPCODE),
		  .dest(CONTROLLER_dest),
		  .CY(CONTROLLER_CY),
		  .OX(CONTROLLER_AX),
		  .OVF(CONTROLLER_OVF)
);



always@(posedge CONTROLLER_Clock)

begin

if(CONTROLLER_Reset == 1'b1) 
begin
Next_Phase = CS0;
Next_State = ES0;
PC[15:0]=16'h0000;
A[7:0]=8'h02;
B[7:0]=8'h04;
PSW[7:0]=8'h80;
DPTR = 16'h1234;
CONTROLLER_INT_NEEDED = 1'b0;
CANNOT_USED_A_REGISTER=1'b0;
/*
CONTROLLER_rd=1'b0;
CONTROLLER_wr=1'b0;
CONTROLLER_is_bit_addr=1'b0;
CONTROLLER_in_bit_data=1'b0;
CONTROLLER_in_data[7:0]=8'h00;
CONTROLLER_addr[7:0]=8'h00;*/
//CONTROLLER_out_bit_data;
//CONTROLLER_out_data[7:0]=8'h00;

//FOR ROM

CONTROLLER_rom_addr=12'h000;
CONTROLLER_rom_rd=1'b0;


//FOR ALU
CONTROLLER_SRC_1[7:0]=8'h00;
CONTROLLER_SRC_2=8'h00;
CONTROLLER_SRC_3=8'h00;
CONTROLLER_ALU_OPCODE[3:0]=4'h0;
CONTROLLER_p_CY=1'b0;
CONTROLLER_p_AX=1'b0;

end



else
begin
case(Current_Phase)
CS0:

begin
case(Current_State)
  ES0: begin  P0 = 8'hFF; Next_State = ES1;Next_Phase = CS0;end 
  ES1:begin P1 = 8'hFF; Next_State = ES2;Next_Phase = CS0; end 
  ES2:begin P2 = 8'hFF; Next_State = ES3;Next_Phase = CS0;end 
  ES3: begin P3 = 8'hFF; Next_State = ES4;Next_Phase = CS0;end 
  ES4: begin SP = 8'h07; Next_State = ES5;Next_Phase = CS0;end 
  ES5:begin Next_State = ES0;Next_Phase = CS2;end 
endcase
 //optimizi karsakte hai par ek baar ussi ko follow kiya hai  
end

CS2:

begin 
case(Current_State)

ES0:///rom ka data lene ke loye Jo current program counter point karrha hai currently wo lena hai
begin
CONTROLLER_rom_addr=PC[11:0];   //opcode stores in to rom_out_data
CONTROLLER_rom_rd=1'b1;

Next_State=ES1;
Next_Phase=CS2;
end

ES1:///prgram counter ko increment karne ke liye now hume program counter ko increment karna padega 
begin
CONTROLLER_rom_rd=1'b1;
CONTROLLER_SRC_1 = PC[15:8];
CONTROLLER_SRC_2 =  PC[7:0];
CONTROLLER_SRC_3 = 8'h01;
CONTROLLER_ALU_OPCODE  =4'b1111;


Next_State=ES2;
Next_Phase=CS2;
end


ES2://rom ka data mill gaya and we decode that which instruction hase to execute
begin 



CONTROLLER_PC_TEMP = CONTROLLER_dest[11:0];   // load 1 in to PC_temp
CONTROLLER_OPCODE=CONTROLLER_rom_data[7:0];
CONTROLLER_rom_rd=1'bx;
CONTROLLER_rom_addr=8'hxx;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED=1'b0;
CONTROLLER_ALU_NOT_NEEDED=1'b0;
CONTROLLER_DIRECT_ADDRSSING_A_NOT_USED = 1'b0;
CONTROLLER_IS_BIT_ADDRESSABLE=1'b0;
CONTROLLER_INDIRECT_ADDRESSING_USED = 1'b0;
CONTROLLER_JUMP_TYPE = 1'b0;
//AGARR ROM KA DATA USE KARNA HAI TOH YAHA SE KARNA HAI AUR KAHI SE NHI KARNA HAI 
//IDHAR OPCODE USE HOGAE
casex(CONTROLLER_OPCODE)
`ADD_R ,`ADDC_R , `INC_R ,`SUBB_R:

begin

CONTROLLER_SRC_3 = 8'h01;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_rd=1'b1;
CONTROLLER_INT_NEEDED = 1'b0;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;

end


`ANL_C ,`ADD_C ,`ADDC_C,`SUBB_C ,`ORL_C:

begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_addr=CONTROLLER_PC_TEMP[11:0];
CONTROLLER_rom_rd=1'b1;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_INT_NEEDED = 1'b0;


Next_State=ES3;
Next_Phase=CS2;
end

`ADD_I , `ADDC_I ,`MOV_I ,`INC_I ,`SUBB_I:

begin
CONTROLLER_addr={3'b000,PSW[4],PSW[3],2'b00,CONTROLLER_OPCODE[0]};
CONTROLLER_rd=1'b1;
CONTROLLER_INT_NEEDED=1'b1;

Next_State=ES3;
Next_Phase=CS2;

end

`ADD_D, `ADDC_D ,`ANL_D  ,`ANL_AD ,`SUBB_D, `ORL_D ,`ORL_AD :
begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_INT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;
Next_State=ES3;
Next_Phase=CS2;
end


`MOV_IR : begin

CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_INT_NEEDED = 1'b0;
CONTROLLER_ALU_NOT_NEEDED = 1'b1;


Next_State=ES3;
Next_Phase=CS2;

end

`MOV_DR: begin
 
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_INT_NEEDED = 1'b0;
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;

Next_State=ES3;
Next_Phase=CS2;

end

`MOV_AR: begin

CONTROLLER_SRC_3 = 8'h01;
CONTROLLER_in_data = A[7:0];
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_wr=1'b1;

Next_State=ES6;
Next_Phase=CS2;

end


`ORL_R , `ANL_R , `XRL_R :begin


CONTROLLER_SRC_3 = 8'h01;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_rd=1'b1;
CONTROLLER_INT_NEEDED = 1'b0;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;

Next_State=ES3;
Next_Phase=CS2;


end

`ORL_I , `ANL_I , `XRL_I :begin


CONTROLLER_SRC_3 = 8'h01;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],2'b00,CONTROLLER_OPCODE[0]};

CONTROLLER_rd=1'b1;
CONTROLLER_INT_NEEDED = 1'b1;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;

Next_State=ES3;
Next_Phase=CS2;


end

`ANL_B , `ANL_NB ,`CLR_B ,`ORL_B , `ORL_NB :begin

CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_INT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;
CONTROLLER_IS_BIT_ADDRESSABLE = 1'b1;
Next_State=ES3;
Next_Phase=CS2;

end


`CLR_A , `CPL_A :begin
CONTROLLER_PC_TEMP[11:0]=CONTROLLER_dest[11:0];
A=(CONTROLLER_OPCODE[5] == 1) ? ~A : 8'h00;
Next_State = ES6;
Next_Phase = CS2;
end


`CLR_C, `CPL_C :begin
CONTROLLER_PC_TEMP[11:0]=CONTROLLER_dest[11:0];
PSW[7]=1'b0;
PSW[7] = (CONTROLLER_OPCODE[5] == 1) ? ~PSW[7] : 1'b0;
Next_State = ES6;
Next_Phase = CS2;
end

`AJMP : begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_INT_NEEDED = 1'b0;
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;
Next_State=ES3;
Next_Phase=CS2;
end 

`CJNE_R :begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // 8 bit immidiate value store at ROM output
CONTROLLER_rd=1'b1;
CONTROLLER_SRC_3 = 8'h02;   // dest = 2
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]}; // select reg from ram and produce it's output
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b1;
CONTROLLER_JUMP_TYPE = 1'b1;
Next_State=CJNE;
Next_Phase=CS2;
end 

`CJNE_I :begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // 8 bit immidiate value store at ROM output
CONTROLLER_SRC_3 = 8'h02;   // dest = 2
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b1;
Next_State=CJNE;
Next_Phase=CS2;
end 


`DJNZ_R : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rd=1'b1;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b1;
Next_State=ES3;
Next_Phase=CS2;
end

`CJNE_D :begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // 8 bit immidiate value store at ROM output
CONTROLLER_SRC_3 = 8'h02;   // dest = 2
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b1;
CONTROLLER_INDIRECT_ADDRESSING_USED = 1'b0;
Next_State=CJNE;
Next_Phase=CS2;
end 

`CJNE_C : begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;  // rom_out_data = constant value in 2nd byte
CONTROLLER_SRC_3 = 8'h02;   // dest = 2
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b1;
Next_State=CJNE;
Next_Phase=CS2;
end 

`DJNZ_D : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // rom_out_data = 2nd byte
CONTROLLER_INDIRECT_ADDRESSING_USED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;
Next_State=CJNE;
Next_Phase=CS2;
end

`JB , `JNB: begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // rom_out_data = 2nd byte
CONTROLLER_rd=1'b1;
CONTROLLER_is_bit_addr = 1'b1;
CONTROLLER_addr = 8'h02;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`JC , `JNC , `JZ , `JNZ : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP; 
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`JMP_D : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`LJMP : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;   // store higher byte of address in rom_out_data
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;
Next_State=CJNE;
Next_Phase=CS2;
end 

`SJMP : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED=1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`RL , `RLC , `RR , `RRC: begin
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
CONTROLLER_ROM_NEEDED=1'b0;
CONTROLLER_A_NOT_USED = 1'b0;
Next_State=ES4;
Next_Phase=CS2;
end 

`MOV_DD : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP; 
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b0;
Next_State=CJNE;
Next_Phase=CS2;
end 

`MOV_CD : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP; // rom_out_data = const
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`MOV_DP : begin
CONTROLLER_SRC_3 = 8'h02;
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP; // rom_out_data = const
CONTROLLER_ALU_NOT_NEEDED = 1'b1;
CONTROLLER_ROM_NEEDED=1'b1;
Next_State=CJNE;
Next_Phase=CS2;

end 

`MOVC_DP : begin
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;
end 

`MUL : begin
CONTROLLER_ALU_NOT_NEEDED = 1'b0;
Next_State=ES3;
Next_Phase=CS2;

end 
 
default : Next_State=ES0;
endcase

end

CJNE :   // for 3 byte 
begin
CONTROLLER_PC_TEMP[11:0]=CONTROLLER_dest[11:0];  // pc_temp = 2 
CONTROLLER_INT_NEEDED = 1'b0;
TEMP_ROM_DATA	= CONTROLLER_rom_data; // we can store 8 bit immidiate value to temp beacause label is overwrite this data in next
TEMP_RAM_DATA   = CONTROLLER_out_data;

if(CONTROLLER_ROM_NEEDED == 1'b1)  begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;  //now label stored in rom_out_data
CONTROLLER_SRC_3 = 8'h03;   // update pc_temp for next instruction
end  

if(CONTROLLER_ROM_NEEDED == 1'b0)  begin
CONTROLLER_rom_rd = 1'b1;
CONTROLLER_rom_addr = CONTROLLER_PC_TEMP;  
CONTROLLER_SRC_3 = 8'h03;  
end  


if(CONTROLLER_INDIRECT_ADDRESSING_USED == 1'b0) begin
CONTROLLER_rd=1'b1;
CONTROLLER_addr = TEMP_ROM_DATA;   // it is used for direct address ; rom data goes to ram address
end


Next_State=ES3;
Next_Phase=CS2;


end 



ES3:

begin
CONTROLLER_PC_TEMP[11:0] = CONTROLLER_dest[11:0]; // pc temp hold for next instruction

Next_State=ES4;
Next_Phase=CS2;



if(CONTROLLER_INT_NEEDED == 1'b1) begin Next_State = IES4;Next_Phase = CS2;end


else if(CONTROLLER_ALU_NOT_NEEDED == 1'b1)begin

		if(CONTROLLER_ROM_NEEDED == 1'b0)
		begin  Next_State =ES5;Next_Phase = CS2;end

		else if(CONTROLLER_ROM_NEEDED == 1'b1)
		begin Next_State= IES4;Next_Phase = CS2;end
	
//else if(CONTROLLER_IS_BIT_ADDRESSABLE == 1'b0)
//begin Next_State = ES5;Next_Phase =CS2; end
//
//end
end
end



IES4:


begin
//A=(CONTROLLER_ROM_NEEDED == 1'b1) ? CONTROLLER_rom_data : CONTROLLER_out_data [7:0];
TEMPRARY_ROM_ADDRESS_STORED=CONTROLLER_rom_data[7:0];

CONTROLLER_addr = (CONTROLLER_ROM_NEEDED == 1'b1) ? CONTROLLER_rom_data : CONTROLLER_out_data [7:0];
CONTROLLER_rd = 1'b1;

Next_State = IES6;
Next_Phase = CS2;

if(CONTROLLER_IS_BIT_ADDRESSABLE == 1'b1) CONTROLLER_is_bit_addr = 1'b1;


if(CONTROLLER_OPCODE == `CLR_B)
begin
 CONTROLLER_wr = 1'b1;
 CONTROLLER_rd=1'bx;
 CONTROLLER_in_bit_data = 1'b0;
 Next_State = ES6;
Next_Phase = CS2;
end


if(CONTROLLER_OPCODE[4:0] == AJMP_OPCODE[4:0])  //for AJMP
begin
CONTROLLER_PC_TEMP[11:0] = {PC[11],CONTROLLER_OPCODE[7:5],TEMPRARY_ROM_ADDRESS_STORED};
Next_State = ES6;
Next_Phase = CS2;
end

if(CONTROLLER_OPCODE == `LJMP) begin   // for LJMP
CONTROLLER_PC_TEMP[11:0] = {TEMP_ROM_DATA[3:0],CONTROLLER_rom_data};
Next_State = ES6;
Next_Phase = CS2;
end 



end






IES6:begin

Next_State = ES4;
Next_Phase = CS2;

if(CONTROLLER_ALU_NOT_NEEDED == 1'b1) begin Next_State = ES5;Next_Phase = CS2;end

end




ES4://yeaha pe instrunctuon execute ho rhi hai 
begin

Next_State=ES5;
Next_Phase=CS2;


casex(CONTROLLER_OPCODE)
`ADD_R ,`ADD_I, `ADD_D:begin 
 CONTROLLER_SRC_1=CONTROLLER_out_data[7:0]; 
 CONTROLLER_SRC_2 = A;
 PSW[7]=1'b0;
 CONTROLLER_A_NOT_USED = 1'b0;
CONTROLLER_ALU_OPCODE=4'b0001;
TEMPRARY_ROM_ADDRESS_STORED = 1'b0;
 end
 
 `SUBB_R , `SUBB_I , `SUBB_D :begin 
 
 CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = A;
 CONTROLLER_A_NOT_USED = 1'b0;
CONTROLLER_ALU_OPCODE=4'b0010;

 end
 
`SUBB_C:begin
  CONTROLLER_SRC_1=CONTROLLER_rom_data[7:0]; 
   CONTROLLER_SRC_2 = A;

 CONTROLLER_A_NOT_USED = 1'b0;
CONTROLLER_ALU_OPCODE=4'b0010;

end


 `ADDC_R,`ADDC_I,`ADDC_D:begin 
 CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
  CONTROLLER_SRC_2 = A;

 CONTROLLER_A_NOT_USED = 1'b0;
CONTROLLER_ALU_OPCODE=4'b0001; 
 end

 `ADD_C :begin 
CONTROLLER_SRC_1=CONTROLLER_rom_data[7:0];
 CONTROLLER_SRC_2 = A;

PSW[7]=1'b0; 
CONTROLLER_ALU_OPCODE=4'b0001;

//Next_State=ES6;
//Next_Phase=CS2;

end


`ADDC_C :begin 
CONTROLLER_SRC_1=CONTROLLER_rom_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED = 1'b0;
CONTROLLER_ALU_OPCODE=4'b0001;
end

`INC_R:begin 
CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = 1'b1;

CONTROLLER_A_NOT_USED=1'b1;
PSW[7]=1'b0;
CONTROLLER_ALU_OPCODE=4'b0001;
end


`INC_I:begin 

CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = 1'b1;

CONTROLLER_A_NOT_USED=1'b1;
PSW[7]=1'b0;
CONTROLLER_ALU_OPCODE=4'b0001;
CONTROLLER_INDIRECT_ADDRESSING_USED=1'b1;

end


`ORL_R , `ORL_I ,`ORL_D :begin

CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_OR;

end

`ANL_R , `ANL_I  :begin
CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_AND;

end

`XRL_R , `XRL_I ,`ANL_D : begin
CONTROLLER_SRC_1=CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_XOR;
end 

`ANL_C :begin

CONTROLLER_SRC_1 = CONTROLLER_rom_data[7:0];
CONTROLLER_SRC_2 = A;
CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_AND;

end

`ORL_C :begin


CONTROLLER_SRC_1=CONTROLLER_rom_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_OR;

end
`ANL_AD:begin

CONTROLLER_SRC_1=(CONTROLLER_ROM_NEEDED == 1'b1) ? CONTROLLER_rom_data[7:0] : CONTROLLER_out_data[7:0];
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_XOR;
CONTROLLER_DIRECT_ADDRSSING_A_NOT_USED = 1'b1;
end

`ORL_AD:begin

CONTROLLER_SRC_1=CONTROLLER_out_data;
 CONTROLLER_SRC_2 = A;

CONTROLLER_A_NOT_USED=1'b0;
CONTROLLER_ALU_OPCODE=`ALU_OR;
CONTROLLER_DIRECT_ADDRSSING_A_NOT_USED = 1'b1;
end

`ANL_B : begin

CONTROLLER_ALU_OPCODE = 4'b0000;
PSW[7]=PSW[7]^CONTROLLER_out_bit_data;

Next_State=ES6;
Next_Phase=CS2;

end

`ORL_B : begin

CONTROLLER_ALU_OPCODE = 4'b0000;
PSW[7]=PSW[7]|CONTROLLER_out_bit_data;

Next_State=ES6;
Next_Phase=CS2;

end

`ORL_NB : begin

CONTROLLER_ALU_OPCODE = 4'b0000;
PSW[7]=PSW[7]|(~CONTROLLER_out_bit_data);

Next_State=ES6;
Next_Phase=CS2;

end



`ANL_NB : begin

CONTROLLER_ALU_OPCODE = 4'b0000;
PSW[7]=PSW[7]^(~CONTROLLER_out_bit_data);

Next_State=ES6;
Next_Phase=CS2;

end

`CJNE_R: begin
CONTROLLER_SRC_1 = CONTROLLER_out_data;
CONTROLLER_SRC_2 = TEMP_ROM_DATA;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
CONTROLLER_JUMP_TYPE = 1'b1;
Next_State=ES5;
Next_Phase=CS2;
end 

`CJNE_I: begin
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = TEMP_ROM_DATA;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
CONTROLLER_JUMP_TYPE = 1'b1;
Next_State=ES5;
Next_Phase=CS2;
end 

`DJNZ_R: begin
CONTROLLER_JUMP_TYPE = 1'b1;
CONTROLLER_SRC_1 = CONTROLLER_out_data;
CONTROLLER_SRC_2 = 1'b1;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
Next_State=ES5;
Next_Phase=CS2;
end 

`CJNE_D: begin
CONTROLLER_JUMP_TYPE = 1'b1;
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = CONTROLLER_out_data;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
Next_State=ES5;
Next_Phase=CS2;
end 


`CJNE_C: begin
CONTROLLER_JUMP_TYPE = 1'b1;
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = TEMP_ROM_DATA;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
Next_State=ES5;
Next_Phase=CS2;
end 

`DJNZ_D: begin
CONTROLLER_JUMP_TYPE = 1'b1;
CONTROLLER_SRC_1 = CONTROLLER_out_data;
CONTROLLER_SRC_2 = 1'b1;
CONTROLLER_ALU_OPCODE = 4'b0010;  // it goes to ALU and perfoem sub and result sroes dest 
Next_State=ES5;
Next_Phase=CS2;
end 

`JB : begin

if(CONTROLLER_out_bit_data == 1'b1) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 

`JNB : begin

if(CONTROLLER_out_bit_data == 1'b0) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 

`JC : begin

if(PSW[7] == 1'b1) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 

`JNC : begin

if(PSW[7] == 1'b0) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 


`JNZ : begin

if(A != 8'h00) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 



`JZ : begin

if(A == 8'h00) begin
	CONTROLLER_SRC_1 = PC[15:8];
	CONTROLLER_SRC_2 = PC[7:0];
	CONTROLLER_SRC_3 = CONTROLLER_rom_data;
	CONTROLLER_ALU_OPCODE = 4'b1110;
	Next_State=CJNE1;
	Next_Phase=CS2;
end 
else begin
Next_State=ES6;
Next_Phase=CS2;

end 
end 

`SJMP : begin
CONTROLLER_SRC_1 = PC[15:8];
CONTROLLER_SRC_2 = PC[7:0];
CONTROLLER_SRC_3 = CONTROLLER_rom_data;
CONTROLLER_ALU_OPCODE = 4'b1110;
Next_State=CJNE1;
Next_Phase=CS2;
end 


`RL , `RR : begin
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = 2;
CONTROLLER_ALU_OPCODE = (CONTROLLER_OPCODE == `RL )? 4'B1010 : 4'b1100;
Next_State=ES6;
Next_Phase=CS2;
end 

`RLC , `RRC : begin
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = 2;
CONTROLLER_p_CY = PSW[7];
CONTROLLER_ALU_OPCODE = (CONTROLLER_OPCODE == `RLC )? 4'b1011 : 4'b1101;
Next_State=ES6;
Next_Phase=CS2;
end 

`MOVC_DP : begin
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = DPTR[7:0];
CONTROLLER_ALU_OPCODE = 4'b0001;
end 


`MUL : begin
CONTROLLER_SRC_1 = A;
CONTROLLER_SRC_2 = B;
CONTROLLER_ALU_OPCODE = 4'b0011;
Next_State=ES6;
Next_Phase=CS2;
end 

endcase



//`MOV_R :begin CONTROLLER_SRC_1=CONTROLLER_out_data[7:0]; PSW[7]=1'b0;CONTROLLER_A_NOT_USED = 1'b0;A=8'H00; end
//`MOVX_IA :begin  CONTROLLER_SRC_1=CONTROLLER_out_data[7:0]; PSW[7]=1'b0;CONTROLLER_A_NOT_USED = 1'b0; end



CONTROLLER_addr=8'hxx;
CONTROLLER_rd=1'bx;
CONTROLLER_rom_rd =1'b0;

//CONTROLLER_SRC_2=(CONTROLLER_A_NOT_USED == 1'b1)? 1 : A;
CONTROLLER_p_CY=PSW[7];

//CONTROLLER_ALU_OPCODE=4'b0001;



end




ES5:
begin

Next_State=ES6;
Next_Phase=CS2;


//CONTROLLER_ALU_OPCODE=4'b0000;
if(CONTROLLER_A_NOT_USED == 1'b1) 
begin
//A=CONTROLLER_dest;
CONTROLLER_in_data = CONTROLLER_dest;
CONTROLLER_addr=(CONTROLLER_INDIRECT_ADDRESSING_USED == 1'b1) ? TEMPRARY_RAM_ADDRESS_STORED : {3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_wr=1'b1;

end

else if(CONTROLLER_OPCODE == `MOVC_DP) begin
CONTROLLER_rom_rd=1'b1;
CONTROLLER_rom_addr = CONTROLLER_dest;
Next_State=ES6;
Next_Phase=CS2;
end 

else if(CONTROLLER_OPCODE == `MOV_DP) begin
DPTR = {TEMP_ROM_DATA,CONTROLLER_rom_data};
end 

else if(CONTROLLER_OPCODE == `MOV_DD) begin
CONTROLLER_rd=1'b1;
CONTROLLER_addr=CONTROLLER_rom_data;
Next_State=CJNE1;
Next_Phase=CS2;

end 

else if(CONTROLLER_OPCODE == `JMP_D) begin
CONTROLLER_PC_TEMP = CONTROLLER_rom_data;
end


else if(CONTROLLER_ALU_NOT_NEEDED == 1'b1) begin

CONTROLLER_in_data =(CONTROLLER_ROM_NEEDED == 1'b1) ? CONTROLLER_out_data :CONTROLLER_rom_data;
CONTROLLER_rom_rd=1'b0;
CONTROLLER_rd=1'bx;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_wr=1'b1;


end

else if(CONTROLLER_DIRECT_ADDRSSING_A_NOT_USED == 1'b1) begin

CONTROLLER_in_data = TEMPRARY_ROM_ADDRESS_STORED;
CONTROLLER_addr={3'b000,PSW[4],PSW[3],CONTROLLER_OPCODE[2:0]};
CONTROLLER_wr=1'b1;

end

else if(CONTROLLER_dest != 1'b0 && CONTROLLER_JUMP_TYPE == 1'b1) begin   // for conditional jump

CONTROLLER_SRC_1 = PC[15:8];
CONTROLLER_SRC_2 = PC[7:0];
CONTROLLER_SRC_3 = CONTROLLER_rom_data;
CONTROLLER_ALU_OPCODE = 4'b1110;
Next_State=CJNE1;
Next_Phase=CS2;
end




else begin 
A=CONTROLLER_dest;
PSW[7]=CONTROLLER_CY;
PSW[6]=CONTROLLER_AX;
end



end


CJNE1: begin
CONTROLLER_PC_TEMP = CONTROLLER_dest;

if(CONTROLLER_OPCODE == `MOV_DD) begin
CONTROLLER_wr=1'b1;                     // to check the data is write or not
CONTROLLER_rd=1'bx;
CONTROLLER_addr = TEMP_ROM_DATA ;  
CONTROLLER_in_data = CONTROLLER_out_data;
end 
 

Next_State=ES6;
Next_Phase=CS2;
end 



ES6:
begin
PC[11:0]=CONTROLLER_PC_TEMP[11:0];  // for next instruction PC load
//A = CONTROLLER_dest;
//A = CONTROLLER_rom_data;

if(CONTROLLER_OPCODE == `MOV_DD) begin
CONTROLLER_rd=1'b1;
CONTROLLER_addr = TEMP_ROM_DATA ;  
end

if(CONTROLLER_OPCODE == `RLC) begin
A = CONTROLLER_dest;
end 

if(CONTROLLER_OPCODE == `MUL) begin
A = CONTROLLER_dest[15:8];
B = CONTROLLER_dest[7:0];
end 


Next_State=ES7;	
Next_Phase=CS2;
end





ES7:
begin
CONTROLLER_wr=1'bx;
CONTROLLER_addr=8'hxx;
CONTROLLER_in_data=8'hxx;
CONTROLLER_is_bit_addr = 1'bx;
CONTROLLER_rom_rd=1'b0;
CONTROLLER_rd=1'bx;
//we have to check output at this stage all input and output 
Next_State = ES0;
Next_Phase = CS2;
end


endcase

end

endcase

 
 #200 Current_State=Next_State;
 Current_Phase=Next_Phase;

end

end


endmodule
