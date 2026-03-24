module tb_apb_bridge;

    reg         PCLK;
    reg         PRESETn;

    reg         req;
    reg  [31:0] addr;
    reg         write;
    reg  [31:0] wdata;

    wire        ready;
    wire        done;
    wire [31:0] rdata;

    wire [31:0] PADDR;
    wire        PSEL;
    wire        PENABLE;
    wire        PWRITE;
    wire [31:0] PWDATA;
    wire [31:0] PRDATA;

    apb_bridge dut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .req(req),
        .addr(addr),
        .write(write),
        .wdata(wdata),
        .ready(ready),
        .done(done),
        .rdata(rdata),
        .PADDR(PADDR),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA)
    );

    // Simple APB slave
    apb_slave slave (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PADDR(PADDR),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA)
    );

    // Clock generation
    initial begin
        PCLK = 1'b0;
        forever #5 PCLK = ~PCLK;
    end

    // Write task
    task apb_write;
        input [31:0] a;
        input [31:0] d;
        begin
            @(posedge PCLK);
            req   = 1'b1;
            addr  = a;
            write = 1'b1;
            wdata = d;

            @(posedge PCLK);
            req = 1'b0;

            wait(done);

            $display("WRITE  ADDR=%h DATA=%h TIME=%0t", a, d, $time);
        end
    endtask

    // Read task
    task apb_read;
        input [31:0] a;
        begin
            @(posedge PCLK);
            req   = 1'b1;
            addr  = a;
            write = 1'b0;
            wdata = 32'h0000_0000;

            @(posedge PCLK);
            req = 1'b0;

            wait(done);

            @(posedge PCLK);
            $display("READ   ADDR=%h DATA=%h TIME=%0t", a, rdata, $time);
        end
    endtask

    // Stimulus
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_apb_bridge);

        $monitor("T=%0t | req=%b addr=%h write=%b wdata=%h | PSEL=%b PENABLE=%b PADDR=%h PWRITE=%b PWDATA=%h | done=%b rdata=%h",
                 $time, req, addr, write, wdata,
                 PSEL, PENABLE, PADDR, PWRITE, PWDATA,
                 done, rdata);

        // Initial 
        PRESETn = 1'b0; //reset active (active LOW)
        req     = 1'b0; //currently no transaction request
        addr    = 32'b0; //address clear
        write   = 1'b0; //default read
        wdata   = 32'b0; //write data clear
		//Stimulus
        @(posedge PCLK);
        PRESETn = 1'b1;

        // Transactions
        apb_write(32'h00000000, 32'h1234ABCD);
        apb_read (32'h00000000);

      apb_write(32'h00000004, 32'h1122AABB);
        apb_read (32'h00000004);

        #20;
        $finish;
    end

endmodule
