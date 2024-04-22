
SIMULATION OF LOGIC GATES ,ADDERS AND SUBTRACTORS

AIM: 
To simulate Logic Gates ,Adders and Subtractors using Vivado 2023.2.

APPARATUS REQUIRED: 
VIVADO 2023.2

PROCEDURE: 

1. Open Vivado: Launch Xilinx Vivado software on your computer.

2. Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

3. Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

4. Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

5. Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

6. Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

7. Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

8. Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

9. View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.
LOGIC GATES

LOGIC DIAGRAM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/fa4a02e5-e487-4993-add9-0fc9130d2399)

VERILOG CODE 
```
module logicgate(a,b,andgate,orgate,nandgate,norgate,xorgate,xnorgate,notgate);
input a,b;
output andgate,orgate,nandgate,norgate,xorgate,xnorgate,notgate;
and(andgate,a,b);
or(orgate,a,b);
nand(nandgate,a,b);
nor(norgate,a,b);
xor(xorgate,a,b);
xnor(xnorgate,a,b);
not(notgate,a);
endmodule
```

OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/0860f246-c179-43a9-87f8-401e52e093cb)


HALF ADDER

LOGIC DIAGRAM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/9e6b6d3d-73e4-4668-8bce-ad710dc79f1b)

VERILOG CODE
```
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
xor g1(sum,a,b);
and g2(carry,a,b);
endmodule 

```

OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/8b013ca6-ce21-4072-98cd-0e58ed642b8d)

FULL ADDER

LOGIC DIAGRAM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/370791c7-9429-4a69-a027-22c12e235fd5)

VERILOG CODE 
```
module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
xor(w1,a,b);
xor(sum,w1,c);
and(w2,w1,c);
and(w3,a,b);
or(carry,w2,w3);
endmodule
```
OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/ae2a9aa7-c856-45c8-b8a8-9d55428d3f89)

HALF SUBTRACTOR

LOGIC DIAGRAM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/4df410ca-40cb-457a-a7e7-08f72b5b4833)


VERILOG CODE 
```
module halfsub(a,b,diff,borrow);
input a,b;
output diff,borrow;
xor(diff,a,b);
and(borrow,~a,b);
endmodule
```
OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/5b4b5d80-2a60-47f1-98e7-692736d1fb74)

FULL SUBTRACTOR

LOGIC DIAGRAM

![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/e3b6b6c2-6340-4eeb-802a-9bd08394639d)
 
VERILOG CODE 
```
module fs(a,b,bin,d,bout);
input a,b,bin;
output d,bout;
wire w1,w2,w3;
xor(w1,a,b);
xor(d,w1,bin);
and(w2,~a,b);
and(w3,~w1,bin);
or(bout,w3,w2);
endmodule
```
OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/76488ae6-1f71-4bbc-868a-84aa4d1d94e0)


RIPPLE CARRY ADDER

LOGIC DIAGRAM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/f961ac8c-a557-4309-96a2-2b16a8bc8321)

VERILOG CODE 
```
module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
xor(w1,a,b);
xor(sum,w1,c);
and(w2,w1,c);
and(w3,a,b);
or(carry,w2,w3);
endmodule

module rca_8bit(a,b,cin,s,cout);
input [7:0]a,b;
input cin;
output [7:0]s;
output cout;
wire [7:1]w;
fulladder f1(a[0], b[0], cin, s[0], w[1]);
fulladder f2(a[1], b[1], w[1], s[1], w[2]);
fulladder f3(a[2], b[2], w[2], s[2], w[3]);
fulladder f4(a[3], b[3], w[3], s[3], w[4]);
fulladder f5(a[4], b[4], w[4], s[4], w[5]);
fulladder f6(a[5], b[5], w[5], s[5], w[6]);
fulladder f7(a[6], b[6], w[6], s[6], w[7]);
fulladder f8(a[7], b[7], w[7], s[7], cout);
endmodule
```

OUTPUT WAVEFORM

 ![image](https://github.com/Lokeshmb005/VLSI-LAB-EXP-1/assets/159941167/6ca07915-f6d5-48ce-b000-875d8918bafa)

 result:
 SIMULATION OF LOGIC GATES ,ADDERS AND SUBTRACTORS HAS BE VERIFIED.
       
