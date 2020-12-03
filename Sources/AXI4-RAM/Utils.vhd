package Utils is
	function LOG2 (x: NATURAL) return INTEGER;
end package ; -- Utils

package body Utils is
	function LOG2(x : natural) return integer is
		variable i  : integer := 0;
	  	variable val: integer := 1;
	begin
		if x = 0 then
			return 0;
	  	else
	    	for j in 0 to 29 loop
	      		if val >= x then
					null;
	      		else
	        		i := i+1;
	        		val := val*2;
	      		end if;
	    	end loop;
	    	assert val >= x
	      		report "Function log2 received argument larger" &
	               	   " than its capability of 2^30. "
	      		severity failure;
	    	return i;
		end if;
	end function LOG2;
end Utils ;
