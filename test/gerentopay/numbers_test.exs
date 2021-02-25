defmodule Gerentopay.NumbersTest do
  use ExUnit.Case
  alias Gerentopay.Numbers
  describe "sum_from_file/1" do
    test "when a file exists (name given), so returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 78}}

      assert response == expected_response
    end
    test "when a file does not exists, so returns an error" do
      response = Numbers.sum_from_file("nofile")

      expected_response = {:error, %{message: "Invalid File!"}}

      assert response == expected_response
    end
  end
end
