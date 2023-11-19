# frozen_string_literal: true

require_relative 'strings-parser/version'
require_relative 'strings-parser/tokenizer'
require_relative 'strings-parser/tokens/assign'
require_relative 'strings-parser/tokens/key'
require_relative 'strings-parser/tokens/value'

module StringsParser
    class Error < StandardError
    end
end
