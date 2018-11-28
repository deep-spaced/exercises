defmodule GameTest do
  use ExUnit.Case
  doctest Hangman.Game

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new_game returns only a string" do

    game = Game.new_game()
    letters = game.letters |> List.to_string

    assert Regex.match?(~r/^[a-z]+$/, letters) == true
  end

  test "state hasn't changed for :won and lost game" do

    for state <- [ :won, :lost ] do
      game = Game.new_game |> Map.put(:game_state, state)
      assert { ^game, _ } = Game.make_move(game, "blah")
    end
  end

  test "first occurrence of a letter is not already used" do
    game = Game.new_game
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

  test "second occurrence of a letter is already used" do
    game = Game.new_game
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used

    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "good guess is recognized" do
    game = Game.new_game("wibble")
    { game, _ } = Game.make_move(game, "w")

    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a guessed word is a won game" do
    game = Game.new_game("wibble")
    { game, _ } = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    { game, _ } = Game.make_move(game, "i")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    { game, _ } = Game.make_move(game, "b")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    { game, _ } = Game.make_move(game, "l")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    { game, _ } = Game.make_move(game, "e")
    assert game.game_state == :won
    assert game.turns_left == 7
  end
end
