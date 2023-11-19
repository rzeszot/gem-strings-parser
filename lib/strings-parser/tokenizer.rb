require 'strscan'
require 'byebug'

module StringsParser
    class Tokenizer
        attr_reader :tokens

        def initialize(content)
            @buffer = StringScanner.new(content)
            @tokens = []
            tokenize
        end

        def tokenize
            until @buffer.eos?
                skip_whitespaces
                tokenize_element
            end
        end

        def last
            @tokens.last
        end

        def skip_whitespaces
            @buffer.skip(/\s+/)
        end

        def tokenize_element
            case @buffer.peek(1)
            when '"'
                tokens << find_string
            when '='
                tokens << find_assign
            when ';'
                find_semicolon
            else
                return if @buffer.eos?
                fail
            end
        end

        def find_string
            @buffer.getch
            string = @buffer.scan_until(/[^\\]"/)

            klass = if last.is_a?(Tokens::Assign)
                Tokens::Value
            else
                Tokens::Key
            end

            klass.new(string.sub('"', ''))
        end

        def find_assign
            @buffer.getch
            Tokens::Assign.new
        end

        def find_semicolon
            @buffer.getch
        end
    end
end
