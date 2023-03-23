-- Trabalho de Sistemas Digitais Avançados
-- Testbench 
-- Fabricio Teixeira, Marina Cruzeiro

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use STD.textio.all;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------

ENTITY datapath_TB IS
END datapath_TB;

----------------------------------------------------------------------------

ARCHITECTURE rtl OF datapath_TB IS

COMPONENT datapath IS

	PORT (
			OpCode : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			Rs, Rt, Rd : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			constante, dado_entrada : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			BCte, DEntULA, clock, clear : IN STD_LOGIC;
			dado_saida, saida_end, saida_final : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);
			
END COMPONENT;
----------------------------------------------------------------------------

-- Funcao de String para STD_LOGIC_VECTOR:
function str_to_stdvec(inp: string) return std_logic_vector is
	variable temp: std_logic_vector(inp'range);
	begin
		for i in inp'range loop
			if (inp(i) = '1') then
					temp(i):= '1';
			elsif(inp(i)='0') then
		      temp(i):= '0';
			end if;
		end loop;
		return temp; 
end function str_to_stdvec;

-- Funcao de STD_LOGIC_VECTOR para string:
function stdvec_to_str(inp: std_logic_vector) return string is
	variable temp: string(inp'left+1 downto 1);
	begin
		for i in inp'reverse_range loop
			if (inp(i) = '1') then
					temp(i+1):= '1';
			elsif(inp(i)='0') then
					temp(i+1):= '0';
			end if;
		end loop;
		return temp; 
end function stdvec_to_str;
----------------------------------------------------------------------------

-- Signals para cada entrada/saída do datapath:
SIGNAL OpCode : STD_LOGIC_VECTOR (5 DOWNTO 0);
SIGNAL Rs, Rt, Rd : STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL constante, dado_entrada : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL BCte, DEntULA, clk, clear : STD_LOGIC;
SIGNAL dado_saida, saida_end, saida_final : STD_LOGIC_VECTOR (7 DOWNTO 0);

----------------------------------------------------------------------------

BEGIN
	
	-- Port Map:
	datapathTB: datapath PORT MAP (OpCode => OpCode, Rs => Rs, Rt => Rt, Rd => Rd, constante => constante, 
								dado_entrada => dado_entrada, BCte => BCte, DEntULA => DEntULA, clock => clk, clear => clear, 
								dado_saida => dado_saida, saida_end => saida_end, saida_final => saida_final);

	-- Process para ler informacoes do arquivo:
	Process1_read: PROCESS
	
		file fileType : text;
		variable inType : std_logic_vector(39 downto 0);
		variable str_type : string(40 downto 1);
		variable lineType : line;
		
		BEGIN
		FILE_OPEN(fileType,"entrada.txt",READ_MODE);

			WAIT UNTIL (rising_edge(clk));
				readline(fileType,lineType);
				read(lineType,str_type);
				inType := str_to_stdvec(str_type);	
				
				OpCode		<= inType(39 DOWNTO 34);
				Rs 			<= inType(33 DOWNTO 29);
				Rt				<= inType(28 DOWNTO 24);
				Rd				<= inType(23 DOWNTO 19);
				BCte			<= inType(18);
				DentULA		<= inType(17);
				clear			<= inType(16);
				constante	<= inType(15 DOWNTO 8);
				dado_entrada<= inType(7 DOWNTO 0);
		
	END PROCESS;
	
	-- Process para escrever o resultado em arquivo:
	Process2_write: PROCESS
		
		file outFile : text;
		variable out1 : std_logic_vector(7 downto 0);
		variable str_out1 : string(8 downto 1);
		variable out_line : line;
		
		BEGIN
			FILE_OPEN(outFile,"saida.txt",WRITE_MODE);
	
			WAIT UNTIL (falling_edge(clk));
				out1 := saida_final;
				str_out1 := stdvec_to_str(out1);
				write(out_line,str_out1);
				writeline(outFile,out_line);
		END PROCESS;
		
	
	-- Process para o clock:
	Process3_clock: PROCESS
		
		BEGIN
	
		clk <= '1', '0' AFTER 5 ns;
		WAIT FOR 10 ns;
		
	END PROCESS;

END rtl;