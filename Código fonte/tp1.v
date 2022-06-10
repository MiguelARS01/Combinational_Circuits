module display(input [4:0]entrada, output reg [6:0]saida); //Início do module
    always @(*) begin //Bloco always
        case(entrada) //Especificação de todos os casos de entrada
        5'b00000: 	saida =  7'b0101010;    //W
        5'b00001:  	saida =  7'b0010101;  	//N
        5'b00010:	saida =  7'b1100111; 	//P
        5'b00011:  	saida =  7'b0110111;	//K
        5'b00100: 	saida =  7'b1101101;	//2
        5'b00101: 	saida =  7'b0110111; 	//X
        5'b00110: 	saida =  7'b0111100;	//J
        5'b00111: 	saida =  7'b1101101;	//Z
        5'b01000:   saida =  7'b1011011;	//S
        5'b01001:   saida =  7'b0000101;	//R
        5'b01010:   saida =  7'b0001110;    //L
        5'b01011:   saida =  7'b1110111;    //A
        5'b01100:	saida =  7'b0000110;	//1
        5'b01101: 	saida =  7'b1110011;    //Q
        5'b01110:   saida =  7'b1011111;	//6
        5'b01111:   saida =  7'b1111110;    //0
        5'b10000:   saida =  7'b1001111;    //E
        5'b10001:   saida =  7'b0000110;    //I
        5'b10010:   saida =  7'b0110111;    //H
        5'b10011:   saida =  7'b0001111;    //T
        default :   saida =  7'b0000000;    //entrada não existente (19<entrada<32).
        endcase 
    end 
endmodule //Final do module


//Início do testbench
module testbench;
    //Inputs
	reg [4:0]entrada; //Entrada (5 bits)
    reg [6:0]string;  //Valor correspondente
    //Outputs
	wire[6:0]saida; //Saída (7 bits)
    //Chamada da função
	display utt(.entrada(entrada), .saida(saida));
    //Bloco Initial
	initial begin
        //Criação do "arquivo.vcd"
        $dumpfile("tp1.vcd");
        $dumpvars;
        //Execução de todos os casos
           entrada = 0; string = "W"; //W
        #1 entrada = 1; string = "N"; //N
        #1 entrada = 2; string = "P"; //P
        #1 entrada = 3; string = "K"; //K
        #1 entrada = 4; string = "2"; //2
        #1 entrada = 5; string = "X"; //X
        #1 entrada = 6; string = "J"; //J
        #1 entrada = 7; string = "Z"; //Z
        #1 entrada = 8; string = "S"; //S
        #1 entrada = 9; string = "R"; //R
        #1 entrada = 10; string = "L"; //L
        #1 entrada = 11; string = "A"; //A	 
        #1 entrada = 12; string = "1"; //1	
        #1 entrada = 13; string = "Q"; //Q
        #1 entrada = 14; string = "6"; //6
        #1 entrada = 15; string = "0"; //0
        #1 entrada = 16; string = "E"; //E
        #1 entrada = 17; string = "I"; //I
        #1 entrada = 18; string = "H"; //H
        #1 entrada = 19; string = "T"; //T  
        #1 entrada = 20; string = "-"; //exemplo entrada maior que 19
        #1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ;  //string = "T"; //T
        
    end  
	initial begin
        //Imprime no terminal
         $display("\n|=================================|");
         $display("|   |    |  ENTRADA  ||   SAIDA   |");
         $display("|=================================|");
		 $monitor("| %s | %d |   %4b   ||  %7b  |",string,entrada,entrada,saida);
         #21 $display("|=================================|");
         $display("Para entradas invalidas (>19 e < 32) a saida sera 0000000.\n");
    end
endmodule //Fim da execução