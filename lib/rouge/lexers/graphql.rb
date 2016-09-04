# -*- coding: utf-8 -*- #

module Rouge
  module Lexers
    class GraphQL < RegexLexer
      title "GraphQL"
      desc %q(<desc for="this-lexer">GraphQL</desc>)
      tag 'graphql'
      filenames *%w(*.graphql)
      mimetypes *%w(
        application/graphql
      )

      def self.keywords
        @keywords ||= Set.new %w(
          fragment fragments on
        )
      end

      def self.constants
        @constants ||= Set.new %w(
          true false
        )
      end

      state :root do
        rule /#.*/, Comment::Single

        rule /"(?:\\.|[^\\"])*"/m, Str

        rule /(?:\B-|\b)\d+(?:\.\d+)?(?:[eE][+-]?\d+)?\b/, Num

        rule /\$[a-z_]\w*/i, Name::Variable

        rule /@[a-z_]\w*/i, Name::Function

        rule /!|=|\.{3}/, Operator

        rule /[!(){}\[\]:=,]/, Punctuation

        rule /\S+/, Text

        rule /\s+/, Text::Whitespace
      end
    end
  end
end
