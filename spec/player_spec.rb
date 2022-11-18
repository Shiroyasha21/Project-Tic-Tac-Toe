# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  context 'when executing #move' do
    subject(:taken_moves) { described_class.new('player', 'X') }
    
    it 'it add the move to player_moves array' do
      move_taken = 1
      array = taken_moves.move(move_taken)
      expect(taken_moves.player_moves.length).to eq(1)
    end
  end
end