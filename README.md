linux下<br>
sudo apt install iverilog<br>
sudo apt install gtkwave<br>

window下使用powershell<br>
choco install iverilog<br>
choco install gtkwave<br>



iverilog -o xor_wav xorGate.v xorGate_tb.v<br>
vvp xor_wav<br>
gtkwave test_xor.vcd<br>
