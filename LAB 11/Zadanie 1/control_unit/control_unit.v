module control_unit (
    input Resetn, Clock, Run,
    input [9:1] IR,
    output reg Done,
    output reg G_in, G_out, DIN_out, add_sub, IR_in, A_in,
    output reg [0:7] R_in, R_out
);

    // State encoding
    localparam [1:0] T0 = 2'b00, T1 = 2'b01, T2 = 2'b10, T3 = 2'b11;

    // Instruction codes
    localparam [1:0] mv = 2'b00, mvi = 2'b01, add = 2'b10, sub = 2'b11;

    // Internal signals
    wire [2:0] I;
    reg [1:0] Tstep_D;
    reg [1:0] Tstep_Q /* synthesis keep */;

    // Extracting opcode
    assign I = IR[9:7];

    // State transitions
    always @(Tstep_Q, Run, Done)
        case (Tstep_Q)
            T0: 
                if (~Run) Tstep_D = T0;
                else Tstep_D = T1;
            T1:
                if (Done) Tstep_D = T0;
                else Tstep_D = T2;
            T2:
                Tstep_D = T3;
            T3:
                Tstep_D = T0;
        endcase

    // Output logic
    always @(Tstep_Q, I)
    begin
        Done = 1'b0;
        G_in = 1'b0;
        G_out = 1'b0;
        A_in = 1'b0;
        add_sub = 1'b0;
        DIN_out = 1'b0;
        R_in = 8'b00000000;
        R_out = 8'b00000000;
        IR_in = 1'b0;

        case (Tstep_Q)
            T0:
                IR_in = 1'b1;
            T1:
                case (I)
                    mv:
                    begin
                        R_out = IR[3:1]; // Xreg
                        R_in = IR[6:4];  // Yreg
                        Done = 1'b1;
                    end
                    mvi:
                    begin
                        DIN_out = 1'b1;
                        R_in = IR[6:4]; // Xreg
                        Done = 1'b1;
                    end
                    add, sub:
                    begin
                        R_out = IR[6:4]; // Xreg
                        A_in = 1'b1;
                    end
                endcase
            T2:
                case (I)
                    add:
                    begin
                        R_out = IR[3:1]; // Yreg
                        G_in = 1'b1;
                    end
                    sub:
                    begin
                        R_out = IR[3:1]; // Yreg
                        G_in = 1'b1;
                        add_sub = 1'b1;
                    end            
                endcase
            T3:
                case (I)
                    add, sub:
                    begin
                        G_out = 1'b1;
                        R_in = IR[6:4]; // Xreg
                        Done = 1'b1;
                    end
                endcase
        endcase
    end

    // State register
    always @(posedge Clock, negedge Resetn)
        if (!Resetn) 
            Tstep_Q <= T0;
        else 
            Tstep_Q <= Tstep_D;

endmodule
