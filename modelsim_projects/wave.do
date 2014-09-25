onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /serial_adder/a
add wave -noupdate /serial_adder/b
add wave -noupdate /serial_adder/clk
add wave -noupdate /serial_adder/en
add wave -noupdate /serial_adder/S
add wave -noupdate /serial_adder/cout
add wave -noupdate /serial_adder/done
add wave -noupdate /serial_adder/state
add wave -noupdate /serial_adder/carry
add wave -noupdate /serial_adder/sum
add wave -noupdate /serial_adder/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 90
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
configure wave -timelineunits ns
update
WaveRestoreZoom {101 ns} {122 ns}
