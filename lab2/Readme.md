# DSD LAB
### LAB 2
**Fatima Irfan Sohail**

**2023-EE-155**

## Task 1

| a | b | c |  x | y |
|---|---|---|----|---|
| 0 | 0 | 0 | 1  | 0 |
| 0 | 0 | 1 | 0  | 0 |
| 0 | 1 | 0 | 0  | 0 |
| 0 | 1 | 1 | 1  | 0 |
| 1 | 0 | 0 | 0  | 0 |
| 1 | 0 | 1 | 1  | 0 |
| 1 | 1 | 0 | 0  | 1 |
| 1 | 1 | 1 | 1  | 1 |

## Task 2
## Code 1

```verilog
 module full_adder(
input logic a,
input logic b,
input logic c,
output logic sum,
output logic carry,
);
sum = (a ^ b) ^ c;
 assign carry = (a & b) | (c(a ^ b));

 endmodule
```
There are a few syntax and logical errors in this Verilog code. Let's go through them:

### **Errors Identified:**
1. **Syntax Error in Module Declaration (Line 7)**  
   - A module declaration should not have a comma before the closing parenthesis.  
   **Incorrect:**
   ```verilog
   output logic carry,
   );
   ```
   **Correct:**
   ```verilog
   output logic carry
   );
   ```

2. **Incorrect Assignment of `sum` (Line 9)**  
   - The `sum` signal is not assigned correctly. In Verilog, all assignments in a combinational circuit must use the `assign` keyword.  
   **Incorrect:**
   ```verilog
   sum = (a ^ b) ^ c;
   ```
   **Correct:**
   ```verilog
   assign sum = (a ^ b) ^ c;
   ```

3. **Incorrect Use of `carry` Expression (Line 10)**  
   - The expression `(c(a ^ b))` is incorrect. In Verilog, function-like syntax is not valid for bitwise operations. It should be rewritten properly using parentheses and operators.
   **Incorrect:**
   ```verilog
   assign carry = (a & b) | (c(a ^ b));
   ```
   **Correct:**
   ```verilog
   assign carry = (a & b) | (c & (a ^ b));
   ```

### **Corrected Code:**
```verilog
module full_adder(
    input logic a,
    input logic b,
    input logic c,
    output logic sum,
    output logic carry
);

    assign sum = (a ^ b) ^ c;
    assign carry = (a & b) | (c & (a ^ b));

endmodule
```
### **Explanation of Corrections:**
1. Removed the extra comma in the module declaration.
2. Used `assign` for `sum`.
3. Corrected the `carry` expression by adding `&` instead of `c(a ^ b)`, making it `c & (a ^ b)`.

This corrected code should now work as expected for a **1-bit full adder** in Verilog. 

## Code 2
```verilog
module full_adder_tb();
 logic a1;
 logic b1;
 logic c1;
 logic sum1;

 full_adder (
 .a(a1),
 .b(b1),
 .c(c1),
 .sum(sum1),
 .carry(carry1)
 );

 initial
 begin
 // Provide different combinations of the inputs to check validity of code1 a = 0; b = 0; c = 0;
 #10;
a1 = 0; b1 = 0; c = 1;
#10;
 a1 = 0; b1 = 1; c1 = 0;
 #10;
 a1 = 0; b = 1; c1 = 1;
 #10;
 a1 = 1; b1 = 0; c1 = 0;
 #10;
 a1 = 1; b1 = 0; c1= 1;
 #10;
a = 1; b1 = 1; c1 = 0;
 #10
a1 = 1; b1 = 1; c1 = 1;
 #10
$stop;
endmodule
```

Your testbench code contains several errors. Let's go through them step by step and correct them.

---

## 1. Errors in the Code
### **(A) Missing Instance Name in Module Instantiation**
#### ❌ Incorrect:
```verilog
full_adder (
```
#### ✅ Correct:
```verilog
full_adder dut (
```
**Fix:**  
- In Verilog, when instantiating a module, you **must provide an instance name** (e.g., `dut` or `U1`).  

---

### **(B) Undefined `carry1` Signal**
#### ❌ Incorrect:
```verilog
full_adder dut (
    .a(a1),
    .b(b1),
    .c(c1),
    .sum(sum1),
    .carry(carry1)  // Error: carry1 is not declared
);
```
#### ✅ Correct:
```verilog
logic carry1; // Declare carry1 before using it
```
**Fix:**  
- `carry1` was used but never declared. It needs to be added to the list of declared signals.

---

### **(C) Incorrect Signal Naming in Assignments**
#### ❌ Incorrect:
```verilog
a = 0; b = 0; c = 0;
```
#### ✅ Correct:
```verilog
a1 = 0; b1 = 0; c1 = 0;
```
**Fix:**  
- The signals declared in the testbench are `a1`, `b1`, and `c1`.  
- But `a`, `b`, and `c` are being assigned, which do **not exist** in the testbench.

---

### **(D) Missing `;` on Line 31**
#### ❌ Incorrect:
```verilog
#10
```
#### ✅ Correct:
```verilog
#10;
```
**Fix:**  
- Every Verilog statement must end with a **semicolon (`;`)**.

---

### **(E) Incorrect Signal Name on Line 24**
#### ❌ Incorrect:
```verilog
a1 = 0; b = 1; c1 = 1;
```
#### ✅ Correct:
```verilog
a1 = 0; b1 = 1; c1 = 1;
```
**Fix:**  
- `b` should be `b1` to match the declared signals.

---

## **2. Corrected Verilog Testbench**
```verilog
module full_adder_tb();

    // Declare logic signals
    logic a1;
    logic b1;
    logic c1;
    logic sum1;
    logic carry1;

    // Instantiate the full_adder module
    full_adder dut (
        .a(a1),
        .b(b1),
        .c(c1),
        .sum(sum1),
        .carry(carry1)
    );

    // Test stimulus
    initial begin
        // Provide different combinations of inputs
        a1 = 0; b1 = 0; c1 = 0;
        #10;
        a1 = 0; b1 = 0; c1 = 1;
        #10;
        a1 = 0; b1 = 1; c1 = 0;
        #10;
        a1 = 0; b1 = 1; c1 = 1;
        #10;
        a1 = 1; b1 = 0; c1 = 0;
        #10;
        a1 = 1; b1 = 0; c1 = 1;
        #10;
        a1 = 1; b1 = 1; c1 = 0;
        #10;
        a1 = 1; b1 = 1; c1 = 1;
        #10;
        
        $stop; // Stop the simulation
    end

endmodule
```

---

