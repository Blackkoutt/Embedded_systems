create_clock -name clk -period 20.000 [get_ports {clk}]
create_clock -name virt_clk_in -period 20.000
create_clock -name virt_clk_out -period 20.000
derive_pli_clocks -create_base_clocks
derive_clock_uncertainty
set_input_delay -clock { virt_clk_in } -min 0 [get_ports {aclr w[*] }]
set_input_delay -clock { virt_clk_in } -max 1 [get_ports {aclr w[*] }]
set_output_delay -clock { virt_clk_out } -min 0 [get_ports { z[*] }]
set_output_delay -clock { virt_clk_out } -max 1 [get_ports { z[*] }]