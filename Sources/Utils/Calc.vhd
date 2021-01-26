package Calc is
	function LOG2 (x: NATURAL) return INTEGER;
	function MAX (x: INTEGER; y: INTEGER) return INTEGER;
	function MIN (x: INTEGER; y: INTEGER) return INTEGER;
end package ; -- Calc

package body Calc is
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
	
    function MAX (x: INTEGER; y: INTEGER) return INTEGER is
    begin
        if x > y then
            return x;
        else
            return y;
        end if;
    end function MAX;
	
    function MIN (x: INTEGER; y: INTEGER) return INTEGER is
    begin
        if x < y then
            return x;
        else
            return y;
        end if;
    end function MIN;

end Calc ;
