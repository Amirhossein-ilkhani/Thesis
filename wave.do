onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /GMM_tb/clk
add wave -noupdate /GMM_tb/rst
add wave -noupdate /GMM_tb/en
add wave -noupdate /GMM_tb/req_in
add wave -noupdate -radix unsigned /GMM_tb/grant_in
add wave -noupdate /GMM_tb/req_w
add wave -noupdate /GMM_tb/grant_w
add wave -noupdate -radix hexadecimal /GMM_tb/Data_in_a
add wave -noupdate -radix hexadecimal /GMM_tb/Data_in_b
add wave -noupdate -radix unsigned /GMM_tb/uut/Distributer_ins/ps
add wave -noupdate -radix unsigned /GMM_tb/uut/Distributer_ins/ns
add wave -noupdate /GMM_tb/uut/Distributer_ins/ps_i
add wave -noupdate /GMM_tb/uut/Distributer_ins/ns_i
add wave -noupdate /GMM_tb/uut/Distributer_ins/ps_w
add wave -noupdate /GMM_tb/uut/Distributer_ins/ns_w
add wave -noupdate -radix unsigned /GMM_tb/uut/addr_lbf_a
add wave -noupdate -radix unsigned -childformat {{{/GMM_tb/uut/addr_lbf_b[5]} -radix unsigned} {{/GMM_tb/uut/addr_lbf_b[4]} -radix unsigned} {{/GMM_tb/uut/addr_lbf_b[3]} -radix unsigned} {{/GMM_tb/uut/addr_lbf_b[2]} -radix unsigned} {{/GMM_tb/uut/addr_lbf_b[1]} -radix unsigned} {{/GMM_tb/uut/addr_lbf_b[0]} -radix unsigned}} -subitemconfig {{/GMM_tb/uut/addr_lbf_b[5]} {-height 15 -radix unsigned} {/GMM_tb/uut/addr_lbf_b[4]} {-height 15 -radix unsigned} {/GMM_tb/uut/addr_lbf_b[3]} {-height 15 -radix unsigned} {/GMM_tb/uut/addr_lbf_b[2]} {-height 15 -radix unsigned} {/GMM_tb/uut/addr_lbf_b[1]} {-height 15 -radix unsigned} {/GMM_tb/uut/addr_lbf_b[0]} {-height 15 -radix unsigned}} /GMM_tb/uut/addr_lbf_b
add wave -noupdate -radix unsigned /GMM_tb/uut/Addr_in_a
add wave -noupdate -radix unsigned /GMM_tb/uut/Addr_in_b
add wave -noupdate -radix hexadecimal /GMM_tb/uut/ram_inst/ram
add wave -noupdate /GMM_tb/uut/Done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {600 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 169
configure wave -valuecolwidth 100
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
WaveRestoreZoom {334 ps} {490 ps}
