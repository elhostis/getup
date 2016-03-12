class SousactiviteImage < ActiveRecord::Base
	include RankedModel
	ranks :row_order	
end
