onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/OpCode
add wave -noupdate -radix unsigned /datapath_tb/Rs
add wave -noupdate -radix unsigned /datapath_tb/Rt
add wave -noupdate -radix unsigned /datapath_tb/Rd
add wave -noupdate -radix unsigned /datapath_tb/constante
add wave -noupdate -radix unsigned /datapath_tb/dado_entrada
add wave -noupdate /datapath_tb/BCte
add wave -noupdate /datapath_tb/DEntULA
add wave -noupdate /datapath_tb/clk
add wave -noupdate /datapath_tb/clear
add wave -noupdate -radix unsigned /datapath_tb/dado_saida
add wave -noupdate -radix unsigned /datapath_tb/saida_end
add wave -noupdate -radix unsigned /datapath_tb/saida_final
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {183 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {120137 ps}
