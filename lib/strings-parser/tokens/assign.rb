module StringsParser
    module Tokens
        class Assign
            def ==(other)
                other.is_a?(self.class)
            end
        end
    end
end
