# frozen_string_literal: true

RSpec.describe StringsParser::Tokenizer do
    it 'parses single line' do
        string = <<-EOS
            "key" = "value"
        EOS
        tokenizer = StringsParser::Tokenizer.new(string)

        expect(tokenizer.tokens.size).to eq(3)

        expect(tokenizer.tokens[0]).to eq(StringsParser::Tokens::Key.new('key'))
        expect(tokenizer.tokens[1]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[2]).to eq(StringsParser::Tokens::Value.new('value'))
    end

    it 'parses quotes' do
        string = <<-EOS
            "key" = "the \\"quoted\\" value"
        EOS
        tokenizer = StringsParser::Tokenizer.new(string)

        expect(tokenizer.tokens.size).to eq(3)

        expect(tokenizer.tokens[0]).to eq(StringsParser::Tokens::Key.new('key'))
        expect(tokenizer.tokens[1]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[2]).to eq(StringsParser::Tokens::Value.new('the "quoted" value'))
    end

    it 'parses multiple lines #1' do
        string = <<-EOS
            "key1" = "value1";
            "key2" = "value2";
        EOS
        tokenizer = StringsParser::Tokenizer.new(string)

        expect(tokenizer.tokens.size).to eq(6)

        expect(tokenizer.tokens[0]).to eq(StringsParser::Tokens::Key.new('key1'))
        expect(tokenizer.tokens[1]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[2]).to eq(StringsParser::Tokens::Value.new('value1'))

        expect(tokenizer.tokens[3]).to eq(StringsParser::Tokens::Key.new('key2'))
        expect(tokenizer.tokens[4]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[5]).to eq(StringsParser::Tokens::Value.new('value2'))
    end

    it 'parses multiple lines #2' do
        string = <<-EOS
            "key1" = "value1";
            "key2" = "value2";
            "key3" = "value3";
        EOS
        tokenizer = StringsParser::Tokenizer.new(string)

        expect(tokenizer.tokens.size).to eq(9)

        expect(tokenizer.tokens[0]).to eq(StringsParser::Tokens::Key.new('key1'))
        expect(tokenizer.tokens[1]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[2]).to eq(StringsParser::Tokens::Value.new('value1'))

        expect(tokenizer.tokens[3]).to eq(StringsParser::Tokens::Key.new('key2'))
        expect(tokenizer.tokens[4]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[5]).to eq(StringsParser::Tokens::Value.new('value2'))

        expect(tokenizer.tokens[3]).to eq(StringsParser::Tokens::Key.new('key3'))
        expect(tokenizer.tokens[4]).to eq(StringsParser::Tokens::Assign.new)
        expect(tokenizer.tokens[5]).to eq(StringsParser::Tokens::Value.new('value3'))
    end
end
