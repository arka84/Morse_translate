`timescale 1ns / 1ps
module morze2 (input clock,
input reset, input [10:0] data,  output reg buzz);
reg [24:0] clk; 
reg[3:0] clk_div1=0;
reg flag;
reg [12:0] clk_div2=0;
reg[21:0] cnt=0;
reg[3:0] state;//????????????
reg res;
parameter   duo=3822,   //?????????
		    lai=3405;

//(* ram_style = "block" *) reg [7:0] mem[0:256];
//assign led_bit=0;
//initial begin
    //$readmemh("result.mif", mem); 
	
//end
 

always@(posedge clock or negedge reset)
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
end

//always res<=reset;
always@ (posedge clock or negedge reset)
begin
//case (dataout)
//8'b00000001:begin
	if (!reset) begin
	//(state==3'b011) begin  //pichit vce vremja
		clk_div2<=0;
		state<=0;
		cnt<=0;
		buzz<=1;
	 end
	else if(clk_div1==11)//&&(dataout==8'h1)) 
	begin
	//state<=0;
	case (data)
	11'b10000111000: begin //a
	//state<=0;
			case(state)
			3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			 end
			3'b001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=lai)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			3'b010: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b011: begin               //????
					buzz<=1;
					cnt<=0;
					clk_div2<=0;
					end
					endcase
		
		end
	
  11'b10001100100:begin //b 3 raz 1 raz posle a
	
		case(state)
			3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			3'b010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			 end
			3'b011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			3'b100: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			   end
			3'b101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			3'b110:begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			   end	
			3'b111:begin
				buzz<=1;
				cnt<=0;
				clk_div2<=0;
				end
									
				endcase
			   end
  11'b11001000010: begin//c
  case(state)
			   3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b001: begin               //vkl dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			  3'b010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				
				
				 3'b100: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b101: begin               //vkl dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b110;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				
			   3'b110: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b111: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					//state<=3'b100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				endcase
				end
  11'b10001000110:begin //d
	case(state)
			3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			3'b010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				3'b100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b101: begin				//????
					clk_div2<=0;
					buzz<=1;
						//end 
						end
				endcase
				end
	
  11'b11001001000: begin //e
    case (state)
				3'b000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b101: begin				//????
				
					clk_div2<=0;
					buzz<=1;
						//end 
						end
						endcase
						end
						
  11'b11001010110: begin  //f
		case (state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end	
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b111;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0111: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)
				 state<=4'b1000;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b1000:begin	
					clk_div2<=0;
					buzz<=1;
					end
				endcase
						end

  11'b10001101000: begin //g
       case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)
				 state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101:begin	
					clk_div2<=0;
					buzz<=1;
					end
				endcase
						end
						
	11'b11001100110: begin //h
	     case (state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 		
						end
				4'b0110: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end	
				4'b0111: begin				//????
				
					clk_div2<=0;
					buzz<=1;
						end 		
					
				endcase
				end
	11'b10010000110: begin //I
      case (state)
				3'b000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=3'b010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				3'b010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b011: begin				//????
				
					clk_div2<=0;
					buzz<=1;
						end 
				endcase
				end
	11'b10001110110: begin	//J		
			case (state)
				4'b000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0110;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0110: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0111: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b1000;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b1000: buzz<=1;
				endcase
				end
	11'b11010000100: begin //K
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0100: begin               
				cnt<=cnt+1;
				if(cnt==22'h3fffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
				
					clk_div2<=0;
					buzz<=1;
						end 
						endcase
				end
				
				
	11'b11010010110: begin	//L	
			case(state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
						end
				4'b0110: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0111: begin				//????
					clk_div2<=0;
					buzz<=1;
						end 		
				endcase
				end
				
				
	11'b11001110100: begin //M
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
					clk_div2<=0;
					buzz<=1;
					end
					endcase
					end
	
	
	11'b10001100010: begin
			case (state)	
				3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b001: begin               //vkl dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
			  3'b010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff) 
					state<=3'b011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  3'b011: begin				//????
					clk_div2<=0;
					buzz<=1;
	              end
				endcase
				end
				
	11'b11010001000: begin //0
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				
				4'b0101: begin               //vkl
					clk_div2<=0;
					buzz<=1;
					end
					endcase
					
				end
				
				
	11'b11010011010: begin //p
			case(state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0110;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				
				4'b0110: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0111: begin				//????
					clk_div2<=0;
					buzz<=1;
						end 
				endcase
					end
					
					
	11'b10000101010: begin //Q
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0110: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0111: begin               //vkl
					clk_div2<=0;
					buzz<=1;
				end
			endcase
				end
				
	11'b11001011010: begin //R
			case(state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
					clk_div2<=0;
					buzz<=1;
						end 
				endcase
				end
				
				
				
	11'b11000110110: begin // S
			case (state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
						end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
						end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
					clk_div2<=0;
					buzz<=1;
						end 		
				endcase
				end
				
				
	11'b10001011000:begin //T
			case(state)
			   3'b000: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=3'b001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				3'b001: begin               //vkl dlinii
					clk_div2<=0;
					buzz<=1;
					end
				endcase	
					end
					
	11'b11001111000: begin //U
				case (state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
						end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
					end
					end
			 4'b0100: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl dlinii
					clk_div2<=0;
					buzz<=1;
					end
				endcase	
					end	
	
	11'b10001010100:begin //V
			case (state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			   end
			   4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
						end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			   4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
					end
					end
			   4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			   4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
					end
					end
			   4'b0110: begin               //????
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0111: begin               //vkl dlinii
					clk_div2<=0;
					buzz<=1;
					end
				endcase	
					end
					
	11'b11000111010: begin //W
			case(state)
				4'b0000: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0001: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0010;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end 
						end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl
					clk_div2<=0;
					buzz<=1;
				end
				endcase
				end
				
	11'b11001000100: begin // X
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
					end
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			  end
			  4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
					end
				4'b0110: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0111: begin               //vkl
					clk_div2<=0;
					buzz<=1;	
					end
					endcase
					end
					
	11'b11001101010: begin //Y
	      case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
			   end
			   4'b0011: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0100;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
					end
				4'b0100: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0101: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0110;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0110: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0111: begin               //vkl
					clk_div2<=0;
					buzz<=1;
				end
				endcase
				end
				
	11'b10000110100: begin //Z
			case (state)
				4'b0000: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0001;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0001: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0010;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				4'b0010: begin               //dlinii
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0011;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
				end
				end
				4'b0011: begin               //vkl
				cnt<=cnt+1;
				if(cnt==22'h3fffff) 
					state<=4'b0100;
				if(clk_div2!=3405)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=1;
				end
				end
				
				
				4'b0100: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0101;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
					end
			   end
			   4'b0101: begin				//????
				cnt<=cnt+1;
				if(cnt==22'h3ffffff) 
					state<=4'b0110;
				if(clk_div2!=3405)
					clk_div2<=clk_div2+1;  //
				else begin
					clk_div2<=0;
					buzz<=1;
						end
					end
				4'b0110: begin               //korotkii, esli yveli4it, stanet dlinjim
				cnt<=cnt+1;
				if(cnt==22'h3ffff)       
            	state<=4'b0111;
				if(clk_div2!=3822)  //+3822
					clk_div2<=clk_div2+1;
				else begin
					clk_div2<=0;
					buzz<=~buzz;
					end
			   end
			   4'b0111: begin				//????
					clk_div2<=0;
					buzz<=1;
						end
				endcase
					end
   11'b11111100000: begin // break c nim rabotaet			
				clk_div2<=0;
				state<=0;
				cnt<=0;
				buzz<=1;
				end
default: buzz<=1; 
endcase
end
end

 //assign buzz_v=buzz;

 endmodule