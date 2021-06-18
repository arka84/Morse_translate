//`include 'morze1.v'
module attempt3(
	input wire ps2clk, ps2data,clock, reset, output bit,
	output reg au, ad, al, ar, output reg [7:0] data, output reg buzz
);

reg res;
reg [10:0] incdata = 0; // регистр для хранения полученных битов
reg [3:0] bitsReceived = 0; // счётчик полученных битов
reg [1:0] currentState = 0;
reg [24:0] clk; 
reg[3:0] clk_div1=0;
reg [12:0] clk_div2;
reg [7:0] dataout;
reg[21:0] cnt=0;
reg[2:0] state=3'b000;
	morze2 inst(clock, reset, incdata, buzz);

parameter	waitStart	= 2'b00,
		waitNext	= 2'b01,
		waitData	= 2'b10;

parameter	//p_Start		= 11'b10111000000,// formiryet E0, skan kod sostoit iz 2
		p_Break		= 11'b11111100000,
		p_BtnUP		= 11'b10000111000,//a
		p_BtnDOWN	= 11'b10001100100,//b
		p_BtnLEFT	= 11'b10001001100,//3
		p_BtnRIGHT	= 11'b11000111100,// rabotaet 2
		p_C         = 11'b11001000010,//c
		p_D			= 11'b10001000110, //d
		p_E			= 11'b11001001000, //e
		p_F			= 11'b11001010110, //f
		p_G			= 11'b10001101000, //g
		p_H			= 11'b11001100110,
		p_I			= 11'b10010000110,
		p_J			= 11'b10001110110,
		p_K			= 11'b11010000100,
		p_L			= 11'b11010010110,
		p_M			= 11'b11001110100,
		p_N			= 11'b10001100010,
		p_O			= 11'b11010001000,
		p_P			= 11'b11010011010,
		p_Q			= 11'b10000101010,
		p_R			= 11'b11001011010,
		p_S			= 11'b11000110110,
		p_T			= 11'b10001011000,
		p_U			= 11'b11001111000,
		p_V			= 11'b10001010100,
		p_W			= 11'b11000111010,
		p_X			= 11'b11001000100,
		p_Y			= 11'b11001101010,
		p_Z			= 11'b10000110100;
		
		
assign bit=0;

/*always@(posedge clock or negedge reset)
begin
	if(!reset) begin
		clk_div1<=0;
	 end
	else begin
		if(clk_div1!=11)
			clk_div1<=clk_div1+1;
		else
			clk_div1<=0;
	 end
end	*/
//always res<=!reset;
always@(negedge ps2clk) begin
	incdata[bitsReceived] = ps2data;
	bitsReceived = bitsReceived + 1'b1;
	if(bitsReceived == 4'd11) begin
		bitsReceived <= 4'd0;
		case(currentState)
			waitStart : begin
				if(incdata == p_Break) begin
				   currentState <= waitNext;
					end
			end
			waitNext : begin
				case(incdata)
					p_Break	: begin
						currentState <= waitData;
					end
					p_BtnUP		: begin  //a
						au <= 1'b1;
						data<=8'b00010001;
						currentState <= waitStart;
						//res<=1;
												
					//morze2 inst(clock, reset, incdata, buzz);
					end
					p_BtnDOWN	: begin //b
						ad <= 1'b1;
						data<=8'b00000001;
						//morze2 inst(clock, reset, incdata, buzz);
						//buzz<=1;
						currentState <= waitStart;
						//res<=1;
					end
					p_BtnLEFT	: begin//3
						//clk_div1=0;
						al <= 1'b1;
						data<=8'b00001101;
						currentState <= waitStart;
						//if(clk_div1!=11)
							//clk_div1<=clk_div1+1;
						//else
							//clk_div1<=0;
					end
					p_BtnRIGHT	: begin//2
						ar <= 1'b1;
						data<=8'b00100101;
						currentState <= waitStart;
						
					end
					p_C  :  begin//c
						ar <= 1'b1;
						data<=8'b01100011;
						currentState <= waitStart;
					   
					end
					
					p_D  :  begin//d
						ar <= 1'b1;
						data<=8'b00000011;
						currentState <= waitStart;
					   
					end
					
					p_E	: begin
						ar <= 1'b1;
						data<=8'b01100001;
						currentState <= waitStart;
					   
					end
					
					p_F  :  begin//f
						ar <= 1'b1;
						data<=8'b01110001;
						currentState <= waitStart;
					 end
					 
					p_G	:	begin //g
						ar <= 1'b1;
						data<=8'b00001001;
						currentState <= waitStart;
					end
					
					p_H	:	begin
						ar <= 1'b1;
						data<=8'b10010001;
						currentState <= waitStart;
					end
					p_I	:	begin
						ar <= 1'b1;
						data<=8'b10011111;
						currentState <= waitStart;
					end
					p_J	:	begin
						al <= 1'b1;
						data<=8'b10000111;
						currentState <= waitStart;
					end
					p_K	:	begin
						al <= 1'b1;
						data<=8'b10010001;
						currentState <= waitStart;
					end
					p_L	:	begin
						al <= 1'b1;
						data<=8'b11100011;
						currentState <= waitStart;
					end
					
					p_M	:	begin
						al <= 1'b1;
						data<=8'b10010011;
						currentState <= waitStart;
					end
					
					p_N	:	begin
						al <= 1'b1;
						data<=8'b10010001;
						currentState <= waitStart;
					end
					
					p_O	:	begin
						al <= 1'b1;
						data<=8'b00000011;
						currentState <= waitStart;
					end
					
					p_P	:	begin
						au <= 1'b1;
						data<=8'b00110001;
						currentState <= waitStart;
					end
					
					p_Q	:	begin
						al <= 1'b1;
						data<=8'b00000010;
						currentState <= waitStart;
					end
					
					p_R	:	begin
						al <= 1'b1;
						data<=8'b00010001;
						currentState <= waitStart;
					end
					
					p_S	:	begin
						al <= 1'b1;
						data<=8'b01001001;
						currentState <= waitStart;
					end
					
					p_T	:	begin
						al <= 1'b1;
						data<=8'b01111111;
						currentState <= waitStart;
					end
					
					p_U	:	begin
						al <= 1'b1;
						data<=8'b10000011;
						currentState <= waitStart;
					end
					
					p_V	:	begin
						al <= 1'b1;
						data<=8'b10000011;
						currentState <= waitStart;
					end
					
					p_W	:	begin
						al <= 1'b1;
						data<=8'b10010011;
						currentState <= waitStart;
					end
					
					p_X	:	begin
						al <= 1'b1;
						data<=8'b11111110;
						currentState <= waitStart;
					end
					
					p_Y	:	begin
						al <= 1'b1;
						data<=8'b10011001;
						currentState <= waitStart;
					end
					p_Z	:	begin
						al <= 1'b1;
						data<=8'b00100101;
						currentState <= waitStart;
					end
										
				default	: currentState <= waitData;
				endcase
			end
			waitData : begin
				currentState <= waitStart;
				case(incdata)
					p_BtnUP :  au <= 1'b0;
				 	p_BtnDOWN :	ad <= 1'b0;
					p_BtnLEFT : al <= 1'b0;
					p_BtnRIGHT : ar <= 1'b0;
					
				endcase
			end
		endcase	
	end
end

endmodule