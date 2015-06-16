describe "bowling game" do
  def score(rolls)
    rolls.reduce(:+)
  end

  it "scores 0 for all gutters" do
    rolls = all_of(0)
    expect(score(rolls)).to eq(0)
  end

  it "scores 20 for all ones" do
    rolls = all_of(1)
    expect(score(rolls)).to eq(20)
  end

  it "scores spares of 5 and 5" do
    rolls = all_of(5, 21)
    score = rolls.reduce(:+)
    index = 3
    while index < rolls.size
      score += rolls[index]
      index += 2
    end
    expect(score).to eq(150)
  end

  it "scores spares of 6 and 4" do
    rolls = frames_with(6, 4) + [6]
    score = rolls.reduce(:+)
    index = 3
    while index < rolls.size
      score += rolls[index]
      index += 2
    end
    expect(score).to eq(160)
  end

  def all_of(roll, rolls=20)
    (1..rolls).map { roll }
  end

  def frames_with(first, second)
    (1..10).map { [first, second] }.flatten
  end
end
