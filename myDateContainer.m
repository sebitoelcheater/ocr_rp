classdef myDateContainer < double

    methods
        % Constructor
        function this = myDataContainer(in)
            if nargin<1 || isempty(in)
                % default: zero
                in = 0;
            end
            this = this@double(in);
        end

        % add datestring functionality
        function str = datestring(this)
            dbl = double(this); %# cast to double to get at the value
            str = datestr(dbl); %# convert
        end
    end
end