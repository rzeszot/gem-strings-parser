module StringsParser
    module Tokens
        class Value
            attr_reader :value

            def initialize(value)
                @value = value
            end

            def ==(other)
                value = other.value
            end
        end
    end
end
