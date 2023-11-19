module StringsParser
    module Tokens
        class Key
            attr_reader :key

            def initialize(key)
                @key = key
            end

            def ==(other)
                key = other.key
            end
        end
    end
end
