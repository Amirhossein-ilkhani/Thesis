onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Main_tb/clk
add wave -noupdate -radix hexadecimal /Main_tb/rst
add wave -noupdate /Main_tb/done
add wave -noupdate -group IN_0 -radix unsigned /Main_tb/uut/generator_in_0/Addr
add wave -noupdate -group IN_0 -radix hexadecimal /Main_tb/uut/generator_in_0/i
add wave -noupdate -group IN_0 -radix hexadecimal -childformat {{{/Main_tb/uut/generator_in_0/j[7]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[6]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[5]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[4]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[3]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[2]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[1]} -radix hexadecimal} {{/Main_tb/uut/generator_in_0/j[0]} -radix hexadecimal}} -subitemconfig {{/Main_tb/uut/generator_in_0/j[7]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[6]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[5]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[4]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[3]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[2]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[1]} {-height 15 -radix hexadecimal} {/Main_tb/uut/generator_in_0/j[0]} {-height 15 -radix hexadecimal}} /Main_tb/uut/generator_in_0/j
add wave -noupdate -group IN_0 -radix hexadecimal /Main_tb/uut/generator_in_0/k
add wave -noupdate -group IN_0 -radix hexadecimal -childformat {{{/Main_tb/uut/Arbiter_in_0/select[0]} -radix hexadecimal}} -subitemconfig {{/Main_tb/uut/Arbiter_in_0/select[0]} {-height 15 -radix hexadecimal}} /Main_tb/uut/Arbiter_in_0/select
add wave -noupdate -group IN_0 /Main_tb/uut/Arbiter_in_0/request
add wave -noupdate -group IN_0 /Main_tb/uut/Arbiter_in_0/grant
add wave -noupdate -group IN_0 -radix unsigned /Main_tb/uut/generator_in_0/cnt_0
add wave -noupdate -group IN_0 -radix unsigned /Main_tb/uut/generator_in_0/cnt_1
add wave -noupdate -group IN_0 /Main_tb/uut/generator_in_0/co_0
add wave -noupdate -group IN_0 /Main_tb/uut/generator_in_0/co_1
add wave -noupdate -group IN_1 /Main_tb/uut/generator_in_1/Addr
add wave -noupdate -group IN_1 /Main_tb/uut/generator_in_1/i
add wave -noupdate -group IN_1 /Main_tb/uut/generator_in_1/j
add wave -noupdate -group IN_1 /Main_tb/uut/generator_in_1/k
add wave -noupdate -group IN_1 /Main_tb/uut/Arbiter_in_1/select
add wave -noupdate -group IN_1 /Main_tb/uut/Arbiter_in_1/grant
add wave -noupdate -group IN_1 /Main_tb/uut/Arbiter_in_1/request
add wave -noupdate -group IN_2 /Main_tb/uut/generator_in_2/Addr
add wave -noupdate -group IN_2 /Main_tb/uut/generator_in_2/i
add wave -noupdate -group IN_2 /Main_tb/uut/generator_in_2/j
add wave -noupdate -group IN_2 /Main_tb/uut/generator_in_2/k
add wave -noupdate -group IN_2 /Main_tb/uut/Arbiter_in_2/select
add wave -noupdate -group IN_2 /Main_tb/uut/Arbiter_in_2/grant
add wave -noupdate -group IN_2 /Main_tb/uut/Arbiter_in_2/request
add wave -noupdate -group IN_3 /Main_tb/uut/generator_in_3/Addr
add wave -noupdate -group IN_3 /Main_tb/uut/generator_in_3/i
add wave -noupdate -group IN_3 /Main_tb/uut/generator_in_3/j
add wave -noupdate -group IN_3 /Main_tb/uut/generator_in_3/k
add wave -noupdate -group IN_3 /Main_tb/uut/Arbiter_in_3/select
add wave -noupdate -group IN_3 /Main_tb/uut/Arbiter_in_3/grant
add wave -noupdate -group IN_3 /Main_tb/uut/Arbiter_in_3/request
add wave -noupdate -group W_0 -radix unsigned /Main_tb/uut/generator_w_0/Addr
add wave -noupdate -group W_0 /Main_tb/uut/generator_w_0/i
add wave -noupdate -group W_0 /Main_tb/uut/generator_w_0/j
add wave -noupdate -group W_0 /Main_tb/uut/generator_w_0/k
add wave -noupdate -group W_0 /Main_tb/uut/Arbiter_w_0/select
add wave -noupdate -group W_0 /Main_tb/uut/Arbiter_w_0/grant
add wave -noupdate -group W_0 /Main_tb/uut/Arbiter_w_0/request
add wave -noupdate -group W_1 /Main_tb/uut/generator_w_1/Addr
add wave -noupdate -group W_1 /Main_tb/uut/generator_w_1/i
add wave -noupdate -group W_1 /Main_tb/uut/generator_w_1/j
add wave -noupdate -group W_1 /Main_tb/uut/generator_w_1/k
add wave -noupdate -group W_1 /Main_tb/uut/Arbiter_w_1/select
add wave -noupdate -group W_1 /Main_tb/uut/Arbiter_w_1/grant
add wave -noupdate -group W_1 /Main_tb/uut/Arbiter_w_1/request
add wave -noupdate -group W_2 /Main_tb/uut/generator_w_2/Addr
add wave -noupdate -group W_2 /Main_tb/uut/generator_w_2/i
add wave -noupdate -group W_2 /Main_tb/uut/generator_w_2/j
add wave -noupdate -group W_2 /Main_tb/uut/generator_w_2/k
add wave -noupdate -group W_2 /Main_tb/uut/Arbiter_w_2/select
add wave -noupdate -group W_2 /Main_tb/uut/Arbiter_w_2/grant
add wave -noupdate -group W_2 /Main_tb/uut/Arbiter_w_2/request
add wave -noupdate -group W_3 /Main_tb/uut/generator_w_3/Addr
add wave -noupdate -group W_3 /Main_tb/uut/generator_w_3/i
add wave -noupdate -group W_3 /Main_tb/uut/generator_w_3/j
add wave -noupdate -group W_3 /Main_tb/uut/generator_w_3/k
add wave -noupdate -group W_3 /Main_tb/uut/Arbiter_w_3/select
add wave -noupdate -group W_3 /Main_tb/uut/Arbiter_w_3/grant
add wave -noupdate -group W_3 /Main_tb/uut/Arbiter_w_3/request
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/en}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/i}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/j}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/k}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 000 -radix hexadecimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 000 -radix hexadecimal -childformat {{{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[0]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[1]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[2]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[3]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[4]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[5]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[6]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[7]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[8]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[9]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[10]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[11]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[12]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[13]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[14]} -radix unsigned} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[15]} -radix unsigned}} -subitemconfig {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[0]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[1]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[2]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[3]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[4]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[5]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[6]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[7]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[8]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[9]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[10]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[11]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[12]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[13]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[14]} {-height 15 -radix unsigned} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out[15]} {-height 15 -radix unsigned}} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 000 -radix decimal {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 000 -radix decimal -childformat {{{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[31]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[30]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[29]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[28]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[27]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[26]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[25]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[24]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[23]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[22]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[21]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[20]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[19]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[18]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[17]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[16]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[15]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[14]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[13]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[12]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[11]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[10]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[9]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[8]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[7]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[6]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[5]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[4]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[3]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[2]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[1]} -radix decimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[0]} -radix decimal}} -subitemconfig {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[31]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[30]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[29]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[28]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[27]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[26]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[25]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[24]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[23]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[22]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[21]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[20]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[19]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[18]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[17]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[16]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[15]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[14]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[13]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[12]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[11]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[10]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[9]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[8]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[7]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[6]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[5]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[4]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[3]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[2]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[1]} {-height 15 -radix decimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b[0]} {-height 15 -radix decimal}} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 000 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[0]/u_i/Done}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/en}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/i}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/j}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/k}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 001 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[1]/u_i/result_out}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/en}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/i}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/j}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/k}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/req_in}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/req_w}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/grant_in}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/grant_w}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -expand -group 002 {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -expand -group 002 -radix hexadecimal -childformat {{{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[0]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[1]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[2]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[3]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[4]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[5]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[6]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[7]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[8]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[9]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[10]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[11]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[12]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[13]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[14]} -radix hexadecimal} {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[15]} -radix hexadecimal}} -expand -subitemconfig {{/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[0]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[1]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[2]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[3]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[4]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[5]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[6]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[7]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[8]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[9]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[10]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[11]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[12]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[13]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[14]} {-radix hexadecimal} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out[15]} {-radix hexadecimal}} {/Main_tb/uut/genblk2[0]/genblk1[0]/genblk1[2]/u_i/result_out}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/en}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/i}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/j}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/k}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 010 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/en}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/i}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/j}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/k}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 011 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[1]/u_i/result_out}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/en}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/i}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/j}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/k}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/req_w}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/result_in}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/grant_in}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/grant_w}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -group 012 {/Main_tb/uut/genblk2[0]/genblk1[1]/genblk1[2]/u_i/result_out}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/en}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/en}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/i}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/j}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/k}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 020 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/en}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/i}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/j}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/k}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 021 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[1]/u_i/result_out}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/en}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/i}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/j}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/k}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/req_in}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/req_w}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/grant_in}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/grant_w}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -group 022 {/Main_tb/uut/genblk2[0]/genblk1[2]/genblk1[2]/u_i/result_out}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/en}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/i}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/j}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/k}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 030 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/en}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/i}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/j}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/k}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 031 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[1]/u_i/result_out}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/en}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/i}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/j}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/k}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/req_in}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/req_w}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/grant_in}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/grant_w}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -group 032 {/Main_tb/uut/genblk2[0]/genblk1[3]/genblk1[2]/u_i/result_out}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/en}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/i}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/j}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/k}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 040 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/en}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/i}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/j}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/k}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 041 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[1]/u_i/result_out}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/en}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/i}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/j}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/k}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/req_in}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/req_w}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/grant_in}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/grant_w}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -group 042 {/Main_tb/uut/genblk2[0]/genblk1[4]/genblk1[2]/u_i/result_out}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/en}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/i}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/j}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/k}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/req_in}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/req_w}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/grant_in}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/grant_w}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/Data_in_a}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/Data_in_b}
add wave -noupdate -group 100 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[0]/u_i/result_out}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/en}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/i}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/j}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/k}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/req_in}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/req_w}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/grant_in}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/grant_w}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/Data_in_a}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/Data_in_b}
add wave -noupdate -group 101 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[1]/u_i/result_out}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/en}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/i}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/j}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/k}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/req_in}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/req_w}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/grant_in}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/grant_w}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/Data_in_a}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/Data_in_b}
add wave -noupdate -group 102 {/Main_tb/uut/genblk2[1]/genblk1[0]/genblk1[2]/u_i/result_out}
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/next_state
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/state
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/start
add wave -noupdate -group out_writer -radix decimal -childformat {{{/Main_tb/uut/out_writer/result_wire[0]} -radix decimal -childformat {{{/Main_tb/uut/out_writer/result_wire[0][0]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][1]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][2]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][3]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][4]} -radix decimal}}} {{/Main_tb/uut/out_writer/result_wire[1]} -radix decimal -childformat {{{/Main_tb/uut/out_writer/result_wire[1][0]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][1]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][2]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][3]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][4]} -radix decimal}}}} -subitemconfig {{/Main_tb/uut/out_writer/result_wire[0]} {-height 15 -radix decimal -childformat {{{/Main_tb/uut/out_writer/result_wire[0][0]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][1]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][2]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][3]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[0][4]} -radix decimal}}} {/Main_tb/uut/out_writer/result_wire[0][0]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[0][1]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[0][2]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[0][3]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[0][4]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[1]} {-height 15 -radix decimal -childformat {{{/Main_tb/uut/out_writer/result_wire[1][0]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][1]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][2]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][3]} -radix decimal} {{/Main_tb/uut/out_writer/result_wire[1][4]} -radix decimal}}} {/Main_tb/uut/out_writer/result_wire[1][0]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[1][1]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[1][2]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[1][3]} {-height 15 -radix decimal} {/Main_tb/uut/out_writer/result_wire[1][4]} {-height 15 -radix decimal}} /Main_tb/uut/out_writer/result_wire
add wave -noupdate -group out_writer -radix unsigned /Main_tb/uut/out_writer/addr_a
add wave -noupdate -group out_writer -radix unsigned /Main_tb/uut/out_writer/addr_b
add wave -noupdate -group out_writer -radix unsigned /Main_tb/uut/out_writer/addr_c
add wave -noupdate -group out_writer -radix unsigned /Main_tb/uut/out_writer/addr_d
add wave -noupdate -group out_writer -radix decimal /Main_tb/uut/out_writer/data_a
add wave -noupdate -group out_writer -radix decimal /Main_tb/uut/out_writer/data_b
add wave -noupdate -group out_writer -radix decimal /Main_tb/uut/out_writer/data_c
add wave -noupdate -group out_writer -radix decimal /Main_tb/uut/out_writer/data_d
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/row1_idx
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/col2_idx
add wave -noupdate -group out_writer /Main_tb/uut/out_writer/Row_Col_idx
add wave -noupdate /Main_tb/uut/start_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1365 ps} 0} {{Cursor 2} {1779 ps} 0} {{Cursor 3} {61 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 151
configure wave -valuecolwidth 115
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {133 ps}
