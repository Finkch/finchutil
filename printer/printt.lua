--[[pod_format="raw",created="2024-07-06 18:27:50",modified="2024-07-06 18:59:24",revision=8]]
--[[
	converts things to string.
	table are formatted, rather than giving address.
]]

-- prints, casting to string and formatting tables
function printt(p)
	print(to_string(p, 0))
end

-- casts to string and formats tables
function to_string(p, indents)
	if (type(p) == "table") return table_to_string(p, indents)
	return tostr(p)
end

-- formats tables
function table_to_string(p, indents)
	local str = ""
	
	-- prints table as a hash
	if (p[1] == nil) then -- this works most of the time to differentiate tables
		for k, v in pairs(p) do
			str ..= "\n"	
	
			for j = 1, indents do
				str ..= "\t"
			end
			
			str ..= "->\t" .. k .. ":\t" .. to_string(v, indents + 1)	
		end
		
	-- prints table as array
	else
		for i = 1, #p do
			str ..= "\n"	
	
			for j = 1, indents do
				str ..= "\t"
			end
			
		
			str ..= "->\t" .. to_string(p[i], indents + 1)	
		end

	end

	return str
end