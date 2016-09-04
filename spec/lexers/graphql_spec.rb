# -*- coding: utf-8 -*- #

describe Rouge::Lexers::GraphQL do
  let(:subject) { Rouge::Lexers::GraphQL.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.graphql'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'application/graphql'
    end
  end
end
